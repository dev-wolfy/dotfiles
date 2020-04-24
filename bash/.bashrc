http()
{
    { sleep 8; firefox http://0.0.0.0:80; } & 
    docker run --rm -p 127.0.0.1:80:80 --name http -v $(pwd):/usr/local/apache2/htdocs:ro httpd
}
