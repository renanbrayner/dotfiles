
/* IMPORT */

import {describe} from 'ava-spec';
import minify from 'css-simple-minifier';
import {default as flatten} from '../dist';
import {INPUT, OUTPUT, INPUT_COMPLEX_AMPERSAND, OUTPUT_COMPLEX_AMPERSAND} from './fixtures';

/* CSS FLATTEN */

describe ( 'CSS Flatten', it => {

  it ( 'supports complex (S)CSS', t => {

    t.is ( minify ( flatten ( INPUT ) ), OUTPUT );

  });

  it ( 'supports complex "&" usage', t => {

    t.is ( minify ( flatten ( INPUT_COMPLEX_AMPERSAND ) ), OUTPUT_COMPLEX_AMPERSAND );

  });

  it ( 'throws on invalid "&" usage', t => {

    t.throws ( () => flatten ( 'b & {}' ), /top-level/i );

  });

});
