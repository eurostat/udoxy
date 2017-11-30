## Matlab function {#m__example_function}
Does a great job (in [`Matlab`](https://www.mathworks.com/products/matlab.html)).

~~~matlab
c = _example_function(data, a, b);
c = _example_function(data, a, b, d=, e=1, f=false);
~~~

### Arguments
* `data` : some beautiful array that cab be inferred like a nice table

var1 | var2 | var3
-----:|:----:|----:
1 | yes | 0
0 | no | 1

* `a` : first input parameter;
* `b` : second input parameter;
* `d` : (_option_) some parameter; default: `d=a` is converted to a string;
* `e` : (_option_) numeric parameter; default: `e=1`;
* `f` : (_option_) boolean parameter; default: `f=false`.

### Returns
`c` : output string parameter.

### Example
See if any, for instance:

~~~matlab
data = false(1,2);
c = _example_function(data, 3, 2, d="aaa", f=true);
~~~

### Note
Visit the [address](http://www.some_function.html) that certainly does not exist.

### See also
[_example_method](@ref py__example_method), [_example_script](@ref sh__example_script),
[_example_macro](@ref sas__example_macro), [_example_function](@ref r__example_function),
[_example_batch](@ref bat__example_batch).
