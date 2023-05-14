import sys
import os
import pathlib
import json

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

	# get the length of the program excluding NOPs (0x00 0x00 0x00 0x11)
	programLength = 0
	for bcnt in range(0, 512, 4):
		if bankData[bcnt:bcnt + 4] != [ 0x00, 0x00, 0x00, 0x11 ]:
			programLength = bcnt + 4

	source += '.binary_length = %i,\n' % programLength
	source += '.binary = {\n'
	
	# print it out in c
	prog_offset = program * 0x200
	for byteCnt in range(0, programLength):

		byte = bankData[prog_offset + byteCnt]

		source += '0x%02x,' % byte

		# end of line
		if byteCnt % 16 == 15:
			source += '\t// 0x%04x\n' % (byteCnt - 15)

	
	return source + '},'

################################################################

# currDirLen = len(os.getcwd())

prog_cnt = 0

# first output the ROM programs

ROMprograms = [
	{
		"name": "Chorus",
		"controls": [ "Reverb", "Rate", "Level" ],
		"params": [ 0xff, 0x800, 0x400, 0x400 ],
		"prog_num": 0,
	},
	{
		"name": "Flange",
		"controls": [ "Reverb", "Rate", "Level" ],
		"params": [ 0xff, 0x800, 0x400, 0x400 ],
		"prog_num": 1,
	},
	{
		"name": "Tremolo",
		"controls": [ "Reverb", "Rate", "Level" ],
		"params": [ 0xff, 0x800, 0x400, 0x400 ],
		"prog_num": 2,
	},
	{
		"name": "Pitch shift",
		"controls": [ "Pitch" ],
		"params": [ 0xff, 0x800, 0x400, 0x400 ],
		"prog_num": 3,
	},
	{
		"name": "Pitch echo",
		"controls": [ "pitch", "delay", "mix" ],
		"params": [ 0xff, 0x800, 0x400, 0x400 ],
		"prog_num": 4,
	},
	{
		"name": "Reverb 1",
		"controls": [ "time", "HF filter", "LF filter" ],
		"params": [ 0x80, 0x800, 0x800, 0x800 ],
		"prog_num": 6,
	},
	{
		"name": "Reverb 2",
		"controls": [ "time", "HF filter", "LF filter" ],
		"params": [ 0x80, 0x800, 0x800, 0x800 ],
		"prog_num": 7,
	},
]

# variables
str2vars = {}
usedVars = set()
binaryLengths = {}
scriptPath = pathlib.Path(__file__).parent.resolve()
usedBytes = 0
usedParams = set()

def cleanName(s, prefix):
	out = prefix + s
	for c in [' ', '/', '-', '+', ':', '&', '(', ')', '!', '.', ',', '\\', '<', '>']:
		out = out.replace(c, '_')

	return out

def getParamsName(params):
	return 'param_%02x_%04x_%04x_%04x' % (params[0], params[1], params[2], params[3])

def getVarNameFromString(s):

	if s == '-':
		return 'nullptr'

	if s in str2vars:
		return str2vars[s]

	defName = cleanName(s, 'str_')
	varName = defName

	# make a unique var name for this string
	cnt = 0
	while varName in usedVars:
		varName = defName + '_' + str(cnt)
		cnt += 1
	
	if cnt > 0:
		print ('info: "overloading" variable', defName)
	
	usedVars.add(varName)
	str2vars[s] = varName
	
	return varName

def isValidProgram(prog):
	
	# is the program internal?
	if 'download' not in prog:
		return True

	retVal = False
	if 'spn' in prog['download']:
		includeFile = prog['download']['spn']['file']
		if includeFile[-3:].lower() == 'spn':
			retVal = True

	if 'categories' in prog  and  'Code snippet' in prog['categories']:
		retVal = False		
	
	return retVal

def defineString(s, outf):
	global usedBytes
	
	if s not in str2vars  and  s != '-':
		outf.write('const char {}[] PROGMEM = "{}";\n'.format(getVarNameFromString(s), s))		
		usedBytes += len(s) + 1

def defineStringVariables(progs, outf):
	for prog in progs:
		if isValidProgram(prog):
			defineString(prog['name'], outf)
			if 'controls' in prog:
				for ctrl in prog['controls']:
					defineString(ctrl, outf)

