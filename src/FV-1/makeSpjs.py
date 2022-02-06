import os

spnFiles = []

# collect the names of spn files
for (dirpath, dirnames, Files) in os.walk('.\\'):
	for File in Files:
		if File.endswith('.spn'):
			spnFiles.append(os.path.abspath(dirpath + '\\' + File))

if spnFiles == []:
    raise Exception('no SPN files found')

print ('found %i files' % len(spnFiles))

reportFile = 'spjs_report.csv'
currDirLen = len(os.getcwd())
with open(reportFile, 'w') as outrep:
	outrep.write('SPJ file\tSPN file\tP1\tP2\tP3\tComment\n')
	for spjCnt in range(1, int(len(spnFiles) / 8) + 2):
		spjFile = 'a%02i.spj' % spjCnt
		with open(spjFile, 'w') as outf:
			filesForSpj = spnFiles[(spjCnt-1)*8 : spjCnt*8]
			outf.write('NUMDOCS:8\n')
			for spnFile in filesForSpj:
				outf.write('%s,1\n' % spnFile)
				outrep.write('%s\t%s\n' % (spjFile, spnFile[currDirLen + 1:]))

			# repeat the last program to pad the project up to 8
			if len(filesForSpj) < 8:
				for cnt in range(len(filesForSpj), 8):
					outf.write('%s,1\n' % filesForSpj[-1])
					outrep.write('%s\t%s\n' % (spjFile, spnFile[currDirLen + 1:]))
			outf.write(',0,1,0')

print('report written to', reportFile)
