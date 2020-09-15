
/* IMPORT */

const {default: flatten} = require ( '../dist' ),
      {INPUT} = require ( '../test/fixtures' ),
      benchmark = require ( 'benchloop' );

/* BENCHMARK */

benchmark.defaultOptions = Object.assign ( benchmark.defaultOptions, {
  iterations: 1000,
  log: 'compact'
});

benchmark ({
  name: 'css-flatten',
  fn: () => {
    flatten ( INPUT );
  }
});
