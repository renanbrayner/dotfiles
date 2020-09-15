
/* IMPORT */

import Parser from 'css-simple-parser';
import {NODE} from 'css-simple-parser/dist/types';
import Resolve from './resolve';

/* CSS FLATTEN */

function flatten ( css: string ): string {

  /* PARSING */

  const AST = Parser.parse ( css );

  /* RESOLVING SELECTORS */

  Parser.traverse ( AST, node => {

    const {selector, parent} = node;

    let selectors = selector.trim ().split ( /\s*,\s*/g ); // Splitting and cleaning up

    if ( !parent['selector'] ) { // Top-level node

      if ( selector.indexOf ( '&' ) >= 0 ) throw new Error ( 'Top-level ampersand placeholders are invalid' );

    } else {

      selectors = Resolve.selectors ( selectors, parent['selectors'] );

      node.selector = selectors.join ( ',' );

    }

    node['selectors'] = selectors;

  });

  /* FLATTENING */

  const nodes: NODE[] = [];

  Parser.traverse ( AST, node => {

    if ( !/\S/.test ( node.body ) ) return; // Ignoring empty blocks, nothing to output

    nodes.push ( node );

  });

  AST.children = nodes;

  /* WIDOWING */

  const empty = [];

  for ( let i = 0, l = nodes.length; i < l; i++ ) {

    nodes[i].children = empty;

  }

  /* STRINGIFYING */

  return Parser.stringify ( AST );

}

/* EXPORT */

export default flatten;
