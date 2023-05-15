// we need Node.js to run this
// better to edit the .json directly, than edit the programs.js and then generate the json on every update
// so this is only for archival purposes

import fs from 'fs'
import programs from './programs.js'

let fileName = process.argv[2]
if (fileName != "")
{
	console.log('writing ' + fileName)
	fs.writeFileSync(fileName, JSON.stringify(programs, null, 2))
}
