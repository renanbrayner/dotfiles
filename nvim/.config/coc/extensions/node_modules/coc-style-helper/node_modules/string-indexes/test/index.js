
/* IMPORT */

import {describe} from 'ava-spec';
import {default as indexes} from '../dist';

/* STRING INDEXES */

describe ( 'String Indexes', it => {

  it ( 'works', t => {

    t.deepEqual ( indexes ( 'xxxx__xxxx__xxxxx', 'xx' ), [0, 2, 6, 8, 12, 14] );

  });

});
