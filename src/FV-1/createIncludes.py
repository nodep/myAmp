import os

projFiles = (
('progs\\a01.spj', 'out\\a01.hex'),
('progs\\a02.spj', 'out\\a02.hex'),
('progs\\a03.spj', 'out\\a03.hex'),
('progs\\a04.spj', 'out\\a04.hex'),
('progs\\a05.spj', 'out\\a05.hex'),
('progs\\a06.spj', 'out\\a06.hex'),
('progs\\a07.spj', 'out\\a07.hex'),
('progs\\a08.spj', 'out\\a08.hex'),
('progs\\a09.spj', 'out\\a09.hex'),
('progs\\a10.spj', 'out\\a10.hex'),
('progs\\a11.spj', 'out\\a11.hex'),
('progs\\a12.spj', 'out\\a12.hex'),
('progs\\a13.spj', 'out\\a13.hex'),
('progs\\a14.spj', 'out\\a14.hex'),
('progs\\a15.spj', 'out\\a15.hex'),
('progs\\a16.spj', 'out\\a16.hex'),
('progs\\a17.spj', 'out\\a17.hex'),
('progs\\a18.spj', 'out\\a18.hex'),
('progs\\a19.spj', 'out\\a19.hex'),
('progs\\a20.spj', 'out\\a20.hex'),
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

	source = '// program: ' + name + '\n'

	fromByte = program * 0x200
	toByte = fromByte + 512
	binary = bankData[fromByte:toByte]
	
	# get the length of the program excluding NOPs (0x00 0x00 0x00 0x11)
	programLength = 0
	for bcnt in range(0, 512, 4):
		if binary[bcnt:bcnt + 4] != [ 0x00, 0x00, 0x00, 0x11 ]:
			programLength = bcnt + 4

	# print it out in c
	for byteCnt in range(0, programLength):

		byte = binary[byteCnt]

		source += '0x%02x,' % byte

		# end of line
		if byteCnt % 16 == 15:
			source += '\t// 0x%04x\n' % (byteCnt - 15)

	
	return source

################################################################

currDirLen = len(os.getcwd())

# iterate the SPJ files
for projFileNames in projFiles:
	# get the list of spn files in the spj
	spnFiles = []
	with open(projFileNames[0], 'rt', encoding='utf-8') as inspj:
		line = inspj.readline()
		numSpns = int(line.split(':')[1])
		for lineNum in range(0, numSpns):
			line = inspj.readline()
			spnFileName = line.split(',')[0]
			spnFiles.append(spnFileName[currDirLen + 1:])

	# load the hex file for this spj file
	bankData = loadBank(projFileNames[1])

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