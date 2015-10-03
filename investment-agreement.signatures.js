var vars = require('./' + process.argv[2])
process.stdout.write(
  JSON.stringify(
    ( [ { header: 'The parties are signing this Series Next Preferred Stock Investment Agreement on the date stated above.',
          term: 'Company',
          name: vars['chief executive officer'],
          information: [ 'address' ],
          entities: [
            { by: 'Chief Executive Officer',
              form: 'corporation',
              jurisdiction: 'Delaware',
              name: vars['corporation name'] } ] } ]
      .concat(vars.purchasers.map(function(purchaser) {
        var signature = purchaser.signature
        signature.information = [ 'address' ]
        signature.header = 'The parties are signing this Series Next Preferred Stock Investment Agreement on the date stated above.',
        signature.term = 'Purchaser'
        return signature }))
      .concat(vars['key holders'].map(function(holder) {
        var signature = holder.signature
        signature.information = [ 'address' ]
        signature.header = 'The parties are signing this Series Next Preferred Stock Investment Agreement on the date stated above.',
        signature.term = 'Key Holder'
        return signature })) ),
    null, 2))
