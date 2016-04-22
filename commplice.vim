func! CompileGcc()
    exec "w"
    let compilecmd="!gcc "
    let compileflag="-o %< "
    if search("mpi/.h") != 0
        let compilecmd = "!mpicc "
    endif
    if search("glut/.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv/.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp/.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math/.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc
func! CompileGpp()
    exec "w"
    let compilecmd="!g++ "
    let compileflag="-o %< "
    if search("mpi/.h") != 0
        let compilecmd = "!mpic++ "
    endif
    if search("glut/.h") != 0
        let compileflag .= " -lglut -lGLU -lGL "
    endif
    if search("cv/.h") != 0
        let compileflag .= " -lcv -lhighgui -lcvaux "
    endif
    if search("omp/.h") != 0
        let compileflag .= " -fopenmp "
    endif
    if search("math/.h") != 0
        let compileflag .= " -lm "
    endif
    exec compilecmd." % ".compileflag
endfunc

func! RunPython()
    exec "!python %"
endfunc
func! CompileJava()
    exec "!javac %"
endfunc
func! CompileGo()
    exec "!go run %"
endfunc
func! CompileRuby()
    exec "!ruby %"
endfunc

func! CompileLua()
    exec "!lua %"
endfunc

func! CompilePHP()
    exec "!php %"
endfunc

func! CompileJS()
    exec "!node %"
endfunc

func! CompileRust()
    exec "!rustc %"
endfunc

func! CompilePerl6()
    exec "!perl6 %"
endfunc

func! CompilePerl()
    exec "!perl %"
endfunc

func! CompileElixir()
    exec "!elixir %"
endfunc

func! CompileSwift()
    exec "!swift  %"
endfunc

func! CompileCode()
    exec "w"
    if &filetype == "cpp"
        exec "call CompileGpp()"
    elseif &filetype == "c"
        exec "call CompileGcc()"
    elseif &filetype == "python"
        exec "call RunPython()"
    elseif &filetype == "java"
        exec "call CompileJava()"
    elseif &filetype =="go"
        exec "call CompileGo()"
    elseif &filetype =="ruby"
        exec "call CompileRuby()"
    elseif &filetype =="lua"
        exec "call CompileLua()"
    elseif &filetype =="php"
        exec "call CompilePHP()"
    elseif &filetype =="rust"
        exec "call CompileRust()"
    elseif &filetype =="javascript"
        exec "call CompileJS()"
    elseif &filetype == 'perl'
        exec "call CompilePerl()"
    elseif &filetype == 'perl6'
        exec "call CompilePerl6()"
    elseif &filetype == 'elixir'
        exec "call CompileElixir()"
    elseif &filetype == 'swift'
        exec "call CompileSwift()"
    endif
endfunc

func! RunResult()
    exec "w"
    if search("mpi/.h") != 0
        exec "!mpirun -np 4 ./%<"
    elseif &filetype == "cpp"
        exec "! ./%<"
    elseif &filetype == "c"
        exec "! ./%<"
    elseif &filetype == "python"
        exec "call RunPython()"
    elseif &filetype == "java"
        exec "!java %<"
    elseif &filetype == "rust"
        exec "! ./%<"
    endif
endfunc

map <F5> :call CompileCode()<CR>
imap <F5> <ESC>:call CompileCode()<CR>
vmap <F5> <ESC>:call CompileCode()<CR>

map <F6> :call RunResult()<CR>

