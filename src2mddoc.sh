#!/bin/bash

## src2mddoc.sh {#bash_src2mddoc.sh}
# Automatic generation of `markdown` files from various self-documented programs
# (R/SAS/Stata/Python/bash/DOS). 
#
# ~~~bash
#    src2mddoc.sh [-h] [-v] [-t] [-p] [-f <fname>] [-d <dir>] <filename>
# ~~~
# 
# ### Arguments 
# * `<input>` : input defined as either the filename storing the source code, or the 
#	directory containing this(ese) file(s);
# * `-f <name>` : (_option_) output name; it is either the name of the output file (with 
#	or without extension) when the parameter `<input>` (see above) is passed as a single
#	file, or a generic suffix to be added to the output filenames otherwise; when a 
#	suffix is passed, the _ symbol is added prior to the suffix; by default, an empty 
#	suffix (_i.e._ no suffix) is used;
# * `-d <dir>` : (_option_) output directory for storing the output formatted files; in the
#	case of test mode (see option `-t` below), this is overwritten by the temporary 
#	directory `/tmp/`; default: when not passed, `<dir>` is set to the same location 
#	as the input(s);
# * `-p` : (_option_) the name of the programming language is also added as a prefix to the
#	name of the output file(s), e.g. the prefixes `r_`, `sas_`, `py_`, etc... are 
#	inserted into the name of the `markdown` files;
# * `-h` : (_option_) setting this option will display the help;
# * `-v` : (_option_) setting this option will set the verbose mode (all kind of useless 
#	comments);
# * `-t` : (_option_) test mode; a temporary output will be generated and displayed; use it 
#	for checking purpose prior to the automatic generation.
# 
# ### Returns
# Extract the documentation headers from the source files into self-generated `markdown` files.
#
# ### Examples
# Test the generation of a `markdown` file from the `quantile.sas` program and display the 
# result:
#
# ~~~sh
#    src2mddoc.sh -t $rootdir/library/pgm/quantile.sas";
# ~~~
# Actually generate (after the test) the file `quantile.md` and store it in a dedicated folder:
#
# ~~~sh
#    src2mddoc.sh -v -d $rootdir/docs/md/library
#          $rootdir/library/pgm/quantile.sas
# ~~~
# Similarly with a R file, also adding the 'r_' to the name of the output file, _i.e._ generating 
# the file `r_quantile.md`:
#
# ~~~sh
#    src2mddoc.sh -v -d $rootdir/docs/md/library/pgm 
#          $rootdir/library/pgm/quantile.R
# ~~~
# Automatically generate `markdown` files with suffix `"doc"` (_i.e._, `quantile.sas` will be 
# associated to the file `sas_quantile_doc.md`) from all existing source files in a given 
# directory:";
#
# ~~~sh
#    src2mddoc.sh -v -p -d $rootdir/documentation/md/library/
#          -f doc
#          $rootdir/library/pgm/
# ~~~
# 
# ### Notes
# 1. The command shall be launched inline from a shell terminal running bash 
#    - commonly installed on all Unix/Linux servers/machines),
#    - on Windows, consider using shells provided by Cygwin (https://www.cygwin.com/) 
#      or Putty (http://www.putty.org/),
#    - on Mac, use the OS terminal.
# 3. To launch the command, run on the shell command line:
#	    bash src2mddoc.sh <arguments>
# with your own arguments/instructions.
# 4. On a Unix server, you may have some DOS-related issue when running this program: 
# in order to deal with embedded control-M's in the file (source of the issue), it may 
# be necessary to run dos2unix, e.g. execute the following:
#	    dos2unix src2mddoc.sh 
##

# @date:     15/06/2016
# @credit:   grazzja <mailto:jacopo.grazzini@ec.europa.eu>

## extension of files of interest: what we deal with...

# output format
MDEXT=md
# supported formats
SASEXT=sas
STATAEXT=do
REXT=r
MEXT=m
PYEXT=py
SHEXT=sh
PLEXT=pl
DOSEXT=bat
EXTS=("${SASEXT}" "${STATAEXT}" "${REXT}" "${PYEXT}" "${MEXT}" "${SHEXT}" "${DOSEXT}" "${PLEXT}")

# documentation header anchor delimiters
SASDELIM=("" "/**" "*/") #("" "/**" "**/") 
STATADELIM=("" "/**" "*/") #("" "/**" "**/") 
RDELIM=("#" "##" "##")
MDELIM=("%" "%%" "%%")
PYDELIM=("" "\"\"\"" "\"\"\"")
SHDELIM=("#" "##" "##")
PLDELIM=("#" "##" "##")
BATDELIM=("REM" "REM REM" "REM REM")

