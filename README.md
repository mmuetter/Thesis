# TexThesisTemplate

A .tex template for your thesis.

Simply fill in the content, submit, pay 1200.- CHF to the ETH, do some other stuff (defence, etc.) and you'll get your PhD!


## Structure

- _main.tex_ assembles all the content.
- _preamble.tex_ handles the import statements, custom definitions, etc.
- In the _chapters_ folder is all the actual content.
- The _bib_ folder holds your bibliography (there is an example \*.bib in there as well) and styling.


### chapters folder

You can either add chapters directly, like the [example_content.tex](https://gitlab.ethz.ch/tb/ttt/blob/master/chapters/example_content.tex), or include your chapters as submodules.
In the latter case make sure that the file from the submodule you include in _main.tex_ defines `\chapter[...](...)`, a `\label`, and so on - basically, it should contain most of the first [20 lines of example_content.tex](https://gitlab.ethz.ch/tb/ttt/blob/master/chapters/example_content.tex#L20).

If you have a chapter that is not jet published it might make sense to have this chapter as a separate repository and include it as a submodule in your thesis, so to avoid having a chapter and a paper version that are out of sync.
