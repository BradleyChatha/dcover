# Overview

dcover is a very shameless copycat of golang's `cover` tool (in terms of its HTML output option).

Given a directory of D coverage files (.lst), this tool will create a HTML file that visually shows which lines have been covered, and which have not.

An example can be found [here](https://bradleychatha.github.io/dcover/)

# Usage

```d
dub test -b unittest-cov; dub run dcover -- .
```

This *should* generate an `index.html` file, which is very similar to the output of golang's `cover` tool.
