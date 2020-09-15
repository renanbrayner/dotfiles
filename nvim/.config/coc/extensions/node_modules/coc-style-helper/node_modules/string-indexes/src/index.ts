
/* STRING INDEXES */

function indexes ( str: string, substr: string ): number[] {

  const indexes: number[] = [],
        rangeLength = substr.length;

  let indexFrom = 0;

  while ( true ) {

    const index = str.indexOf ( substr, indexFrom );

    if ( index === -1 ) return indexes;

    indexes.push ( index );

    indexFrom = index + rangeLength;

  }

}

/* EXPORT */

export default indexes;
