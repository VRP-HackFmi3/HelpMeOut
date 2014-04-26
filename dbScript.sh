 #!/bin/bash 

cd `find ~/ -type d -name 'HelpMeOut'`
cd ./database
rm development.db
sequel -m"./migrations/" sqlite://development.db
sqlite3 development.db 'insert into fields (name) values ("Math")'
sqlite3 development.db 'insert into fields (name) values ("English")'
sqlite3 development.db 'insert into fields (name) values ("History")'
sqlite3 development.db 'insert into fields (name) values ("Birds")'
sqlite3 development.db 'insert into fields (name) values ("Cars")'
sqlite3 development.db 'insert into fields (name) values ("Computer Games")'
sqlite3 development.db 'insert into fields (name) values ("French")'
sqlite3 development.db 'insert into fields (name) values ("Programming")'
sqlite3 development.db 'insert into fields (name) values ("Plants")'
sqlite3 development.db 'insert into fields (name) values ("Biology")'
sqlite3 development.db 'insert into fields (name) values ("Ruby")'
sqlite3 development.db 'insert into fields (name) values ("Python")'
sqlite3 development.db 'insert into fields (name) values ("Sports")'