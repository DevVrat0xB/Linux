# !/bin/bash

# message to display as hint.

display_hint () {
cat << EOM
dvs: Development (tmux) Session.

Creates a new Tmux session with 3 predefined windows suited for development.
These 3 windows include a text editor (neovim), a bash shell for executing any command (e.g git operations) and yet another bash shell for running the development server (if possible).

usage: dvs [session name]
           [-d | --dir <project path>]
           [-e | --editor <your text-editor command>]
           [-r | --run <command to execute>]
					 [-x | --no-server ]

session name    Name of the Tmux session. Default is 'Project'.
-d, --dir       path of the project directory or a path from where the editor and other bash shell are to be spawned.
-e, --editor    command for your preferred text-editor (e.g. vim/nano/pico; should be able to run inside the terminal).
-r, --run       a command which will be executed in one of the bash shell window (e.g. npm start).
-x, --no-server don't create any server window.
-h, --help      display this manual.
EOM
}

SESSION_NAME='Project'				# name of the session (default is 'project').
FIRST_WINDOW_NAME='Editor'		# name of the session (default is 'project').
PROJ_DIR=$(pwd)								# path of the project directory (default current directory).
TEXT_EDITOR=nvim							# name (ie command) of the preferred text editor.
EXEC_CMD=											# command to execute for the 'Server' bash window.
MUST_EXEC=true								# don't execute any command in bash shell.

# show manual if 1st argument is either '-h' or '--help'.
# this will ignore any other following flags and arguments.
if [[ $1 == '-h' || $1 == '--help' ]]; then
	display_hint
	exit 0
fi

# process the flags.
while [ $# -ne 0 ]
do
	case $1 in
		-d | --dir)
			if [[ -d $2 ]]; then
				PROJ_DIR=$2			# picks up the value followed by '-d' or '--dir' flag.
				shift 					# to remove the '-d' or '--dir' flag.
				shift						# to remove the value followed by '-d' or '--dir' flag.
			else
				echo "No such directory exists"
				exit 1
			fi
			;;
		-e | --editor)
			TEXT_EDITOR=$2	# picks up the value followed by '-e' or '--editor' flag.
			shift 					# to remove the '-e' or '--editor' flag.
			shift						# to remove the value followed by '-e' or '--editor' flag.
			;;
		-r | --run)
			EXEC_CMD=$2			# picks up the value followed by '-r' or '--run' flag.
			shift 					# to remove the '-r' or '--run' flag.
			shift 					# to remove the value followed by '-r' or '--run' flag.
			;;
		-x | --no-server)
			MUST_EXEC=false
			shift 					# to remove the '-x' or '--no-server' flag.
			;;
		([a-zA-Z0-9]*)
			SESSION_NAME=$1
			shift 					# to remove the first argument (for session name).
			;;
		*)
			echo "${1} flag is not recognized."
			exit 1
	esac
done

# creating the tmux session with initial window named as 'Editor'.
tmux new-session -d -c $PROJ_DIR -n $FIRST_WINDOW_NAME -s $SESSION_NAME
tmux send-key -t =$SESSION_NAME:1 "clear" Enter									# clears the screen.
tmux send-key -t =$SESSION_NAME:1 $TEXT_EDITOR Enter						# starts the text editor.
tmux neww -n 'Bash' -c $PROJ_DIR -t =$SESSION_NAME							# creates another window named as 'Bash'.

if [[ $MUST_EXEC == true ]]; then
	tmux neww -n 'Server' -c $PROJ_DIR -t =$SESSION_NAME					# creates another window named as 'Server'.

	# (if provided) executes the given command in the 'Server' window.
	if [[ $EXEC_CMD != '' ]]; then
		tmux send-key -t =$SESSION_NAME:Server "${EXEC_CMD}" Enter
	fi

fi

tmux select-window -t =$SESSION_NAME:1							# marking the editor window as active.
tmux attach -t =$SESSION_NAME												# opening up the tmux session.

