udoxy
=====

Guidelines and script for generic code documentation in various languages (`R`/`SAS`/`Stata`/`Python`/`Matlab`/`bash`/`DOS`/...).
---

**About**

We provide hereby a set of common guidelines and templates for a generic inline source code documentation (using `markdown` language) as well as a `bash` script for the automatic generation of a derived online documentation (using `Doxygen` generator). 

<table align="center">
    <tr> <td align="left"><i>documentation</i></td> <td align="left">available at: https://gjacopo.github.io/udoxy/</td> </tr> 
    <tr> <td align="left"><i>since</i></td> <td align="left">2016</td> </tr> 
    <tr> <td align="left"><i>license</i></td> <td align="left"><a href="https://joinup.ec.europa.eu/sites/default/files/eupl1.1.-licence-en_0.pdfEUPL">EUPL</a> </td> </tr> 
</table>

This material aims at **supporting the development, sharing and reuse of open IT components**, _e.g._, deployed in production environment, and **ensuring complete transparency of in-house computational resources**, _e.g._ regardless of the platform used for the implementation ([Grazzini and Pantisano, 2015; Grazzini and Lamarche, 2017](#References)). 

**<a name="Description"></a>Description**

We adopt a common way for describing and documenting stand-alone source code/programs regardless of the platform (language, software) used for the implementation. 
In practice, the source code documentation will be made available not only as an **inline documentation** (visible by those who actually implement the code, _e.g._ through comments in the code), but as a **portable document** (visible by those who run the code, _e.g._ through a browsable interface like html) as well:
* **an "inline" documentation is systematically inserted in the header** (_e.g._, top of the program file storing a macro, a function, _etc_...),
* **this documentation appears as comments** inside the programs (_e.g._, in between `/*` and `*/` marks for many languages),
* **human-readable language [_markdown_](https://daringfireball.net/projects/markdown/) is adopted** for writing the source code documentation,
* **a (`bash`) script, namely [`src2mddoc.sh`](src2mddoc.sh),** for the automatic extraction of the formatted documentation header from the source files,
* **documentation generator [_Doxygen_](http://www.stack.nl/~dimitri/doxygen/) is used** to generate a user-friendly browsable "online" documentation.

Note that this way, it is not necessary to "group" the source code that is documented (it can be left as is, in its original location), instead it is enough to "centralise" the _markdown_ generated files (though this could be avoided as well).

<table>
<tr>
<td align="centre"><kbd><img src="https://github.com/gjacopo/udoxy/blob/master/docs/example_ping.png" alt="example PING quantile" width="700"  align="centre"> </kbd></td>
</tr>
<footer>
<td align="centre"><i>Example of "agnostic" documentation using the same generic templates.</i></td>
</footer>
</table>

**<a name="TableofContents"></a>Table of Contents**

* [rationale](https://github.com/gjacopo/udoxy/blob/master/docs/rationale.md): Rationale behind these choices (of documentation language, of documentation generator,...) that have been made.
* [guidelines](https://github.com/gjacopo/udoxy/blob/master/docs/guidelines.md): Set of guidelines used for the documentation of various programs (function/macro/script/...) in different languages, _e.g._
  + generic template,
  + `SAS` rules,
  + `Stata` rules,
  + `R` rules,
  + `Python` rules,
  + `bash` rules,
  + `Matlab` rules,
  + `DOS` rules;
* [usage](https://github.com/gjacopo/udoxy/blob/master/docs/usage.md): Usage of the script for the extraction of the documentation;
* [examples](https://github.com/gjacopo/udoxy/blob/master/docs/examples.md): Examples of generation of online browsable documentation.

**<a name="Notes"></a>Notes**

The approach proposed herein is adapted to the documenting of stand-alone programs and processes.
It can be can easily be extended (_e.g._, slightly adapting the guidelines and tools) to support other software/programing languages. 

**<a name="References"></a>References**

* Grazzini J. and Lamarche P. (2017): [**Production of social statistics... goes social!**](https://www.conference-service.com/NTTS2017/documents/agenda/data/abstracts/abstract_124.html), in _Proc.  New Techniques and Technologies for Statistics_.
* Grazzini J. and Pantisano F. (2015): [**Collaborative research-grade software for crowd-sourced data exploration: from context to practice - Part I: Guidelines for scientific evidence provision for policy support based on Big Data and open technologies**](http://publications.jrc.ec.europa.eu/repository/bitstream/JRC94504/lb-na-27094-en-n.pdf), _Publications Office of the European Union_, doi:[10.2788/329540](http://dx.doi.org/10.2788/329540).
