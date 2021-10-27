# Overview

dcover is a very shameless copycat of golang's `cover` tool.

Given a directory of D coverage files (.lst), this tool will create a HTML file that visually shows which lines have been covered, and which have not.

# Usage

```d
dub test -b unittest-cov; dub run dcover .
```

This *should* generate an `index.html` file, which is very similar to the output of golang's `cover` tool.