def getIncludeFileName(prog):
	if 'download' in prog  and  'spn' in prog['download']:
		includeFile = prog['download']['spn']['file']
		includeFile = includeFile[0:-3] + 'h'
		return includeFile
		
	return ''
	
def outputProgram(prog, outf):

	global usedBytes

	if not isValidProgram(prog):
		print ('skipping invalid program:', prog['name'])
		return
		
	outf.write('{\n')
	outf.write('.name = {},\n'.format(getVarNameFromString(prog['name'])))
	potNames = ''
	potCnt = 0
	if 'controls' in prog:
		for potName in prog['controls']:
			if potNames != '':
				potNames += ', '
			potNames += getVarNameFromString(potName);
			
		potCnt = len(prog['controls'])

		for c in range(potCnt, 3):
			if potNames != '':
				potNames += ', '
			potNames += 'nullptr'
	else:
		# unknown controls
		unknownVarName = getVarNameFromString('<unknown>')
		potNames = '{}, {}, {}'.format(unknownVarName, unknownVarName, unknownVarName)
	
	outf.write('.pot_names = {' + potNames + '},\n')
	if 'params' in prog:
		outf.write('.params = &{},\n'.format(getParamsName(prog['params'])))
	else:
		outf.write('.params = &default_params,\n')

	# get the binary of the program
	includeFile = getIncludeFileName(prog)
	if includeFile != '':
		varName = cleanName(includeFile, 'bin_')
		binaryLength = binaryLengths[varName]
		outf.write('.binary_length = {},\n'.format(binaryLength))
		outf.write('.binary = {}\n'.format(varName))
		usedBytes += binaryLength
	else:
		outf.write('.binary_length = {},\n'.format(prog['prog_num']))
		outf.write('.binary = nullptr,\n')
	
	outf.write('},\n')

def outputBinaries(progs, outf):

	outf.write('\n')

	for prog in progs:
		if isValidProgram(prog):
			includeFile = getIncludeFileName(prog)
			with open(os.path.join(scriptPath, 'spn', includeFile), 'r') as inf:
				binary = inf.read()
			binaryLength = binary.count(',')
			varName = cleanName(includeFile, 'bin_')
			binaryLengths[varName] = binaryLength
			outf.write('const uint8_t %s[0x%02x] PROGMEM = {\n' % (varName, binaryLength))
			outf.write(binary.strip() + '\n')
			outf.write('};\n\n')


def outputProgParams(progs, outf):

	global usedBytes
	
	outf.write('\n')

	for prog in progs:
		if isValidProgram(prog)  and  'params' in prog:
			paramName = getParamsName(prog['params'])
			if paramName not in usedParams:
				outf.write('const ProgParams %s PROGMEM = { .mix = 0x%02x, .pots = {0x%04x, 0x%04x, 0x%04x} };\n' % (paramName, prog['params'][0], prog['params'][1], prog['params'][2], prog['params'][3]))
				usedParams.add(paramName)
				usedBytes += 7

jsonFile = os.path.join(scriptPath, 'programs.json')
print ('reading programs from:', jsonFile)

with open(jsonFile, 'r') as inf:
	extPrograms = json.load(inf)

outputCpp = sys.argv[1]
print ('writing cpp file:', outputCpp)
with open(outputCpp, 'wt') as outf:

	outf.write('// this file is automatically generated by json2cpp.py\n')
	outf.write('\n')

	defineStringVariables(ROMprograms, outf)
	defineStringVariables(extPrograms, outf)
	defineString('<unknown>', outf)

	numPrograms = 7
	for prog in extPrograms:
		if isValidProgram(prog):
			numPrograms += 1

	outputBinaries(extPrograms, outf)

	outputProgParams(ROMprograms, outf)
	outputProgParams(extPrograms, outf)
	
	usedBytes += numPrograms * 14	# 14 == sizeof(Program)

	outf.write('\n')
	outf.write('const uint8_t num_fv1_programs = {};\n'.format(numPrograms))
	outf.write('\n')
	outf.write('const Program fv1_programs[{}] PROGMEM =\n'.format(numPrograms))
	outf.write('{\n')
	
	for prog in ROMprograms:
		outputProgram(prog, outf)

	for prog in extPrograms:
		outputProgram(prog, outf)

	outf.write('};\n')

print ('used bytes', usedBytes)