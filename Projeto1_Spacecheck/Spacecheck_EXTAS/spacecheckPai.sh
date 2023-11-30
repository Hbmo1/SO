#!/usr/bin/bash

# Sinopse:
# List the disk space occupied by the directories given as parameters, including all subdiretories, 
# regardeless the depth level. 
# Keep a record on disk for each directory for posterior changes tracking.
 
# Declaring and initializating some vars:
tmpdir="/tmp"								# Diretory for temporary files
script=$(basename "$0")						# Gets the script name (excludes the path)
script=${script/\.sh/}						# Remove the extension
now=`date +%Y%m%d_%H%M%S`					# Date and time in format: yyyymmdd_hhmmss
regex=".*"									# Default Regex "accept all"
minsize="1"									# Default Minimum size = 1 byte
maxlines="no_limit"							# Default Maximum number of output lines
maxdate=`date +%s`							# Default Maximum date = today (seconds since the Epoch)
order="ascending" 							# Default sorting option = Ascending size
dirs=()										# Array to store directory names
options=$@									# Command line options given
logfile="$tmpdir/$script-$now.log"

function Usage () {
	echo "Usage: spacecheck.sh [-a|-r options] dir1 ... dirN"
	echo "Options:"
	echo -e "\t-a 		- alphabetic sort (muttualy exclusive with -r)"
	echo -e "\t-d yyyy-mm-dd 	- maximum file modification date"
	echo -e "\t-h 			- Script usage"
	echo -e "\t-l number 	- maximum output lines"
	echo -e "\t-n regex 	- pattern to select files"
	echo -e "\t-r 		- sort by descending disk space (muttualy exclusive with -a)"
	echo -e "\t-s number 	- minimum file size to be considered"
}

if [[ "$#" -eq 0 ]]; then		# $# denotes the $@ array size (number of parameters given)
	Usage						# No parameters passed?
	exit						# Lesson ends!
fi

# Get arguments
while [[ "$#" -gt 0 ]]; do		# The arguments array is being truncated at the beginning (see the shifts bellow...)
	#echo case=$1
	case $1 in					# This crawls through the $@ array
        -n) regex="$2" 			# Regular expression to select filenames
			shift;;
		-d) maxdate_h="$2"		# Maximum modification time for file selection
			if [[ ! "$maxdate_h" =~ [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] ]] ; then
				echo "Wrong date format: $maxdate_h" | tee $logfile
				exit
			fi
			maxdate=${maxdate_h//-/}
			maxdate=`date --date=$maxdate +"%s"`	# Convert to seconds since the Epoch
			shift;;
		-s) minsize="$2"		# Minimum acceptable file size 
			shift;;
		-h) Usage 				# Show script usage
			exit;;				# Leaving script
		-r) order="descending" 	# Descending size sorted results
			;;					# No shifting (-r has no associated value)
		-a) order="alpha" 		# Alphanumeric file sort 
			;;					# No shifting (-a has no associated value)
		-l) maxlines="$2" 		# Output line number limit 
			shift;;
        *) no_opt="yes"			# Something but not a known option 
		   #echo "$1"
		   dirs="$@";;			# Get the rest of the arguments (directories names)
	esac
	#echo $no_opt
	if [[ $no_opt =~ "yes" ]]; then
		break
	fi
	shift # Select next argument (next item in the $@ array discarding the present item)
		  # This is like shifting the array left, dropping the first element. The array gets shorter,
		  # and $# is decremented for the while loop testing...
done
# Warning: 	Directory names MUST be the last arguments!
# 			No options allowed after a directory name!
# 			This is clear 

# Validate input:
if [[ ! $maxlines =~ [0-9]+ ]]; then
	echo "Wrong number of lines: $maxlines" | tee $logfile
	exit
fi
if [[ ! $minsize =~ [0-9]+ ]]; then
	echo "Wrong file size: $minsize" | tee $logfile
	exit
fi
for dir in $dirs; do			# $dirs is an array. This iterates through it.
	if [[ ! -d $dir ]]; then
		echo "Not a dir: $dir" | tee $logfile
		exit
	fi
	if [[ ! -r $dir ]]; then
		echo "Not owned: $dir" | tee $logfile
		exit
	fi
done

# Printing validated vars (not needed, just to check...):
echo regex=$regex >> $logfile
echo maxdate=$maxdate >> $logfile
echo minsize=$minsize >> $logfile
echo order=$order >> $logfile
echo maxlines=$maxlines >> $logfile
echo dirs="$dirs" >> $logfile

