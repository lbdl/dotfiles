"Function ModifyDate;
"searches the file for a Date Modified line
"if it exists then append a new Date Modified line directly below
"with the cuurent date
"if the line does not exist then search for a creation date line 
"and then append a Date Modified line below with the date added



function! ModifyDate()
    let dmExists = 0
    norm ms
    "set the sursor back to the start of the file before searching
    call cursor(1,1)
    while  (search("Date Modified", "W") > 0)
        echo searching...
        let s:pos = line(".")
        let tmp = s:pos
        call cursor(tmp+1,1)
        let dmExists = 1
    endwhile

    if (dmExists)
        "the cursor should now be placed at the found line
        "so we can safely append the Date Modified line
        call cursor(tmp,1)
        exe "normal oDate Modified: ".strftime("%Y%m%d")." by ".$USER
        's
        return
    endif


    if (!dmExists)
        call cursor(1,1)
        let s:pos2 = search("Creation Date", "W")
            if (s:pos2 > 0) 
                exe "normal oDate Modified: ".strftime("%Y%m%d")." by ".$USER
                's
            return 
            endif
    endif
endfunction

