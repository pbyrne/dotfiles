fun! TransmitFtpSendFile()
    let TransmitFtpFileName = expand("%:p")
    let TransmitFtpAppleScript = split(&runtimepath, ",")[0] . "/apple/send_to_transmit.applescript"
    silent exec '!osascript "' . TransmitFtpAppleScript . '" "' . TransmitFtpFileName . '"'
    echo "File " . TransmitFtpFileName . " sent to Transmit" 
endfunction

nnoremap <C-S-U> :call TransmitFtpSendFile()<CR>
