#!/usr/bin/env python
# -*- coding: utf-8 -*-

""" THIS LINE WILL BE IGNORED WHEN EXTRACTING THE DOCUMENTATION HEADER
## Python method {#py__example_method}
Does a great job (in [`Python`](https://www.python.org/)).

     ~~~py
     c = _example_method(data, a, b, d=, e=1, f=False);
     ~~~

### Arguments
* `data` : some beautiful data that looks like a nice table

 var1 | var2 | var3 
-----:|:----:|----:
1     |  yes | 0
0     |  no  | 1

* `a` : first input parameter;
* `b` : second input parameter;
* `d` : (_option_) some parameter; default: `d=a` is converted to a string;
* `e` : (_option_) numeric parameter; default: `e=1`;
* `f` : (_option_) boolean parameter (`True`/`False`); default: `f=False`.

### Returns
`c` : output string parameter.

### Examples
See if any, for instance:

~~~py
data = np.rand(1,2)
c = _example_method(data, 3, 2, d="aaa", f=TRUE)
~~~

### Note
Visit the [address](http://www.some_method.html) that certainly does not exist.

### See also
[_example_macro](@ref sas__example_macro), [_example_script](@ref sh__example_script), 
[_example_function](@ref r__example_function), [_example_function](@ref m__example_function), 
[_example_batch](@ref bat__example_batch).
"""  # THIS LINE WILL ALSO BE IGNORED

from os import path as path
import numpy as np

"""
THIS DUMMY COMMENT SHOULD BE IGNORED
"""

def c = _example_method(data, a, b, d=, e=1, f=False):
	if path.isfile(data): 
		return
	if not d:
		d=str(a)
	c = b / e
	if f: 
		c = a + c

"""
THIS DUMMY COMMENT SHOULD ALSO BE IGNORED
"""
		
	return '{0}.{1}'.format(d, str(c))
	
