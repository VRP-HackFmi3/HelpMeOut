 #!/bin/bash 

cd ./database
rm development.db
sequel -m"./migrations/" sqlite://development.db
