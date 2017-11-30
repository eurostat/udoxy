## DOS batch {#bat__example_batch}
Does a great job (in `DOS`).

~~~bat
> _example_batch.bat <data> <a> <b> [-d <d>] [-e <e>] [-f <f>]
~~~

### Arguments
* `data` : some beautiful data file that contains a nice table

var1 | var2 | var3
-----:|:----:|----:
1 | yes | 0
0 | no | 1

* `a` : first input parameter;
* `b` : second input parameter;
* `-d <d>` : (_option_) some parameter; default: `d=a` is used;
* `-e <e>` : (_option_) numeric parameter; default: `e=1`;
* `-f <f>` : (_option_) boolean parameter; default: `f=0`.

### Returns
`c` : output string parameter.

### Example
See if any, for instance:

~~~bat
> _example_batch.bat data 10 2 -d aaa -f TRUE
~~~

### Note
Visit the [address](http://www.some_batch.html) that certainly does not exist.

### See also
[_example_method](@ref py__example_method), [_example_function](@ref r__example_function),
[_example_macro](@ref sas__example_macro), [_example_function](@ref m__example_function),
[_example_script](@ref sh__example_script).
