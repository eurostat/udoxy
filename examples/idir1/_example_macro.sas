/** THIS LINE WILL BE IGNORED WHEN EXTRACTING THE DOCUMENTATION HEADER
## SAS macro {#sas__example_macro}
Does a great job (in [`SAS`](https://www.sas.com/)).

    ~~~sas
    %_example_macro(data, a, b, _c_=, d=, e=1, f=False);
    ~~~

### Arguments
* `data` : some beautiful data that looks like a nice table

 var1 | var2 | var3 
-----:|:----:|----:
1     |  yes | 0
0     |  no  | 1

* `a` : first input parameter;
* `b` : second input parameter;
* `d` : (_option_) some parameter; default: `d=a`;
* `e` : (_option_) numeric parameter; default: `e=1`;
* `f` : (_option_) boolean parameter (`True`/`False`); default: `f=False`.

### Returns
`_c_` : output string parameter.

### Examples
Run macro `%%_example_your_macro` (if it ever exists).

### Note
Visit the [address](http://www.some_macro.html) that certainly does not exist.

### See also
[_example_method](@ref py__example_method), [_example_script](@ref sh__example_script), 
[_example_function](@ref r__example_function), [_example_function](@ref m__example_function), 
[_example_batch](@ref bat__example_batch).
*/ /* THIS LINE WILL ALSO BE IGNORED */
/** \cond */ 

/**
THIS DUMMY COMMENT SHOULD BE IGNORED
*/

/* main macro _example_macro */
%macro _example_macro(data
		    , a
		    , b
		    , _c_=
		    , d=
		    , e=
		    , f=
		    );
	/* whatever... */
	%if &data= or &_c_= %then
	    %goto exit;
	%if &e= %then 	%let e=1; 
	%if &d= %then 	%let d=&a; 
	%if &f= %then 	%let f=False; 

	%local _c;
	%let _c=%eval(&b / &e);
	%if "&f" = "True" %then 
	    %let _c=%eval(&a + &c);
	%let _c = &d.&_c;

/**
THIS DUMMY COMMENT SHOULD ALSO BE IGNORED
*/

	/* return some output */
	data _null_;
	    call symput("&_c_","&_c");
	run;

	%exit:
%mend _example_macro;


/** \endcond */