 #!/bin/bash 

cd `find ~/ -type d -name 'HelpMeOut'`
cd ./database
rm development.db
sequel -m"./migrations/" sqlite://development.db