## R function {#r__example_function}
Does a great job (in [`R`](https://www.r-project.org/)).

~~~r
> c <- _example_function(data, a, b, d=, e=1, f=FALSE);
~~~

### Arguments
* `data` : some beautiful data that looks like a nice table

var1 | var2 | var3
-----:|:----:|----:
1 | yes | 0
0 | no | 1

* `a` : first input parameter;
* `b` : second input parameter;
* `d` : (_option_) some parameter; default: `d=a` is converted to a string;
* `e` : (_option_) numeric parameter; default: `e=1`;
* `f` : (_option_) boolean parameter; default: `f=FALSE`.

### Returns
`c` : output string parameter.

### Example
See if any, for instance:

~~~r
> source("_example_function.R")
> data <- c(1,2)
> `_example_function`(data,3,2,d="aaa",f=TRUE)
~~~

### Note
Visit the [address](http://www.some_function.html) that certainly does not exist.

### See also
[_example_method](@ref py__example_method), [_example_script](@ref sh__example_script),
[_example_macro](@ref sas__example_macro), [_example_function](@ref m__example_function),
[_example_batch](@ref bat__example_batch).
