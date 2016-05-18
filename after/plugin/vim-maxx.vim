" The following two lines are for fixing the status line when using lightline
" with some colorschems
" :help StatusLineNC If StatusLine and StatusLine NC have equal values,
" then Vim will use '^^^' in the status line of the current window
hi StatusLine gui=bold,reverse cterm=bold,reverse term=bold,reverse
hi StatusLineNC gui=reverse cterm=reverse term=reverse
