# adventofcode
Solutions for advent of code

# Day 1

Super-useful sites
https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php
https://linuxconfig.org/how-to-use-arrays-in-bash-script
https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
https://bash.cyberciti.biz/guide/The_case_statement

This question really put it all together for me.  I was taking forever trying to index the array and compare each value to the sum.  I tried getting around this by changing the array to a string, thinking Bash may have some faster text searching tools, even thinking case statements may be faster, but this unlocked the whole thing for me.
https://unix.stackexchange.com/questions/177138/how-do-i-test-if-an-item-is-in-a-bash-array

# Day 2
This unlocked the puzzle for me with the discovery of fold:
https://stackoverflow.com/questions/9899049/placing-every-character-on-a-new-line

If I wanted to make it super fast, this is a great discussion, but it's basically using C here.
https://superuser.com/questions/485800/whats-the-quickest-way-to-count-the-number-of-each-character-in-a-file/485811

# Day 3
http://www.yourownlinux.com/2016/12/bash-scripting-arrays-examples.html
Using associative arrays to create a 2D like array.
https://stackoverflow.com/questions/16487258/how-to-declare-2d-array-in-bash
Declaring the array as integer values:
https://www.computerhope.com/unix/bash/declare.htm
Useful for understanding comparison operators:
http://www.tldp.org/LDP/abs/html/comparison-ops.html

# Day 4
Really had to learn a bit about parameter expansion as a way of searching and manipulating strings:
https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
How to iterate over an associative array:
https://stackoverflow.com/questions/3112687/how-to-iterate-over-associative-arrays-in-bash
Echoing newlines in bash:
https://stackoverflow.com/questions/8467424/echo-newline-in-bash-prints-literal-n
Reading line into multiple variables:
https://stackoverflow.com/questions/10520623/how-to-split-one-string-into-multiple-variables-in-bash-shell