" tselectfile.vim -- A simplicistic files selector/browser (sort of)
" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-04-16.
" @Last Change: 2015-11-06.
" @Revision:    610
" GetLatestVimScripts: 1865 1 tselectfiles.vim

if &cp || exists("loaded_tselectfiles")
    finish
endif
if !exists('loaded_tlib') || loaded_tlib < 29
    echoerr "tlib >= 0.29 is required"
    finish
endif
let loaded_tselectfiles = 11


" :display: :TSelectFiles[!] [DIR]
" Open/delete/rename files in the current directory.
" A [!] forces the commands to rescan the directory. Otherwise a cached 
" value will be used if available.
" You can also type <c-r> to force rescanning a directory, which could 
" be necessary if the file system were changed (e.g. by creating a new 
" file or by some external command)
command! -bang -nargs=* -complete=dir TSelectFiles call tselectfiles#SelectFiles("normal<bang>".v:count, <f-args>)

" Recursively show all files in the current directory and subdirectories 
" (don't show favourites and ".."); don't use this command when you're 
" at /.
" A [!] forces the commands to rescan the directory. Otherwise a cached 
" value will be used if available.
command! -bang -nargs=* -complete=dir TSelectFilesInSubdirs call tselectfiles#SelectFiles("recursive<bang>".v:count, <f-args>)

