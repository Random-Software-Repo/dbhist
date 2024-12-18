# dbhist
Suppliments the default shell history mechanisms of ZSH, BASH and FISH
with an extended history using SQLITE3.

## Database

Once dbhist is installed, a sqlite3 database (default ~/.dbhist) will be 
created. Every command will create an entry in this database. These 
records extend regulat shell history by adding a number of additional
fields:
	- hostname		the computer/host the command was run from
	- sessionid		the current shell session
	- shell			the current shell program
	- username		the current user
	- <date>			the current date in separate year/month/day (and other) 
					fields
	- command			the command as entered
	- acutalcommand	the acutal command run
	- pwd				the path to the working directory when the command was 
					entered
	- parameters		all the parameters of the entered command.

## History Command

Ultimately these fields can be queried (it's a sqlite3 db, after all) in any
way one might wish. The dbhist install includes a history command which, by
default, will show a sorted list of the most frequently used commands. This
history command has other options as well (run `history -h`).