# vimstart

> This is my first attempt at writing a vim plugin.


This allows you to write a `.vimstart` executable, which will be the start page of your vim session. It automatically centers any text output from the script in the middle of the screen, while also preserving formatting (it simply centers based on the longest line of the output). If there is no `.vimstart` in your current directory, it will look in `~/.config/nvim/vimstart`.