# special character
SEP=_

## some basic global settings 

PROGRAM=`basename $0`
TODAY=`date +'%y%m%d'` # `date +%Y-%m-%d`

BASHVERS=${BASH_VERSION%.*}

# requirements

case "$(uname -s)" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MSYS*)      MACHINE=Msys;;
    MINGW*)     MACHINE=MinGw;;
    Windows*)   MACHINE=Windows;;
    SunOS*)     MACHINE=SunOS;;
    *)          MACHINE="UNKNOWN:${OSTYPE}"
esac

[ "${MACHINE}" = "Mac" ] && AWK=gawk || AWK=awk
[ "${MACHINE}" = "Mac" ] && SED=gsed || SED=sed

hash find 2>/dev/null || { echo >&2 " !!! Command FIND required but not installed - Aborting !!! "; exit 1; }
hash ${AWK} 2>/dev/null || { echo >&2 " !!! Command ${AWK} required but not installed - Aborting !!! "; exit 1; }
hash cat 2>/dev/null || { echo >&2 " !!! Command CAT required but not installed - Aborting !!! "; exit 1; }

## usage and help

function usage() { 
    ! [ -z "$1" ] && echo "$1";
    echo "";
    echo "=================================================================================";
    echo "${PROGRAM} : Generate markdown file(s) from self-documented program(s).";
    echo "";
    echo "Run: ${PROGRAM} -h for further help. Exiting program...";
    echo "=================================================================================";
    echo "";
    exit 1; 
}

function help() {
    ! [ -z "$1" ] && echo "$1";
    echo "";
    echo "=================================================================================";
    echo "${PROGRAM} : Automatic generation of markdown files from various self-documented ";
    echo "programs(R/SAS/Stata/Python/bash/DOS). ";
    echo "=================================================================================";
    echo "";
    echo "Syntax";
    echo "------";
    echo "    ${PROGRAM} [-h] [-v] [-t] [-p] [-f <fname>] [-d <dir>] <input>";
    echo "";
    echo "Parameters";
    echo "----------";
    echo " <input>    :   input defined as either a filename storing some (R/SAS/Stata/…)g";
    echo "                source code, or a directory containing such files;";
    echo " -f <name>  :   output name; it is either the name of the output file (with or";
    echo "                without '.md' extension) when the parameter <input> (see above)";
    echo "                is passed as a single file, or a generic suffix to be added to the";
    echo "                output filenames otherwise; when a suffix is passed, the '_'";
    echo "                symbol is added prior to the suffix; default: an empty suffix,";
    echo "                i.e. no suffix, is used;";
    echo " -d <dir>   :   output directory for storing the output formatted files; in the";
    echo "                case of test mode (see option -t below), this is overwritten by";
    echo "                the temporary directory /tmp/; default: when not passed, <dir> is";
    echo "                set to the same location as the input(s);";
    echo " -p         :   the name of the programming language is also added as a prefix to;";
    echo "                the name of the output file(s), e.g. the prefixes \"r_\", \"sas_\",";
    echo "                \"py_\", etc... are inserted into the name of the markdown files";
    echo " -h         :   display this help;";
    echo " -v         :   verbose mode (all kind of useless comments…);";
    echo " -t         :   test mode; a temporary output will be generated and displayed;";
    echo "                use it for checking purpose prior to the automatic generation.";
    echo "";
    echo "Notes";
    echo "-----";
    echo "The documentation is read directly from the headers of the source code files and";
    echo "follows a common framework (template):";
    echo "  * for R files, it shall be inserted like comments (i.e. preceded by #) and in";
    echo "  between two anchors: ## and ##,";
    echo "  * for SAS files, it shall be inserted like comments in /** and */ signs.";
    echo "";
    echo "Examples";
    echo "--------";
    echo "* Test the generation of a markdown file from the quantile.sas program and";
    echo "  display the result:";
    echo "    ${PROGRAM} -t $rootdir/library/pgm/quantile.sas";
    echo "";
    echo "* Actually generate (after the test) the file `quantile.md` and store it in a";
    echo "  dedicated folder:";
    echo "    ${PROGRAM} -v -d $rootdir/docs/md/library";
    echo "                     $rootdir/library/pgm/quantile.sas";
    echo "";
    echo "* Similarly with a R file, also adding the 'r_' to the name of the output file,";
    echo "  i.e. generating the file r_quantile.md:";
    echo "    ${PROGRAM} -v -d $rootdir/docs/md/library/pgm "; 
    echo "                     $rootdir/library/pgm/quantile.R";
    echo "";
    echo "* Automatically generate markdown files with suffix \"doc\" (i.e., quantile.sas";
    echo "  will be associated to the file sas_quantile_doc.md) from all existing source";
    echo "  files in a given directory:";
    echo "    ${PROGRAM} -v -p -d $rootdir/documentation/md/library/";
    echo "                     -f doc";
    echo "                     $rootdir/library/pgm/";
    echo "";
    echo "";
    echo "        European Commission  -   DG ESTAT   -   2016        ";
    echo "=================================================================================";
    exit 
}

