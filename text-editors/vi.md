# VI modes
## command mode
`esc`
## insert mode
`i`
## last line mode
`:`
# vi editor - command mode
## move cursor around document
`arrow keys or h k j l`
## delete/cut a lett
`x`  
### or
`dd`
## delete 3 lines from current line
`d3d`
## delete n number of lines - hit esc and ndd
`1000dd
## undo previous change
`u`
## redo  change
`ctrl r`
## copy 
`yy`
## paste, move cursor above line you want to paste into
`p`
## copy multiple line
`2yy`
## copy and paste selected lines
`V`  
`yy`  
`p`
## cut and paste selected lines
`V`  
`d`  
`p`
## find downwards in file
`/example_text`  
### next find
`n`
### previous find
`N`
## find upwards in file
`?example_text`  
### next find
`n`
### previous find
`N`
## scroll up
`ctrl + u`
## scroll down
`ctrl + d`
## save a file
`YY`
# last line mode
`:`
## save
`:w`
## quit
`:q`
## save 
`:w`
## show line numbers
`:set number`
## save and quit
`:wq`
## quit without quitting
`:q!`
## find and replace all on same line
`:s/foo/bar/g`
## ignore case
`:s/Foo/bar/gi`
## find and replace all in entire file
`:%s/foo/bar/g`
## delete all occurance
`:s/foo//g`
## alternative syntaxt to  /
`:s|foo|bar|`




  