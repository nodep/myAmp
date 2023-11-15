import sys
import os
import pathlib
import json

# we also want to access FV1's ROM programs

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
		"params": [ 0x20, 0x800, 0x800, 0x800 ],
		"prog_num": 6,
	},
	{
		"name": "Reverb 2",
		"controls": [ "time", "HF filter", "LF filter" ],
		"params": [ 0x20, 0x800, 0x800, 0x800 ],
		"prog_num": 7,
	},
]

# we want these programs to come right after the ROMs
goodPrograms = [
	'Hall Reverb with Shimmer',
	'Reverb + Shimmer v6',
	'Chorus (SpinSemi demo)',
	'Echo with Repeats',
	'Echo',
	'Flanger (SpinSemi demo)',
	'Phase shifter',
	'Tremolo',
	'Vibrato (after strike)',
	'Wah',
	'Reverb+HP+LP',
	'Reverb+Flange+LP',
	'Reverb+Pitch+LP',
	'Hall Reverb',					# wo
	'Room Reverb',					# wo
	'Plate Reverb (SpinSemi 3K)',	# wo
	'Gated Reverb',					# wo
	'Echo Reverb',					# wo
	'Stereo Echo Reverb',			# wo
	'Chorus Reverb',
	'Flanger (SpinSemi 3K)',		# wo
	'Pitch + Reverb for karaoke apps',
	'Reverb/RT/D/F',				# wo
	'Plate Reverb: Very Tight',		# wo
	'Plate Reverb: Tight',			# wo
	'Plate Reverb: Lush',			# wo
	'Dual LFO Chorus',				# wo
	'Dtr shimmer reverb',			# wo
	'Dtr v filter v damping',		# wo
	'Dtr v filter v predelay',		# wo
	'Dtr v predelay v damping 1k',	# wo
	'Dtr v predelay v damping 2k',	# wo
	'Dtr v predelay v damping 4k',	# wo
	'Dtr v predelay v damping 8k',	# wo
	'Dtr v predelay v damping 500',	# wo
	'Dtr 1oct pitch ip fb 2k',		# wo
	'Dtr 1oct pitch ip 4k',			# wo
	'Dtr v pitch ip fb 4k',			# wo
	'Dtr v pitch ip 4k',			# wo
	'Dtr shimmer val lvl',			# wo
	'Dtr v predelay',				# wo
	'Single Head Tape Echo + Spring Reverb',
	'Dual Head Tape Echo + Spring Reverb',
	'Single Head Tape Echo + Spring Reverb w/ Ping Pong',
	'Dual Head Tape Echo + Spring Reverb w/ Ping Pong',
	'Single Head Tape Echo',
	'Single Head Tape Echo + Reverb',
	'Ping Pong',
	'Ping Pong 2:1',
	'Dual Head Tape Echo + Reverb, w/ Ping Pong',
	'Dual Head Tape Echo + Reverb',
	'Stereo Pitch Transposer w/ Feedback and Delay',
	'Ping Pong: Basic Wonky',
	'Ping Pong: Basic',
	'Ping Pong: Stereo with Dual Taps',
	'Ping Pong with Dual Taps',
	'Ping Pong: Simple',
	'Ping Pong: Simple Stereo',
	'Ping Pong: Triple',
	'Triple Tap Cascaded Delay',			# wo
	'Triple Tap Cascaded Delay - Stereo',			# wo
	'Triple Tap Cascaded Delay - Stereo w/ Chorus',			# wo
	'Triple Tap Delay - Parallel',								# wo
	'Triple Tap Delay - Parallel, Varying Feedback',			# wo
	'Triple Tap Delay - Parallel, Varying Feedback, w/ Chorus',	# wo
	'Plate Reverb - Dattorro',	# wo
	'Freeverb',		# wo
	'Greenwood Delay',
	'Pitch Transposer - Stereo',
	'Reverse Reverb',	# wo
	'New Shimmer Reverb',
	'Octave Up and Down',
	'Stereo Tremolo',
	'Stereo Ring Modulators w/ Chorus',
	'Triple Delay w/ Feedback',
	'Stereo Dual Flange Multi Tap Delay',
	'Modulated Echo',
	'Interesting - w/ Overdrive',
	'Interesting - v1',
	'Faux Phase Shifter',
	'Faux Phase Shifter - extra delay',
	'Dual-Rate Chorus',
	'New Flanger',
	'Oil can delay',
	'Room reverb: 3-4-5',
	'Spacedash',
	'Starfield',
	'Choir Saw',
	'Parallax',
	'Spring Reverb + Tremolo',
	'Phaser OD',
	'Delay OD',

	'Ionian',
	'Arpeggio (major)',
	'Arpeggio (minor)'
]

