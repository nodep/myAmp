import os

spjFiles = (
'progs\\a01.spj',
'progs\\a02.spj',
'progs\\a03.spj',
'progs\\a04.spj',
'progs\\a05.spj',
'progs\\a06.spj',
'progs\\a07.spj',
'progs\\a08.spj',
'progs\\a09.spj',
'progs\\a10.spj',
'progs\\a11.spj',
'progs\\a12.spj',
'progs\\a13.spj',
'progs\\a14.spj',
'progs\\a15.spj',
'progs\\a16.spj',
'progs\\a17.spj',
'progs\\a18.spj',
'progs\\a19.spj',
'progs\\a20.spj',
)

def decodeLine(lineNum, line):

	line = line.strip()

	if line[0] != ':':
		raise Exception('line in HEX file does not begin with :')

	byteCount = int(line[1:3], 16)
	address	= int(line[3:7], 16)
	recordType = int(line[7:9], 16)
	if byteCount > 0:
		data = line[9:9 + byteCount*2]
	else:
		data = ''

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
		raise Exception('checksum mismatch in line ' + str(lineNum))

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

def loadBank(hexFileName):

	print('reading', hexFileName)
	
	bankData = [0] * 4096

	with open(hexFileName) as inh:
		for lineNum, line in enumerate(inh):
			address, data = decodeLine(lineNum + 1, line)
			setData(bankData, address, data)

	return bankData

def getSourceForProgram(bankData, program, name):

	source = '// program: ' + name + '\n{\n'

	# print it out in c
	prog_offset = program * 0x200
	index = 0
	for byte in bankData[prog_offset : prog_offset + 0x200]:

		source += '0x%02x,' % byte

		# end of line
		if index % 16 == 15:
			source += '\t// 0x%04x\n' % (index - 15)

		index += 1

	
	return source + '},'

################################################################

currDirLen = len(os.getcwd())

# iterate the SPJ files
for spjFileName in spjFiles:
	# get the list of spn files in the spj
	spnFiles = []
	with open(spjFileName) as inspj:
		line = inspj.readline()
		numSpns = int(line.split(':')[1])
		for lineNum in range(0, numSpns):
			line = inspj.readline()
			spnFileName = line.split(',')[0]
			spnFiles.append(spnFileName[currDirLen + 1:])

	# load the hex file for this spj file
	hexFileName = spjFileName[:-3] + 'hex'
	bankData = loadBank(hexFileName)

	# write the hex output for the spn files
	program_num = 0
	for spnFileName in spnFiles:
		source = getSourceForProgram(bankData, program_num, spnFileName)
		incFileName = spnFileName[:-3] + 'h'

		print ('writing:', incFileName)
		with open(incFileName, 'w') as incfile:
			incfile.write(source)
			
		program_num += 1

print ('done!')