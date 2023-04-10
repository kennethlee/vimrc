vim.cmd("command! Bdelete                lexpr [] | lclose | bprevious | bdelete #")
vim.cmd("command! Bnext                  lexpr [] | lclose | bnext")
vim.cmd("command! Bprevious              lexpr [] | lclose | bprevious")
vim.cmd("command! Chreg                  call macro#ChangeRegister()")
vim.cmd("command! RemoveFancyCharacters  call file#RemoveFancyCharacters()")
vim.cmd("command! RenameFile             call file#RenameFile()")
vim.cmd("command! ToggleLocationList     call window#ToggleLocationList()")
vim.cmd("command! ToggleQuickfixList     call window#ToggleQuickfixList()")
vim.cmd("command! WipeMarks              delmarks! | delmarks A-Z0-9")
vim.cmd("command! WipeRegisters          for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor")
