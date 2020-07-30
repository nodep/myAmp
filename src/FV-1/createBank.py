bankFiles = (
'hex\\a01.hex',
'hex\\a02.hex',
'hex\\a03.hex',
'hex\\a04.hex',
'hex\\a05.hex',
'hex\\a06.hex',
'hex\\a07.hex',
)

def decodeLine(lineNum, line):

    line = line.strip()

    if line[0] != ':':
        raise Exception("line in HEX file doesn't begin with :")

    byteCount  = int(line[1:3], 16)
    address    = int(line[3:7], 16)
    recordType = int(line[7:9], 16)
    if byteCount > 0:
        data   = line[9:9 + byteCount*2]
    else:
        data   = ''

    sum = 0
    index = 1
    while index < len(line) - 2:
        sum += int(line[index:index + 2], 16)
        index += 2

    if recordType != 0  and  recordType != 1:
        raise Exception('unsupported record type ' + str(recordType))

    # calc checksum
    sumStr = '0000000' + '{0:b}'.format(sum)
    sumStr = sumStr.replace('0', 'z')
    sumStr = sumStr.replace('1', '0')
    sumStr = sumStr.replace('z', '1')
    sumStr = hex(int(sumStr[-8:], 2) + 1)
    sumStr = sumStr.replace('x', '0')
    sumStr = sumStr[-2:]
    if int(sumStr, 16) != int(line[-2:], 16):
        raise Exception("checksum mismatch in line " + str(lineNum))

    # make the data list
    dataList = []
    while data:
        dataList.append(int(data[0:2], 16))
        data = data[2:]

    return (address, dataList)

def setData(bankData, address, data):

    offset = 0
    for byte in data:
        bankData[address + offset] = byte
        offset += 1

def getSourceForBank(bankData, hexFileName):

    lines = ['{']

    # print it out in c
    index = 0
    for byte in bankData:

        # beginning of program
        if index % 0x200 == 0:
            lines.append('// program %i from file %s' % (index / 0x200, hexFileName))

        # beginning of line
        if index % 16 == 0:
            lines.append('\t')

        lines[-1] += '0x%02x, ' % byte

        # end of line
        if index % 16 == 15:
            lines[-1] += '\t// 0x%04x' % (index - 15)

        index += 1

    lines.append('},')

    return lines

def loadBank(hexFileName):

    bankData = [0] * 4096

    with open(hexFileName) as inh:
        for lineNum, line in enumerate(inh):
            address, data = decodeLine(lineNum + 1, line)
            setData(bankData, address, data)

    return bankData

################################################################

if len(bankFiles) > 7:
    raise Exception('we accept a max of 7 HEX bank files')
    
print('writing banks.c')

with open('banks.c', 'w') as outc:
    outc.write('#include <avr/pgmspace.h>\n')
    outc.write('\n')
    outc.write('#include "banks.h"\n')
    outc.write('\n')
    outc.write('// this file is generated by createBank.py\n')
    outc.write('\n')
    outc.write('const unsigned char fv1Banks[NUM_BANKS][0x1000] PROGMEM =\n')
    outc.write('{\n')

    for hexFileName in bankFiles:
        bankData = loadBank(hexFileName)
        lines = getSourceForBank(bankData, hexFileName)
        outc.write('////////////////////////////////////\n')
        outc.write('// bank from file %s\n' % hexFileName)
        outc.write('////////////////////////////////////\n')
        for line in lines:
            outc.write(line + '\n')

    outc.write('};\n')

print('writing banks.h')

with open('banks.h', 'w') as outh:
    outh.write('#pragma once\n');
    outh.write('\n')
    outh.write('// this file is generated by createBank.py\n')
    outh.write('\n')
    outh.write('#define NUM_BANKS       %i\n' % len(bankFiles))
    outh.write('\n')
    outh.write('extern const unsigned char fv1Banks[NUM_BANKS][0x1000] PROGMEM;\n')

print('done!')
