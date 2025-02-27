# Linux Find Command
a. On App Server 1 at location /var/www/html/blog find out all files (not directories) having .php extension.

b. Copy all those files along with their parent directory structure to location /blog on same server.

c. Please make sure not to copy the entire /var/www/html/blog directory content.

`find /var/www/html/blog/ -type f -name *.js -exec cp --parents {} /blog \;`