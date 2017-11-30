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