## useful function declarations

function  greaterorequal (){
	# arguments: 	1:numeric 2:numeric
	# returns:	 	0 when argument $1 >= $2
	#				1 otherwise
	# note: 0 is the normal bash "success" return value (to be used in a "if...then" test)
	return `${AWK} -vv1="$1" -vv2="$2" 'BEGIN { print (v1 >= v2) ? 0 : 1 }'`
	# hash bc 2>/dev/null && 	return $(bc <<< "$1 < $2") # we test the opposite, see the note above
	# if [ ${1%.*} -eq ${2%.*} ] && [ ${1#*.} \> ${2#*.} ] || [ ${1%.*} -gt ${2%.*} ]; then
	#	return 0
	#else
	#	return 1
	#fi
}

function uppercase () {
	# argument: 	1:string
	# returns: 		a uppercase version of $1
	if `greaterorequal ${BASHVERS} 4`; then
		echo ${1^^} # does not work on bash version < 4
	else
		echo  $( tr '[:lower:]' '[:upper:]' <<< $1)
	fi
}

function lowercase () {
	# argument: 	1:string
	# returns: 		a lowercase version of $1
	if `greaterorequal ${BASHVERS} 4`; then
		echo ${1,,} # does not work on bash version < 4
	else
		echo  $( tr '[:upper:]' '[:lower:]' <<< $1)
	fi
}

function contains () {
	# argument: 	1:value 2:list
	# returns: 		0 when the value $1 appears (i.e., is contained) in the list $2
	#				1 otherwise
	# note: 0 is the normal bash "success" return value
	local e match="$1"
	shift
	for e; do [[ "$e" == "$match" ]] && return 0; done
	return 1
}

function regexMatch() { # (string, regex)
	if `greaterorequal ${BASHVERS} 3.3`; then
		eval "[[ \$1 =~ \$2 ]]"
		return $?
    else
		local string=$1	
		if [[ ${2: -1} = $ ]]; then
		local regex="(${2%$})()()()()()()()()$"
		else
		local regex="($2)()()()()()()()().*"
		fi
		regex=${regex//\//\\/}
		local replacement="\1\n\2\n\3\n\4\n\5\n\6\n\7\n\8\n\9\n"
		local oIFS=${IFS}
		IFS=$'\n'
		REMATCH=($(echo "$string" | ${SED} -rn "s/$regex/$replacement/p" | while read -r; do echo "${REPLY}"; done))
		IFS=${oIFS}
		[[ $REMATCH ]] && return 0 || return 1
	fi
}

## set global parameters

uEXTS=$(for i in ${EXTS[@]}; do uppercase $i; done)

dirname=
fname=
#progname=

pref=0
verb=0
test=0
 
## basic checks: options, command error or help

[ $# -eq 0 ] && usage
# [ $# -eq 1 ] && [ $1 = "--help" ] && help

# we use getopts to pass the arguments
# options are: [-d <dir>] [-f <fname>] [-p] [-h] [-v] [-t]
while getopts :d:f:phtv OPTION; do
    # extract options and their arguments into variables.
    case ${OPTION} in
	d)  dirname=${OPTARG}
            # check the existence of the directory
	    [ -d "${dirname}" ] || usage "!!! Output directory ODIR=${dirname} not found - Exiting !!!"
 	    ;;
	f)  fname=${OPTARG}
	    ;;
	h)  help #show help
	    ;;
	p)  pref=1
	    ;;
	t)  test=1
	    ;;
	v)  verb=1
	    ;;
	\?) #unrecognized option - show help
	    usage "!!! option ${OPTARG} not allowed - Exiting !!!"
	    ;;
    esac
done

shift $((OPTIND-1))  

