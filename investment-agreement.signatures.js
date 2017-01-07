var vars = require('./' + process.argv[2])
var header = (
  'The parties are signing this Series Next ' +
  'Preferred Stock Investment Agreement ' +
  'on the date stated above.'
)
process.stdout.write(
  JSON.stringify(
    (
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
          ]
        }
      ]
        .concat(vars.purchasers.map(function (purchaser) {
          var signature = purchaser.signature
          signature.header = header
          signature.term = 'Purchaser'
          return signature
        }))
        .concat(vars['key holders'].map(function (holder) {
          var signature = holder.signature
          signature.header = header
          signature.term = 'Key Holder'
          return signature
        }))
    ),
    null, 2
  )
)
