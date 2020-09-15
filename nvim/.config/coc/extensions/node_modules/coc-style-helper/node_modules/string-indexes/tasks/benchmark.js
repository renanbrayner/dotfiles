
/* IMPORT */

const {default: indexes} = require ( '../dist' ),
      benchmark = require ( 'benchloop' );

/* BENCHMARK */

benchmark.defaultOptions = Object.assign ( benchmark.defaultOptions, {
  iterations: 1000000,
  log: 'compact'
});

benchmark ({
  name: 'string-indexes',
  fn: () => {
    indexes ( 'xxxx__xxxx__xxxxx', 'xx' );
  }
});
