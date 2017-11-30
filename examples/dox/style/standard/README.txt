
Generate a duplicate of the CSS doxygen uses using:

/cygdrive/c/PGM/doxygen.exe -w html head.html foot.html css.css ../dox/doxygen-eusilc-config.cfg

Then modify the CSS that Doxygen uses to change the background colour for the fenced blocks.
In the CSS the relevant class is div.fragment. 
Changing the background-color here changes the background colour for a fenced code block.
Point the doxyfile HTML_STYLESHEET setting to point at the modified CSS.