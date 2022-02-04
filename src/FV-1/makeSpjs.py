import os

spnFiles = []

# collect the spn files
for (dirpath, dirnames, filenames) in os.walk('.\\'):
    for filename in filenames:
        if filename.endswith('.spn'):
            spnFiles.append(os.path.abspath(dirpath + '\\' + filename))

if spnFiles == []:
    raise Exception('no SPN files found')

print ('found %i files' % len(spnFiles))

for spjCnt in range(1, int(len(spnFiles) / 8) + 2):
    with open('a%02i.spj' % spjCnt, 'w') as outf:
        filesForSpj = spnFiles[(spjCnt-1)*8 : spjCnt*8]
        outf.write('NUMDOCS:8\n')
        for fileName in filesForSpj:
            outf.write('%s,1\n' % fileName)

        # repeat the last program to pad the project up to 8
        if len(filesForSpj) < 8:
            for cnt in range(len(filesForSpj), 8):
                outf.write('%s,1\n' % filesForSpj[-1])
        outf.write(',0,1,0')
