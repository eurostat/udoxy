#### Rationale for guidelines adoption 

######  Why documenting your code (if that's not already obvious)?

Beyond enabling the sharing and reuse of your code, the practical benefits of documenting it are in enabling reproducibility and verification, as well as possible extension and potential migration:
* _"A critical barrier to reproducibility in many cases is that the computer code is [not] available."_ ([Peng, 2011](#References)): computational resources should facilitate the participation of all and the integration of any additional  contribution, 
* _"Publish your code (even the small bits)"_ ([Goodman _et al._, 2014](#References)): even if there is no guarantee of quality, it can still potentially contribute to new experiments and help develop/deploy more advanced in-house analysis products,
* _"Freely provided working code - whatever its quality - improves programming and enables others to engage [with your research]"_ ([Barnes, 2010](#References)): thanks to a good documentation, any skilled person can modify the code to suit his/her needs, learn from its use and further contribute to its improvement. 

Hence, a good documentation is not only useful for the users to run and (re)use your code, but it will also help developers to maintain, share, extend, and migrate this code.

As stated in  ([Ince et al., 2011](#References)), _"with some exceptions, anything less than the release of source programs is intolerable for results that depend on computation"_. 
Ultimately, we believe that one should _"provide public access to scripts, runs, and results"_ ([Sandve _et al._, 2013](#References)), hence not only the outcomes of a given analysis, but the whole processes, data and tools necessary to produce it should be open and shared. Source code documentation overall supports these objectives. 

###### Why adopting markdown for the documentation?

[Lightweight markup languages](https://en.wikipedia.org/wiki/Lightweight_markup_language), _e.g._ [_markdown_](https://daringfireball.net/projects/markdown/), [_AsciiDoc_](http://asciidoc.org), provide formats that are both **processable by documentation generators**, and easily **readable by human produsers** (see also comparison between languages).

<table align="center">
<tr> 
    <td align="left" rowspan="2" bgcolor="#e6e6e6"><b>Language</b></td> 
    <td align="left" rowspan="2" bgcolor="#e6e6e6"><b>Supported implementations</b></td> 
    <td align="left" colspan="5" bgcolor="#e6e6e6"><b>Output formats</b></td> 
</tr> 
<tr> 
    <td align="center">XHTML</td> <td align="center">PDF</td> <td align="center">DocBook</td> <td align="center">ODF</td><td align="center">Doc</td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://asciidoc.org">AsciiDoc</a></i></td> 
    <td align="left"><code>Python</code>, <code>JavaScript</code>, <code>Ruby</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td><td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="https://daringfireball.net/projects/markdown/">markdown (and variants)</a></i></td> 
    <td align="left"><code>C</code>, <code>C#</code>, <code>Java</code>, <code>R</code>, <code>Python</code>, <code>JavaScript</code>, <code>Ruby</code>, <code>PHP</code>, <code>Perl</code>, <code>Haskell</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (HTML)</td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td><td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="https://www.mediawiki.org/wiki/MediaWiki">MediaWiki</a></i></td> 
    <td align="left"><code>PHP</code>, <code>Perl</code>, <code>Haskell</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center"><i>No</i></td> <td align="center"><i>No</i></td> <td align="center"><i>No</i></td><td align="center"><i>No</i></td> 
</tr> 
<tr> 
    <td align="left"><i><a href="http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html">reStructuredText</a></i></td> 
    <td align="left"><code>Java</code>, <code>Python</code>, <code>Haskell</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (HTML,XML)</td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td><td align="center"><i>No</i></td> 
</tr> 
</table>

For some languages, the literature may provide "consistent" examples of documentation, still they are often not generic enough and do not go beyond the inline documentation (targeting the developer, not the user).
For instance, there is, to our knowledge, no documentation framework or built-in tool that is compatible with `SAS` (a tool like [_DocItOut_](https://choonchernlim.com/docitout/) is not maintained since 2008 anymore). 

Based on the results reported in the wiki mentioned above, we preselected 4 markup languages that are: _(i)_ widely adopted opens-source, _(ii)_ enable HTML import/export (note though that Textile does not enable HTML import), and _(iii)_ are supported (possibly through different documentation generators) by more than one language.
Finally, _markdown_ language shall be adopted:
* it is human-readable, easy-to-learn,
* it is common to many languages, and in particular, in view of future migration, to `R` through its [_Rmarkdown_](http://rmarkdown.rstudio.com) variant,
* it is supported by different documentation generators (see below).

Note that it is also important that the use of a specific documentation style (possibly associated to a given generator) does not alter the natural documentation of a language (intrinsic to the language itself). In many languages (like `SAS` or `Stata`), it does not represent an issue since the documentation is inserted as comments like in `C` language.

###### Why using Doxygen as the documentation generator?

In order to create portable documentation, documentation generators can be used, Such tools - _e.g._ well-known [_javadoc_](http://www.oracle.com/technetwork/java/javase/documentation/index-jsp-135444.html) - generate software documentation from internal code comments.

<table align="center">
<tr bgcolor="#e6e6e6"> 
    <td colspan="2" rowspan="2"> </td> 
    <td align="center" colspan="6"><b><i>generator</i></b></td> 
</tr> 
<tr valign="middle" bgcolor="#e6e6e6"> 
    <td align="left"><i><a href="http://docpp.sourceforge.net">Doc++</a></i></td> 
    <td align="left"><i><a href="http://www.stack.nl/%7Edimitri/doxygen/">Doxygen</a></i></td> 
    <td align="left"><i><a href="https://developer.apple.com/library/mac/documentation/DeveloperTools/Conceptual/HeaderDoc/intro/intro.html">HeaderDoc</a></i></td> 
  <td align="left"><i><a href="http://www.naturaldocs.org">Natural Docs</a></i></td> 
    <td align="left"><i><a href="https://rfsber.home.xs4all.nl/Robo/">RoBODoc</a></i></td> 
    <td align="left"><i><a href="http://www.sphinx-doc.org/en/stable/">Sphinx</a></i></td> 
</tr> 
<tr valign="middle"> 
    <td align="center" rowspan="12" bgcolor="#e6e6e6"><b><i>programming languages</i></b></td> 
    <td align="center" bgcolor="#e6e6e6"><code>C/C++</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (partial)</td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>C#</code></td> 
    <td align="center"></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td> 
    <td align="center"></td> 
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>Java</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (partial)</td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center"></td> 
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>Python</code></td> 
    <td align="center"></td>  
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (partial)</td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>JavaScript</code></td> 
    <td align="center"></td> 
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>IDL</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center"></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td> 
    <td align="center"></td> 
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>PHP</code></td> 
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (partial)</td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
 </tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>Perl</code></td> 
    <td align="center"></td>
    <td align="center"></td>
     <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>Ruby</code></td> 
    <td align="center"></td>
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (partial)</td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>SQL</code></td> 
    <td align="center"></td>
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (partial)</td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>Visual Basic</code></td> 
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (plugin)</td>
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (partial)</td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i> (plugin)</td>
    <td align="center"></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>R</code></td> 
    <td align="center"></td> 
    <td align="center"></td> 
    <td align="center"></td> 
    <td align="center"></td> 
    <td align="center"></td> 
    <td align="center"></td> 
</tr> 
<tr valign="middle"> 
    <td align="center" rowspan="7" bgcolor="#e6e6e6"><b><i>output types</i></b></td> 
    <td align="center" bgcolor="#e6e6e6"><code>HTML</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>XML</code></td> 
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>DocBook</code></td> 
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>man</code></td> 
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>RTF</code></td> 
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>PDF/PS</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
</tr> 
<tr valign="middle"> 
    <td align="center" bgcolor="#e6e6e6"><code>LaTex</code></td> 
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center"></td>
    <td align="center"></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
    <td align="center" bgcolor="#ffe6e6"><i>Yes</i></td>
</tr> 
</table>

Based on the results reported in the previously mentioned wiki, we preselected 6 documentation generators that are: _(i)_ open source, _(ii)_ multi-platform, _i.e._ running on Windows, Linux, Unix, Mac OS X and BSD operating systems (note though that _HeaderDoc_ is not directly running on Windows), and _(iii)_ support more than one language only.
Our final choice is _Doxygen_ also because it provides [support to markdown](http://www.stack.nl/%7Edimitri/doxygen/manual/markdown.html). 

**<a name="References"></a>References**

* Guidelines and best practices from [Write the Docs](http://www.writethedocs.org).
* Google documentation [style reference and guidelines](https://developers.google.com/style/).
* A list of [beautiful docs](https://github.com/PharkMillups/beautiful-docs).
* Goodman A. _et al._ (2014): [**Ten simple rules for the care and feeding of scientific data**](http://www.ploscollections.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pcbi.1003542&representation=PDF), _PLoS Computational Biology_, 10(4):e1003542, doi:[10.1371/journal.pcbi.1003542](https://dx.doi.org/10.1371/journal.pcbi.1003542).
* Sandve G.K. _et al._ (2013): [**Ten simple rules for reproducible computational research**](http://www.ploscompbiol.org/article/fetchObject.action?uri=info%3Adoi%2F10.1371%2Fjournal.pcbi.1003285&representation=PDF), _PLoS Computational Biology_, 9(10):e1003285, doi:[10.1371/journal.pcbi.1003285](https://dx.doi.org/10.1371/journal.pcbi.1003285).
* Peng R.D. (2011): [**Reproducible research in computational science**](http://www.sciencemag.org/content/334/6060/1226.full.pdf), _Science_, 6060(334):1226-1227, doi:[10.1126/science.1213847](https://dx.doi.org/10.1126/science.1213847).
* Ince D.C., Hatton L., and Graham-Cumming J. (2011): [**The case for open computer programs**](http://www.nature.com/nature/journal/v482/n7386/pdf/nature10836.pdf), _Nature_, 482:485-488, doi:[10.1038/nature10836](https://dx.doi.org/10.1038/nature10836).
* Barnes N. (2010): [**Publish your computer code: it is good enough**](http://www.nature.com/news/2010/101013/pdf/467753a.pdf), _Nature_, 467:753, doi:[10.1038/467753a](https://dx.doi.org/10.1038/467753a). 
* Wikipedia [comparison of document markup languages](https://en.wikipedia.org/wiki/Comparison_of_document_markup_languages).
* Wikipedia [comparison of documentation generators](https://en.wikipedia.org/wiki/Comparison_of_documentation_generators).
* A [beginner's guide](http://www.writethedocs.org/guide/writing/beginners-guide-to-docs/) to writing documentation.
* [Mastering cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) and _markdown_ 
[quick reference](https://en.support.wordpress.com/markdown-quick-reference/).
