; Copyright (c) 2023 Rassyberry
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetKeyDelay,,1




class keybinds() {

    config_file_name := "default"
    keybinds_array_01 := []
    keybinds_array_02 := []
    keybinds_array_03 := []
    keybinds_array_04 := []

    set_config_file_name(file_name) {
        config_file_name := file_name
    }

    assign_keybinds() {
        ; lets take the keybinds from the keybinds arrays and register them as keybinds
        ; in the script
        ; we'll use the Hotkey function for each keybind found in each of the keybinds_arrays
        ; additionally, the first keybind found in each of the arrays is the first input to the 
        ; assign() function that will define what each Hotkey will do
        ; each of the other keybinds will be the second input to the assign() function, as well as
        ; being the actual key that gets assigned with the Hotkey function

        #UseHook, True
        ; keybinds_array_01
        if (keybinds_array_01.count > 1) {
            for (i, 2, keybinds_array_01.count) {
                Hotkey, %keybinds_array_01[i], assign(keybinds_array_01[1], keybinds_array_01[i]), On
            }
        }

        ; keybinds_array_02
        if (keybinds_array_02.count > 1) {
            for (i, 2, keybinds_array_02.count) {
                Hotkey, %keybinds_array_02[i], assign(keybinds_array_02[1], keybinds_array_02[i]), On
            }
        }

        ; keybinds_array_03
        if (keybinds_array_03.count > 1) {
            for (i, 2, keybinds_array_03.count) {
                Hotkey, %keybinds_array_03[i], assign(keybinds_array_03[1], keybinds_array_03[i]), On
            }
        }

        ; keybinds_array_04
        if (keybinds_array_04.count > 1) {
            for (i, 2, keybinds_array_04.count) {
                Hotkey, %keybinds_array_04[i], assign(keybinds_array_04[1], keybinds_array_04[i]), On
            }
        }
        #UseHook False

    }

    turn_off_keybinds() {
        ; lets turn off all the keybinds
        ; we'll use the Hotkey function for each keybind found in each of the keybinds_arrays
        ; additionally, the first keybind found in each of the arrays is the first input to the 
        ; assign() function that will define what each Hotkey will do
        ; each of the other keybinds will be the second input to the assign() function, as well as
        ; being the actual key that gets assigned with the Hotkey function

        #UseHook, True
        ; keybinds_array_01
        if (keybinds_array_01.count > 1) {
            for (i, 2, keybinds_array_01.count) {
                Hotkey, %keybinds_array_01[i], Off
            }
        }

        ; keybinds_array_02
        if (keybinds_array_02.count > 1) {
            for (i, 2, keybinds_array_02.count) {
                Hotkey, %keybinds_array_02[i], Off
            }
        }

        ; keybinds_array_03
        if (keybinds_array_03.count > 1) {
            for (i, 2, keybinds_array_03.count) {
                Hotkey, %keybinds_array_03[i], Off
            }
        }

        ; keybinds_array_04
        if (keybinds_array_04.count > 1) {
            for (i, 2, keybinds_array_04.count) {
                Hotkey, %keybinds_array_04[i], Off
            }
        }
        #UseHook False

    }

    read_config(file) {

    ; read a config txt file in the directory /config/file.txt
    ; and store the keybinds in the arrays
    ; the format of the file is:
    ; each array stats with a line containing the array name
    ; each line after that contains a keybind
    ; the keybinds are just a string that represents the hotkey it will be used for
    ; the keybinds are stored in the arrays in the order they are read from the file

        file := "config/" file ".txt"
        file := FileOpen(file, "r")
        if (file = 0) {
            MsgBox, 0, Error, Could not open file
            Return
        }

        array_name := ""
        while (!FileReadLine(file, line)) {
            if (line = "") {
                continue
            }
            if (line = "end") {
                break
            }
            if (line = "keybinds_array_01") {
                array_name := "keybinds_array_01"
                continue
            }
            if (line = "keybinds_array_02") {
                array_name := "keybinds_array_02"
                continue
            }
             if (line = "keybinds_array_03") {
                array_name := "keybinds_array_03"
                continue
            }
            if (line = "keybinds_array_04") {
                array_name := "keybinds_array_04"
                continue
            }
            if (array_name = "keybinds_array_01") {
                keybinds_array_01 := keybinds_array_01 . line
            }
            if (array_name = "keybinds_array_02") {
                keybinds_array_02 := keybinds_array_02 . line
            }
            if (array_name = "keybinds_array_03") {
                keybinds_array_03 := keybinds_array_03 . line
            }
            if (array_name = "keybinds_array_04") {
                keybinds_array_04 := keybinds_array_04 . line
            }
        }
        FileClose(file)

    }

    store_config(file) {

    ; store the keybinds in the arrays in the directory /config/file.txt
    ; the format of the file is:
    ; each array stats with a line containing the array name
    ; each line after that contains a keybind
    ; the keybinds are just a string that represents the hotkey it will be used for

        file := "config/" file ".txt"
        file := FileOpen(file, "w")
        if (file = 0) {
            MsgBox, 0, Error, Could not open file
            Return
        }

        FileWriteLine(file, "keybinds_array_01")
        for (i, 1, keybinds_array_01.count) {
            FileWriteLine(file, keybinds_array_01[i])
        }
        FileWriteLine(file, "keybinds_array_02")
        for (i, 1, keybinds_array_02.count) {
            FileWriteLine(file, keybinds_array_02[i])
        }
        FileWriteLine(file, "keybinds_array_03")
        for (i, 1, keybinds_array_03.count) {
            FileWriteLine(file, keybinds_array_03[i])
        }
        FileWriteLine(file, "keybinds_array_04")
        for (i, 1, keybinds_array_04.count) {
            FileWriteLine(file, keybinds_array_04[i])
        }
        FileWriteLine(file, "end")
        FileClose(file)

    }
}