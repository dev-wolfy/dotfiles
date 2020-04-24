# Bash Shortcut

## Move cursor

| Shortcut      | Action                                                      |
| ------------- |:-----------------------------------------------------------:|
| Ctrl + a      | go to the start of the command line                         |
| Ctrl + e(nd)  | go to the end of the command line                           |
| Alt + b       | move backward one word                                      |
| Alt + f       | move forward one word                                       |
| Ctrl + f      | move forward one character                                  |
| Ctrl + b      | move backward one character                                 |
| Ctrl + d      | delete character under the cursor                           |
| Ctrl + h      | delete character before the cursor                          |

## Edite command line

| Shortcut      | Action                                                      |
| ------------- |:-----------------------------------------------------------:|
| Ctrl + k      | delete from cursor to the end of the command line           |
| Ctrl + u      | delete from cursor to the start of the command line         |
| Ctrl + w      | delete from cursor to start of word                         |
| Ctrl + y(ank) | paste word or text that was cut using one of the deletion shortcuts |
| Ctrl + xx     | move between start of command line and current cursor position (and back again) |
| Alt + d       | delete to end of word starting at cursor                    |
| Alt + c       | capitalize to end of word starting at cursor                |
| Alt + u       | make uppercase from cursor to end of word                   |
| Alt + l       | make lowercase from cursor to end of word                   |
| Alt + t       | swap current word with previous                             |
| Ctrl + t      | swap character under cursor with the previous one           |
| Alt + .       | use the last word of the previous command                   |

## Command Recall Shortcuts

| Shortcut          | Action                                                  |
| ----------------- |:-------------------------------------------------------:|
| Ctrl + r(esearch) | search the history backwards                            |
| Ctrl + g          | escape from history searching mode                      |
| Ctrl + p(revious) | previous command in history                             |
| Ctrl + n(ext)     | next command in history                                 |

## Terminal Process Control

| Shortcut          | Action                                                  |
| ----------------- |:-------------------------------------------------------:|
| Ctrl + (c)l(ean)  | clear the screen                                        |
| Ctrl + s(tops)    | stops the output to the screen                          |
| Ctrl + q          | allow output to the screen                              |
| Ctrl + c          | terminate the command                                   |
| Ctrl + z          | suspend/stop the command                                |

## Bash Bang (!) Commands

| Shortcut          | Action                                                  |
| ----------------- |:-------------------------------------------------------:|
| !!                | run las command                                         |
| !ssh              | run the most recent command that starts with ‘ssh'      |
| !ssh:p            | print out the command that !ssh would run               |
| !$                | the last word of the previous command (same as Alt + .) |
| !$:p              | print out the word that !$ would substitute             |
| !*                | the previous command except for the last word           |
| !*:p              | print out what !* would substitute                      |

