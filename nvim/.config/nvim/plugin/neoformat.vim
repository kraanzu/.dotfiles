let g:neoformat_python_black= {
            \ 'exe': 'black',
            \ 'args': ['--target-version py310', '-q', '-'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_python = ['black']
