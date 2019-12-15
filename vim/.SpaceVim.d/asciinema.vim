command! -buffer -nargs=1 AsciinemaRecordLocal echo asciinema#record_local(<args>)
command! -buffer -nargs=1 AsciinemaRecordCloud echo asciinema#record_cloud(<args>)
command! -buffer -nargs=1 AsciinemaPlay echo asciinema#play(<args>)
command! -buffer -nargs=0 AsciinemaStop echo asciinema#stop()

if !exists("g:asciinema_command")
  let g:asciinema_command = "asciinema"
endif

function! asciinema#stop() abort
  
endfunction

function! asciinema#run_command(command) abort
  if !executable(g:asciinema_command)
    throw "vim-asciinema: Error: '" . g:asciinema_command . "' was not found. Please install asciinema."
  endif
  return job_start(g:asciinema_command)
endfunction

function! asciinema#record_local(filename) abort
  if asciinema#checkrunning()
    return 0
  end

  job_stop(g:asciinema_job, )
endfunction

function! asciinema#check_running() abort
  if exists(g:asciinema_job)
    echoerr "Another asciinema process is already running"
    return 1
  endif
endfunction
