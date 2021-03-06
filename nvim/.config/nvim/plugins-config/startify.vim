function! s:gitModified()
	let files = systemlist('git ls-files -m 2>/dev/null')
	return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
	let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
	return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:nerdtreeBookmarks()
	let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
	let bookmarks = bookmarks[0:-2]
	return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_padding_left = 3

let g:startify_lists = [
	\ { 'type': 'files',     'header': ['   Most recently used files']},
	\ { 'type': 'dir',       'header': ['   Most recently used files in '. getcwd()] },
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ { 'type': function('s:gitModified'),  'header': ['   git modified']},
	\ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
	\ { 'type': 'commands',  'header': ['   Commands']       },
	\ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree bookmarks']}
	\ ]

let g:startify_custom_header = [
	\'    ███╗   ██╗ ██████╗ ████████╗██╗   ██╗██╗███╗   ███╗',
	\'    ████╗  ██║██╔═══██╗╚══██╔══╝██║   ██║██║████╗ ████║',
	\'    ██╔██╗ ██║██║   ██║   ██║   ██║   ██║██║██╔████╔██║',
	\'    ██║╚██╗██║██║   ██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║',
	\'    ██║ ╚████║╚██████╔╝   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║',
	\'    ╚═╝  ╚═══╝ ╚═════╝    ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝',
	\ ]

