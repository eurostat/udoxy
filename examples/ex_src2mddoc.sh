#!/bin/bash
# @about: 	automatic markdown files from source code files in various formats
# @date:    21/11/2017
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

ROOTDIR=${DRIVE}/h/doxy # CHANGE FOR YOUR OWN...
# ROOTDIR=h:/doxy
EXTRACTOR=src2mddoc.sh

SRCDIR=${ROOTDIR}/examples
DIRDOC=${SRCDIR}/odir

INPUT_DIRECTORY=${SRCDIR}/
idir1_directory=${INPUT_DIRECTORY}/idir1
idir2_directory=${INPUT_DIRECTORY}/idir2

OUTPUT_DIRECTORY=${DIRDOC}/md/
process1_directory=${OUTPUT_DIRECTORY}/process1
process2_directory=${OUTPUT_DIRECTORY}/process2

extractor=${ROOTDIR}/${EXTRACTOR}

# from input IDIR1
echo Extract documentation from idir1/_example_macro.sas into process1/
${extractor} -v -p -d ${process1_directory}/ ${idir1_directory}/_example_macro.sas
echo Extract documentation from idir1/_example_function.R into process2/
${extractor} -v -p -d ${process2_directory}/ ${idir1_directory}/_example_function.R
echo Extract documentation from idir1/_example_script.sh into process2/
${extractor} -v -p -d ${process2_directory}/ ${idir1_directory}/_example_script.sh

# from input IDIR2
echo Extract documentation from idir2/_example_method.py into process1/
${extractor} -v -p -d ${process1_directory}/ ${idir2_directory}/_example_method.py
echo Extract documentation from idir1/_example_batch.bat into process1/
${extractor} -v -p -d ${process1_directory}/ ${idir2_directory}/_example_batch.bat
echo Extract documentation from idir1/_example_function.m into process2/
${extractor} -v -p -d ${process2_directory}/ ${idir2_directory}/_example_function.m