# For each dir we'll need a temporary file to store the script results.
# This temp filename must be:
# - easily identifiable as pertaining to this script 
# - being able to compare results from 2 ouputs requires different filenames => we''l use a timestamp in the name 
# - both outputs must correspond to the same directories => we''l use a unique "per directory token" in the filename 
# - out of the way of the script's home and possible directories given => use /tmp for the temporary file! 
# 	Ah, this realy is a considerable breakthrough!
# So this comes to the temporary script output filename format:	$scriptname-$token_dir-$timestamp.out
# Example: spacecheck-dir1-20231108_123015.out 
# Note: directory names may have forbidden chars for a filename => substitute them!

#du options:
#      -t, --threshold=SIZE
#              exclude entries smaller than SIZE if positive, or entries greater than SIZE if negative
#       --time show time of the last modification of any file in the directory, or any of its  subdirec‐
#              tories
#      --exclude=PATTERN
#              exclude files that match PATTERN

function Scandir () {	# Output the size of each file in the directory given. Only accounts for files 
						# that match the criteria: regex, minsize and maxdate.
						# Prints to STDOUT and /tmp/$outfile
	
	dir=$1
	token_dir=${dir//\//_}		# Replace forbidden filename chars ("/" not allowed)
	outfile=$script-$token_dir-$now.out
	#echo "outfile=$outfile"
	for file in `ls -1 $dir`; do			# List only the filename
		echo -en "$dir/$file:" >> $logfile
		if [[ -d $dir/$file ]]; then		# Skip directories
			echo -en " is a sub_dir. Skipped.\n" >> $logfile
			continue
		fi
		echo -en " is not a directory" >> $logfile
		if [[ ! -r $dir/$file ]]; then
			echo "Not owned: $dir" | tee $logfile
			continue
		fi
		echo -en " is readable" >> $logfile
		if [[ ! $file =~ $regex ]]; then	# Ignore files not matching the regex
			echo -en ", but doesn't match \"$regex Skipped.\"\n" >> $logfile
			continue; 
		fi;
		echo -en ". Matches \"$regex\"" >> $logfile
		time=`stat -c %Y $dir/$file`		# Get file's last modified timestamp in unix time format
		if [ $time -gt $maxdate ]; then		# Ignore file if too fresh
			echo -en ", but is newer than $maxdate_h. Skipped.\n" >> $logfile
			continue; 
		fi;
		echo -en ", is older than $maxdate_h" >> $logfile
		size=`stat -c %s $dir/$file`		# Get file size in bytes
		if [ $size -lt $minsize ]; then		# Ignore file if not big enough 
			echo -en ", but is shorter than $minsize bytes. Skipped.\n" >> $logfile
			continue; 
		fi;
		echo -en " and greater or equal to $minsize bytes. Selected.\n" >> $logfile
	
		out=`stat -c "%s %n" $dir/$file`
		echo "$out" | tee -a $tmpdir/$outfile	# Appending to file...
	done	# file loop done
}

# Find subdirectories if any:
subdirs=()

function Scan4subdirs () {		# Recursive function (calls itself)
	#local dir=$1
	dir=$1						# No need for "local". Each function call gets a refreshed parameter.  
	for file in `ls -1 $dir`; do
		if [[ -d $dir/$file ]]; then
			echo "Found a sub_dir=$dir/$file" >> $logfile
			subdirs+=" $dir/$file"		# Add another element to the array (+= doesn't behave as stated
										# in Bash Manual (see ARRAY). So we precede the value with a space.
			Scan4subdirs $dir/$file		# Plunge in recursivity...
		fi
	done
}

for dir in $dirs; do
	Scan4subdirs $dir
done		# dir loop done
#echo subdirs="$subdirs"

# Printing requested header:
header="SIZE\tNAME\t$now\t$options"		# \t stands for a tab displacement
echo -e "$header"						# -e is needed to escape shars (\t, \n, etc) interpretation and substitution

# Proccess the given directories:
for dir in $dirs; do
	Scandir $dir
done		# dir loop done

# Proccess the subdirectories found:
for dir in $subdirs; do
	Scandir $dir
done		# dir loop done

# Compute the results for each directory given:
for file in `ls $tmpdir/$script-*-$now.out`; do
	echo "$file:"
	cat $file
done

