#### Guidelines and tools for generic code documentation (`bash`/`Perl`/`Python`/`R`/`Matlab`/`SAS`/`Stata`/`DOS`/...).

##### Description

An appropriate documentation will enable:
* **users** to efficiently run and (re)use a program/code,
* **developers** to maintain, share, extend, and migrate a program.

Say it otherwise, it should address the needs of all different _produsers'_ profiles. 
For that reason, it will be made available not only as an **inline documentation** (visible by those who actually implement the code, _e.g._ through comments in the code), but as a **portable document** (visible by those who run the code, _e.g._ through a browsable interface like html) as well.
To do so, we suggest to adopt a common way for describing and documenting source code/programs regardless of the platform (language, software) used for the implementation. The solution we propose in practice (see our motivation [**here**](rationale.md)) is the following:
* **an "inline" documentation is systematically inserted in the header** (_e.g._, top of the program file storing a macro, a function, _etc_...),
* **this documentation appears as comments** inside the programs (_e.g._, in between `/*` and `*/` marks for many languages),
* **the human-readable [`markdown`](https://daringfireball.net/projects/markdown/) language is adopted** for writing the source code documentation,
* **a (`bash`) script, namely [`src2mddoc.sh`](https://github.com/gjacopo/udoxy/blob/master/src2mddoc.sh),** for the automatic extraction of the formatted documentation header from the source files,
* **the documentation generator [`Doxygen`](http://www.stack.nl/~dimitri/doxygen/) is used** to generate a user-friendly browsable "online" documentation.

Rather than describing IT tools, the purpose of the documentation is to **describe the underlying statistical processes**. Therefore, it is important that the documentation does not restrict to a single programming language or software, but instead supports various different implementations.
In this aspect, we hereby provide with the [common guidelines](guidelines.md) and templates to inline document:
* `SAS`, `R`, `Stata`, `Matlab`, `Perl` and `Python` programs/functions,
* `bash` and `DOS` scripts.

as well as the [tool](usage.md) to automatically extract the inline documentation, and the [commands](examples.md) to generate an online document that merges the different documentations.  

##### Table of Contents

* [rationale](rationale.md): Rationale behind these choices (of documentation language, of documentation generator,...) that have been made.
* [guidelines](guidelines.md): Set of guidelines used for the documentation of various programs (function/macro/script/...) in different languages.
  + [generic template](guidelines.md#Generic_template).
  + [`SAS` rules](guidelines.md#SAS_rules).
  + [`Stata` rules](guidelines.md#Stata_rules).
  + [`R` rules](guidelines.md#R_rules).
  + [`Python` rules](guidelines.md#Python_rules).
  + [`bash` rules](guidelines.md#bash_rules).
  + [`Matlab` rules](guidelines.md#Matlab_rules).
  + [`DOS` rules](guidelines.md#DOS_rules).
* [usage](usage.md): Usage of the script for the extraction of the documentation.
* [examples](examples.md): Examples of generation of online browsable documentation.

##### Notes

1. The approach proposed herein is adapted to the documenting of stand-alone programs and processes.
It can be can easily be extended (_e.g._, slightly adapting the guidelines and tools) to support other software/programing languages. 
2. The solution proposed addresses the needs of all _produsers'_ profiles (_i.e._, both users who aim at running and (re)using a program/code, and developers who want  to maintain, share, extend, and migrate a program).

##### <a name="About"></a>About

This material aims at **supporting the development, sharing and reuse of open IT components**, _e.g._, deployed in production environment, and **ensuring complete transparency of in-house computational resources**, _e.g._ regardless of the platform used for the implementation as presented in:

* Grazzini J. and Lamarche P. (2017): [**Production of social statistics... goes social!**](https://www.conference-service.com/NTTS2017/documents/agenda/data/abstracts/abstract_124.html), in _Proc.  New Techniques and Technologies for Statistics_.
* Grazzini J. and Pantisano F. (2015): [**Collaborative research-grade software for crowd-sourced data exploration: from context to practice - Part I: Guidelines for scientific evidence provision for policy support based on Big Data and open technologies**](http://publications.jrc.ec.europa.eu/repository/bitstream/JRC94504/lb-na-27094-en-n.pdf), _Publications Office of the European Union_, doi:[10.2788/329540](http://dx.doi.org/10.2788/329540).
