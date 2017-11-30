@ECHO off

REM REM THIS LINE WILL BE IGNORED WHEN EXTRACTING THE DOCUMENTATION HEADER
REM ## DOS batch {#bat__example_batch}
REM Does a great job (in `DOS`).
REM 
REM      ~~~bat
REM      > _example_batch.bat <data> <a> <b> [-d <d>] [-e <e>]  [-f <f>]
REM      ~~~
REM 
REM ### Arguments
REM * `data` : some beautiful data file that contains a nice table
REM 
REM  var1 | var2 | var3 
REM -----:|:----:|----:
REM 1     |  yes | 0
REM 0     |  no  | 1
REM
REM * `a` : first input parameter;
REM * `b` : second input parameter;
REM * `-d <d>` : (_option_) some parameter; default: `d=a` is used;
REM * `-e <e>` : (_option_) numeric parameter; default: `e=1`;
REM * `-f <f>` : (_option_) boolean parameter; default: `f=0`.
REM
REM ### Returns
REM `c` : output string parameter.
REM 
REM ### Example
REM See if any, for instance:
REM
REM ~~~bat
REM > _example_batch.bat data 10 2 -d aaa -f TRUE
REM ~~~
REM
REM ### Note
REM Visit the [address](http://www.some_batch.html) that certainly does not exist.
REM
REM ### See also
REM [_example_method](@ref py__example_method), [_example_function](@ref r__example_function), 
REM [_example_macro](@ref sas__example_macro), [_example_function](@ref m__example_function), 
REM [_example_script](@ref sh__example_script).
REM REM THIS LINE WILL ALSO BE IGNORED

SET data=%~1
SET a=%~2
SET b=%~3
SHIFT & SHIFT & SHIFT

REM REM 
REM THIS DUMMY COMMENT SHOULD BE IGNORED
REM REM 

SET d=
SET e=1
SET f=FALSE

:loop
IF NOT "%1"=="" (
    IF "%1"=="-d" (
        SET d=%2
        SHIFT
    ) ELSE IF "%1"=="-e" (
        SET e=%2
        SHIFT
    ) ELSE IF "%1"=="-f" (
        SET f=%2
        SHIFT
    )
    SHIFT
    GOTO loop
)

IF NOT exist "%data%" ( GOTO exit )

IF "%d%"=="" (
	SET d=%a%
	)

SET /a "c=%b%/%e%"

IF "%f%"=="TRUE" (
	SET /a "c=%a%+%c%"
	)
	
SETLOCAL ENABLEDELAYEDEXPANSION
SET "dummy=%c%"
SET c=%d%!dummy!

REM REM 
REM THIS DUMMY COMMENT SHOULD ALSO BE IGNORED
REM REM 

ECHO !c!
:exit