excludePrograms = [
    'Bit crusher',
]

# variables
onlyOutputGoodPrograms = True
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

	# no programs that need special PCBs
	if 'special_pcb' in prog:
		return False

	# is this one on the list of programs we don't want?
	if prog['name'] in excludePrograms:
		return False

	# we don't need the ROM programs
	if prog['name'].startswith('ROM '):
		return False

	if onlyOutputGoodPrograms  and  prog['name'] not in goodPrograms:
		return False
		
	retVal = False
	if 'spn' in prog['download']:
		includeFile = prog['download']['spn']['file']
		if includeFile.lower().endswith('spn'):
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
	global longestParamName
	for prog in progs:
		if isValidProgram(prog):
			defineString(prog['name'], outf)
			if 'controls' in prog:
				for ctrl in prog['controls']:
					defineString(ctrl, outf)
					if longestParamName < len(ctrl):
						longestParamName = len(ctrl)


def getIncludeFileName(prog):
	if 'download' in prog  and  'spn' in prog['download']:
		includeFile = prog['download']['spn']['file']
		includeFile = includeFile[0:-3] + 'h'
		return includeFile
		
	return ''
	
def outputProgram(prog, outf):

	global usedBytes

	if not isValidProgram(prog):
		return

	print('outputting program:', prog['name'])

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
	
	outf.write('.param_names = {' + potNames + '},\n')
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
			#outf.write('#include "FV-1/spn/{}"\n'.format(includeFile))
			outf.write(binary.strip() + '\n')
			outf.write('};\n\n')


def outputProgParams(progs, outf):

	global usedBytes, longestParamName
	
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

longestProgName = 0
longestParamName = 0
outputCpp = 'program_defs.cpp'
outputH = 'program_defs.h'
print ('writing file:', outputCpp)
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

	outf.write('\nconst Program fv1_programs[NUM_FV1_PROGRAMS] PROGMEM =\n')
	outf.write('{\n')
	outf.write('// ROM programs\n')
	for prog in ROMprograms:
		outputProgram(prog, outf)

	outf.write('// external programs\n')
	# first ouput the "good" programs
	for progName in goodPrograms:
		# find this program
		found = False
		for prog in extPrograms:
			if prog['name'] == progName:
				found = True
				outputProgram(prog, outf)
				if longestProgName < len(progName):
					longestProgName = len(progName)
		
	for prog in extPrograms:
		if prog['name'] not in goodPrograms:
			outputProgram(prog, outf)

	outf.write('};\n')

print ('writing file:', outputH)
with open(outputH, 'wt') as outf:
	outf.write('// this file is automatically generated by json2cpp.py\n')
	outf.write('\n')
	outf.write('#pragma once\n')
	outf.write('\n')
	outf.write('constexpr uint8_t NUM_FV1_PROGRAMS = {};\n'.format(numPrograms))
	outf.write('\n')
	outf.write('extern const Program fv1_programs[NUM_FV1_PROGRAMS];\n')
	outf.write('\n')
	outf.write('constexpr uint8_t LONGEST_PROGRAM_NAME = {};\n'.format(longestProgName + 1))
	outf.write('constexpr uint8_t LONGEST_PARAM_NAME = {};\n'.format(longestParamName + 1))
	outf.write('constexpr uint8_t LONGEST_NAME = {};\n'.format((longestParamName if longestParamName > longestProgName else longestProgName) + 1))

print ('used', usedBytes, 'bytes on', numPrograms, 'programs')