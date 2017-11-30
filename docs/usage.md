##### `doxy@ESTAT` usage

First, document your source code file(s) according to the [guidelines](guidelines.md). Given such source file(s), you can then run the script [`src2mddoc.sh`](https://github.com/gjacopo/udoxy/blob/master/src2mddoc.sh) with the following syntax:

	bash src2mddoc.sh [-h] [-v] [-t] [-p] [-f <fname>] [-d <dir>] <filename>
	
where the parameters are:
* `<input>`    :   input defined as either the filename storing the source code, or the directory containing this(ese) file(s);
* `-f <name>`  :   (_option_) output name; it is either the name of the output file (with or without extension) when the parameter `<input>` (see above) is passed as a file, or a generic suffix to be added to the  output filenames otherwise; when a suffix is passed, the `_` symbol is added prior to the suffix; by default, an empty suffix (_i.e._ no suffix) is used;
* `-d <dir>`  :   (_option_) output directory for storing the output formatted files; in the case of test mode (see option `-t` below), this is overwritten by the temporary directory `/tmp/`; default: when not passed, `<dir>` is set to the same location as the input(s);
* `-p` : (_option_) the name of the programming language is also added as a prefix to the	name of the output file(s), _e.g._ the prefixes `r_`, `sas_`, `py_`, _etc_... are inserted into the name of the `markdown` file(s);
* `-h`         :   (_option_) setting this option will display the help;
* `-v`         :   (_option_) setting this option will set the verbose mode (all kind of useless comments);
* ` -t`         :   (_option_) test mode; a temporary output will be generated and displayed; use it for checking purpose prior to the automatic generation.

so as to extract the documentation header(s) from the source file(s) and create one (or several) `markdown` formatted file(s) containing the documentation alone. 
Practical examples of usage are presented in the [examples page](examples.md) of this documentation.

This(ese) file(s) will look exactly like the header(s) in the program(s) if you except the markers of the specific language comment and can then be used to generate the online/browsable documentation. [`Doxygen`](http://www.doxygen.org) is the tool used to actually generate the documentation.  The full set of guidelines/best practices for running this software is available in the 
[dedicated section](http://www.stack.nl/~dimitri/doxygen/manual/starting.html) of the `Doxygen` website.

