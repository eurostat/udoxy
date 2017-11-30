#!/bin/bash
# @about: 	test example for automatic generation of html documentation from markdown files
# @date:    10/11/2017
# @credit:  grazzja <mailto:jacopo.grazzini@ec.europa.eu>
 
case "$OSTYPE" in
  #linux*)   	echo "LINUX" ;;
  #darwin*)  	echo "OSX" ;; 
  #win*)     	echo "Windows" ;;
  cygwin*)  	DRIVE=/cygdrive ;;
  msys*|mingw*)	DRIVE=;;
  #bsd*)     	echo "BSD" ;;
  #solaris*) 	echo "SOLARIS" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

DOCGEN=doxygen.exe # CHANGE FOR YOUR OWN...

ROOTDIR=${DRIVE}/h/doxy # CHANGE FOR YOUR OWN...
# ROOTDIR=h:/doxy

SRCDIR=${ROOTDIR}/examples

REL_ROOTDIR=.
# note: we have some issues on Cygwin when using DOXYGEN with absolute paths
# we use relative paths instead 
# in the following, REL_ROOTDIR is relative to the location of this files
# if one wanted to use absolute paths instead, she should replace it with 
# SRCDIR instead.

DIRDOC=${REL_ROOTDIR}/odir

CFG_DIR=${REL_ROOTDIR}/dox
CFG_FILE=doxygen-dumb-config.cfg

## set output parameters
input_directory=${DIRDOC}/md
static_directory=${input_directory}/_static_
process1_directory=${input_directory}/process1
process2_directory=${input_directory}/process2
output_directory=${DIRDOC}/

doxygen_directory=${CFG_DIR}
image_directory=${DIRDOC}/img

cfg=${CFG_DIR}/${CFG_FILE}
dox=${DRIVE}/c/PGM/doxygen/bin/${DOCGEN}

ocfg=0

idir=0
odir=0
doxdir=0

ohtml=0
generate_html=YES
html_output=${output_directory}/html # relative path... or absolute path: ${DIRDOC}/html? you choose...

olatex=0
generate_latex=NO
latex_output=${output_directory}/latex # relative path

oxml=0
generate_xml=NO
xml_output=${output_directory}/xml # relative path

oman=0
generate_man=NO
man_output=${output_directory}/man # relative path

ortf=0
generate_rtf=NO
rtf_output=${output_directory}/rtf # relative path

test=0
verb=0

export SRCDIR=${REL_ROOTDIR} 
#${SRCDIR}
export INPUT_DIRECTORY=${input_directory}
export STATIC_DIRECTORY=${static_directory}
export PROCESS1_DIRECTORY=${process1_directory}
export PROCESS2_DIRECTORY=${process2_directory}
export DOXYGEN_DIRECTORY=${doxygen_directory}
export IMAGE_DIRECTORY=${image_directory}
export GENERATE_HTML=${generate_html}
export HTML_OUTPUT=${html_output}
export GENERATE_LATEX=${generate_latex}
export LATEX_OUTPUT=${latex_output}
export GENERATE_MAN=${generate_man}
export MAN_OUTPUT=${man_output}
export GENERATE_XML=${generate_xml}
export XML_OUTPUT=${xml_output}
export GENERATE_RTF=${generate_rtf}
export RTF_OUTPUT=${rtf_output}
# envsetting="INPUT_DIRECTORY=${input_directory} OUTPUT_DIRECTORY=${output_directory}"
# envsetting+=" DOXYGEN_DIRECTORY=${doxygen_directory} IMAGE_DIRECTORY=${image_directory}"
# envsetting+=" GENERATE_HTML=${generate_html} HTML_OUTPUT=${html_output}"
# envsetting+=" GENERATE_LATEX=${generate_latex} LATEX_OUTPUT=${latex_output}"
# envsetting+=" GENERATE_MAN=${generate_man} MAN_OUTPUT=${man_output}"
# envsetting+=" GENERATE_XML=${generate_xml} XML_OUTPUT=${xml_output}"
# envsetting+=" GENERATE_RTF=${generate_rtf} RTF_OUTPUT=${rtf_output}"
# echo "env ${envsetting} ${dox} ${cfg}"
# env ${envsetting} ${dox} ${cfg}

echo ${dox} ${cfg}
${dox} ${cfg}

