# WOLFY

PS1="[\A] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;10m\]\h@\u\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]:\!:\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

http()
{
    { sleep 8; firefox http://0.0.0.0:80; } & 
    docker run --rm -p 127.0.0.1:80:80 --name http -v $(pwd):/usr/local/apache2/htdocs:ro httpd
}

alias ll='ls -alF'

# !WOLFY
