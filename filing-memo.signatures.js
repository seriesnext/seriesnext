var vars = require('./' + process.argv[2])
process.stdout.write(
  JSON.stringify(
    [ { header: 'This Restated Certificate of Incorporation has been executed by a duly authorized officer of this corporation as of the date written below.',
        entities: [
          { by: 'Chief Executive Officer',
            form: 'corporation',
            jurisdiction: 'Delaware',
            name: vars['corporation name'] } ],
        name: vars['chief executive officer'],
        information: [ 'date' ] } ],
    null, 2))
