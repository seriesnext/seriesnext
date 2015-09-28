var list = require('english-list')

var input = require('./' + process.argv[2])
var purchasers = input.purchasers.map(function(purchaser) {
    return purchaser.name })
input['list of purchasers'] = list('and', purchasers)
process.stdout.write(JSON.stringify(input, null, 2))
