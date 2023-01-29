; Copyright (c) 2023 Rassyberry
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetKeyDelay,,1


Class keybinds {

    config_file_name := "default"
    num_keybind_arrays := 2
    keybinder := []

    set_config_file_name(file_name) {
        ; make sure we got a string in the file_name variable first
        if (!file_name.isstring) {
            ; throw an error message here if its not a string
            MsgBox, 0, Error, "set_config_file_name() requires a string as the first input"
            return
        }
        config_file_name := file_name
        Return
    }

    set_num_keybind_arrays(n) {
        ; make sure we got a number in the n variable first
        if (!n.isnumber) {
            ; throw an error message here if its not a number
            MsgBox, 0, Error, "set_num_keybind_arrays() requires a number as the first input"
            return
        }
        num_keybind_arrays := n
        Return
    }

    assign_keybinds() {
        ; lets take the keybinds from the keybinds arrays and register them as keybinds
        ; in the script
        ; we'll use the Hotkey function for each keybind found in each of the keybinds_arrays
        ; additionally, the first keybind found in each of the arrays is the first input to the 
        ; assign() function that will define what each Hotkey will do
        ; each of the other keybinds will be the second input to the assign() function, as well as
        ; being the actual key that gets assigned with the Hotkey function


        ; keybinder array here
        ; this array holds each of the arrays that each hold the keybinds for each keybind group
        ; we'll use this array to loop through each of the keybind groups and assign the keybinds

        #UseHook, True
        if (keybinder.count > 1) {
            Loop, keybinder.MaxIndex() {
                if (keybinder[A_Index].count > 1) {
                    Loop, keybinder[A_Index].MaxIndex() {
                        Hotkey, % keybinder[A_Index][A_Index], keybinds.kb_actions(keybinder[A_Index][1], keybinder[A_Index][A_Index]), On
                    }
                }
            }
        }
        #UseHook False
        Return
    }

    turn_off_keybinds() {
        ; lets turn off all the keybinds
        ; we'll use the Hotkey function for each keybind found in each of the keybinds_arrays
        ; additionally, the first keybind found in each of the arrays is the first input to the 
        ; assign() function that will define what each Hotkey will do
        ; each of the other keybinds will be the second input to the assign() function, as well as
        ; being the actual key that gets assigned with the Hotkey function


        ; keybinder array here
        ; this array holds each of the arrays that each hold the keybinds for each keybind group
        ; we'll loop through this array to turn off all the keybinds it contains

        #UseHook, True
        if (keybinder.count > 1) {
            Loop, keybinder.MaxIndex() {
                if (keybinder[A_Index].count > 1) {
                    Loop, keybinder[A_Index].MaxIndex() {
                        Hotkey, % keybinder[A_Index][A_Index], Off
                    }
                }
            }
        }
        #UseHook False
        Return
    }

    read_config(file) {

    ; read a config txt file in the directory /config/file.txt
    ; and store the keybinds in the arrays
    ; the format of the file is:
    ; each array stats with a line containing the array name
    ; each line after that contains a keybind
    ; the array ends on a line that says 'done'
    ; the keybinds are just a string that represents the hotkey it will be used for
    ; the keybinds are stored in the arrays in the order they are read from the file
    ; those arrays are then stored in the keybinder array

        keybinder := []
        file := "config/" file ".txt"
        file := File.Open(file, "r")
        if (file = 0) {
            MsgBox, 0, Error, "Could not open file"
            Return
        }

        array_holder := []
        while (!File.ReadLine(file, line)) {
            if (line = "") {
                continue
            }
            if (line = "end") {
                break
            }
            if (line = "done") {
                keybinder := keybinder . array_holder
                continue
            }
            if (line = "keybinds_array") {
                array_holder := []
                continue
            }
            else {
                array_holder := array_holder . line
            }
        File.Close(file)
        }
        Return
    }
    

    store_config(file) {

    ; store the keybinds in the arrays in the directory /config/file.txt
    ; the format of the file is:
    ; each array stats with a line containing the array name
    ; each line after that contains a keybind
    ; the keybinds are just a string that represents the hotkey it will be used for

        file := "config/" file ".txt"
        file := File.Open(file, "w")
        if (file = 0) {
            MsgBox, 0, Error, "Could not open file"
            Return
        }

        ; iterate through the keybinder array and write each of the arrays within it
        ; to the file
        ; the format should be the same as is read out in the read_config() function
        ; starts with keybinds_array, then each line is a keybind until it reads done
        ; then the next array starts with the next keybinds_array_

        for i, b in keybinder {
            File.WriteLine(file, "keybinds_array")
            for j, b in keybinder[i] {
                File.WriteLine(file, keybinder[i][j])
            }
            File.WriteLine(file, "done")
        }
        File.WriteLine(file, "end")
        File.Close(file)
        Return
    }

    kb_actions(kb1, kb2) {
        Send, %kb1%
        Sleep 10
        Send, %kb2%
        Return
    }

    switch_config(file_name) {
        ; lets switch to a different config file
        ; we'll first save the current keybind config
        ; then we'll turn off all the keybinds
        ; then we'll read the new config file
        ; then we'll assign the keybinds from the new config file

        ; we're getting an error here
        ; that says that it cant find the function we specify, the store_config() function
        ; so lets fix that error here:

        ; we need to specify that the store_config() function is in the current script
        ; we can do that by adding the script name to the front of the function name
        ; so we'll change store_config() to this:




        keybinds.store_config(config_file_name)
        keybinds.turn_off_keybinds()
        keybinds.set_config_file_name(file_name)
        keybinds.read_config(config_file_name)
        keybinds.assign_keybinds()
        Return
    }

}
