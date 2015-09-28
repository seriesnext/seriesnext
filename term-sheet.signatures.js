var vars = require('./' + process.argv[2])
process.stdout.write(
  JSON.stringify(
    ( [ { header: 'The parties are signing this Term Sheet on the date stated above.',
          term: 'Company',
          name: vars['chief executive officer'],
          entities: [
            { by: 'Chief Executive Officer',
              form: 'corporation',
              jurisdiction: 'Delaware',
              name: vars['corporation name'] } ] } ]
      .concat(vars.purchasers.map(function(purchaser) {
        var signature = purchaser.signature
        signature.header = 'The parties are signing this Term Sheet on the date stated above.'
        signature.term = 'Purchaser'
        return signature })) ),
    null, 2))
