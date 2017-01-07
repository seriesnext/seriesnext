var vars = require('./' + process.argv[2])
var header = (
  'The parties are signing this Term Sheet ' +
  'on the date stated above.'
)
process.stdout.write(
  JSON.stringify(
    [
      {
        header: header,
        term: 'Company',
        name: vars['chief executive officer'],
        entities: [
          {
            by: 'Chief Executive Officer',
            form: 'corporation',
            jurisdiction: 'Delaware',
            name: vars['corporation name']
          }
        ],
        information: ['date']
      }
    ]
      .concat(vars.purchasers.map(function (purchaser) {
        var signature = purchaser.signature
        signature.header = header
        signature.term = 'Purchaser'
        signature.information = ['date']
        return signature
      })),
    null, 2
  )
)
