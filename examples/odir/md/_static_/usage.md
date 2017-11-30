## Usage {#usage}

### This software *current usage* 

None actually... but what not imagine something!

You could run the following `SAS` program:
~~~sas
	DATA dat;
		dumb=1; dumber=1; output;
	run;
	%let a=1;
	%let b=2;
	%let c=;
	%let d=ijkl;
	%let f=True;
	%_example_macro(dat, &a, &b, _c_=c, d=&d, f=&f);
~~~

or, say, some `R` equivalent:
~~~r
	> dat <- c(1,2)
	> _example_function(dat, 3, 2, d="aaa", f=TRUE)
~~~

Totally dumb, isn't it? We can further describe other languages' examples as well.