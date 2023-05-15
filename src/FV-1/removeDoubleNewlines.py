import os

def processFile(spnFile):

    with open(spnFile, 'r') as inf:

        lineCnt = 1
        result = ''
        for line in inf:
            if lineCnt % 2 == 1:
                result += line.rstrip() + '\n'
            elif line.strip() != '':
                return

            lineCnt += 1

    print ('processing', spnFile)
    with open(spnFile, 'wt') as outf:
        outf.write(result)

# collect the names of spn files
for (dirpath, dirnames, Files) in os.walk('.\\'):
    for spnFile in Files:
        if spnFile.endswith('.spn'):
            processFile(os.path.abspath(dirpath + '\\' + spnFile))