# further checks (possible after the shifts above)
[ $# -lt 1 ] && usage "!!! Missing input PROGNAME argument - Exiting !!!"
# [ $# -gt 1 ] && usage "!!! Only one argument can be passed - Exiting !!!"

# in the case the -p option is passed, check the availability of SED command
[ ${pref} -eq 1 ] &&	\
	{ hash ${SED} 2>/dev/null ||  { echo >&2 " !!! Command ${SED} required but not installed - Aborting !!! "; exit 1; } }

# retrieve the input progname(s): all the arguments left
progname=("$@")
nprogs=${#progname[@]}
prog0=${progname[0]}

# new=()

for (( i=0; i<${nprogs}; i++ )); do
    # [ -n "${progname[$i]}" ]                                                  	\
    #     && usage "!!! Input not defined - Exiting !!!"
    ! [ -e "${progname[$i]}" ]                                                  	\
	&& usage "!!! Input file/directory ${progname[$i]} does not exist - Exiting !!!"
    # # in case a program file was passed, check that its format (i.e. the programming language
    # # used for its development) is actually supported for documentation
    # [ -f "${progname[$i]}" -a ext=`uppercase  ${progname[$i]##*.}` -a ! `contains ${ext} ${uEXTS[@]}`] \
    #	&& usage "!!! Format of input file ${progname[$i]} not supported - Exiting !!!"
done

# nprogs=${#new[@]}

## further settings

if [ ${test} -eq 1 ]; then
    # some settings for testing
    ECHOSTART=("echo" "  ... run: \"") 
    ECHOEND=("\"") 
    [ -z "${dirname}" ] && dirname=/tmp   
    [ -z "${fname}" ] && fname=`date +%Y%m%d-%H%M%S`

else
    # similar settings for testing
    ECHOSTART=
    ECHOEND=
    # define the default output directory path DIRNAME (when not passed with the
    # '-d' option) as the name of the directory storing the first file PROGNAME[0],
    # or PROGNAME[0] itself if it is a directory
    [ -z "${dirname}" ] && dirname=`dirname ${prog0}`
  
    # we define a generic name FNAME for the output markdown files as:
    #  - the generic string passed with the option '-f' when a directory or multiple
    #    files are passed in the main argument,
    #  - an empty string otherwise.
    # nothing to do: [ -n "${fname}" ] && [ ${nprogs} -gt 1 ] && fname=...as is
fi

if [ ${nprogs} -eq 1 ]; then
	# in case a single file PROG0 is provided and FNAME is not passed, force it
	! [ -d "${prog0}" ] && [ -z "${fname}" ] && fname=`basename ${prog0}` # ${prog0%.*}
	# in the case FNAME is actually a filename: some practical issue here: ensure
	# that we do not put any extension in the string defined by FNAME (this is added 
	# later on)
	[ -n "${fname}" ] && fname=${fname%.*} 
fi
## note that at this stage, FNAME can be empty iif [ ${nprogs} -gt 1 ] || [ -d "${prog0}" ]

# in the case FNAME is used as a prefix: if it is not empty and does not start with a '_' 
# character, then add it
[ ${nprogs} -gt 1 -o -d "${prog0}" ] 		\
    && [ -n "${fname}" ] && [ ${fname} != ${SEP}* ]  		\
    && fname=${SEP}${fname}

[ ${test} -eq 1 -o ${verb} -eq 1 ]                                        		\
    && echo "* Setting parameters: input/output filenames and directories..."   
	
if [ ${test} -eq 1 -o ${verb} -eq 1 ];    then
    echo ""
    [ ${verb} -eq 1 ] && echo "* Program configuration..."
    echo " `basename $0` will run with the following arguments:"
    echo "    - the output directory is: $dirname"
    for (( i=0; i<${nprogs}; i++ )); do
		inp=${progname[$i]}
		[ -d "$inp" ]                                                                   \
		    && (echo "    - for every program f.ext of ${inp}/, a documentation";           \
		        [ ${pref} -eq 1 ]                                                          	\
		        && echo "      will be stored in a file named \$ext_\$f${fname}.${MDEXT}"    \
		        || echo "      will be stored in a file named \$f${fname}.${MDEXT}")         \
		    || (echo "    - the documentation of ${inp} program will be stored";            \
		        [ ${pref} -eq 1 ]                                                            \
		        && ([ ${nprogs} -eq 1 -a -n ${fname} ]                                       \
	                    && echo "      in the file ${inp##*.}${SEP}${fname}.${MDEXT}"                  \
	                    || echo "      in the file ${inp##*.}${SEP}${inp%.*}${fname}.${MDEXT}")        \
		        || ([ ${nprogs} -eq 1 -a -n ${fname} ]                                       \
	                    && echo "      in the file ${fname}.${MDEXT}"                             \
	                    || echo "      in the file ${inp%.*}${fname}.${MDEXT}") )
    done
fi


## actual operation
[ ${test} -eq 1 -o ${verb} -eq 1 ]                                        		\
    && echo "* Actual operation: extraction of files headers..."

for (( i=0; i<${nprogs}; i++ )); do
    inp=${progname[$i]}
    # note that, as desired, the 'find' instruction below will return:
    #  - ${progname[$i]} itself when it is a file,
    #  - all the files in ${progname[$i]} when it is a directory.
    for file in `find $inp -type f`; do
	# get the file basename 
	base=`basename "$file"`
	# get the extension
	ext=`lowercase ${base##*.}`
	[ "$ext" == "bash" -o "$ext" == "csh" ] && ext=sh
	[ "$ext" == "perl" ]                    && ext=pl
	# check that it is one of the types (i.e. programming languages) whose
	# documentation is actually supported
	! `contains ${ext} ${EXTS[@]}` && continue
	# retrieve the delimiters associated to the file format
	pDELIM=`uppercase ${ext}`DELIM[@]	
	DELIM=("${!pDELIM}")												
	# retrieve the desired output name based on generic FNAME and the MDEXT extension: 
	# this will actually depend only on whether one single file was passed or not
	[ ${nprogs} -eq 1 -a ! -d ${prog0} ]             \
	    && filename=${fname}.${MDEXT}                \
	    || filename=${base%.*}${fname}.${MDEXT}                                      
	# by convention, avoid occurrences of "__" in the output filename (note the presence
	# of double brackets [[ and ]] )
	# we could also have tested `regexMatch "${filename}" "^${SEP}.*"`
	[ ${pref} -eq 1 ]                                \
	    && { [ ${filename} == ${SEP}* ]              \
	    && filename=${ext}${filename}                \
	    || filename=${ext}${SEP}${filename} ; }
	# finally add the output DIRNAME to the FILENAME
	filename=${dirname}/${filename}
	[ ${verb} -eq 1 -a ! ${test} -eq 1 ]             \
	    && echo "    + processing $ext file $f => MD file $filename ..."
	# R, Perl, Matlab, bash and Dos files - the patterns used as markers of the beginning and the end of the
	# documentation header are identical (## or %%) and each comment line must start with a marker in the first 
	# field (#) must be replaced
	# SAS, Python and Stata files - everything in between the beginning and end anchor patterns is regarded as 
	# a comment, so there is no need to use a marker for commenting lines
	# Run the extraction as follows:
	#   (i) look for the pattern marking the beginning of the documentation (e.g., ##, %%, """, or /**)
	#   (ii) check in all following lines whether the pattern marking the end of the documentation (e.g., ##, 
	#        %%, """, or */) is present; if not, print the line, possibly deleting the pattern at the beginning
	#        of the line
	#   (iii) when the end pattern is found, skip the rest of the code
	${AWK} -v cdelim="${DELIM[0]}" -v bdelim="${DELIM[1]}"  -v edelim="${DELIM[2]}"	   \
	    'BEGIN {s=0; beg="^"bdelim; end="^"edelim;
	        # [:alnum:]: alphanumeric characters: [:alpha:] and [:digit:] 
	        # [:print:]: printable characters: [:alnum:], [:punct:], and space. 
	        # [:blank:]: blank characters: space and tab. 
	        # beg="^"bdelim"[[:alnum:]]*"; end="^"edelim"[[:alnum:]]*"; core="^"cdelim"[[:alnum:]]*"
	        }
	    # start whith the first occurence of the anchor patterns, ignoring whatever comes before
	    NF==0 && s==0 {NR=0} 
	    # first line of documentation header
	    NR==1 && match($0, beg) {if (s==0) {s=1}; next} 			
	    # last line
	    s==1 && match($0, end)  {s=-1; next}					
	    # writing the core of the documentation; note the $1=$1 to delete trailing space
	    s==1 { if (cdelim != "") {sub($1,""); $1=$1}; print $0}
	    ' ${file} > $filename 
	# check that the file is not empty
	! [ -s ${filename} ] && { echo "! empty output markdown file when processing $file !"; rm -f  ${filename}; }
	# display in case of test
        if [ ${test} -eq 1 ];    then
	    echo ""
	    echo "Result of automatic Markdown extraction from test input file $f"
	    [ ${nprogs} -gt 1 ] && echo "(first found in $progname directory)"
	    echo "------------------------------------------"
	    cat ${filename}
	    echo "------------------------------------------"
	    rm -f ${filename}
	    break
        fi
    done
done

[ ${test} -eq 1 -o ${verb} -eq 1 ]  && echo 