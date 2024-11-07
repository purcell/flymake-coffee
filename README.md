flymake-coffee.el
==========================

An Emacs flymake handler for syntax-checking Coffeescript source code
using `coffeelint` or `coffee`.

Installation
=============

If you choose not to use one of the convenient packages in
[Melpa][melpa] and [Marmalade][marmalade], you'll need to add the
directory containing `flymake-coffee.el` to your `load-path`, and then
`(require 'flymake-coffee)`. You'll also need to install
[flymake-easy](https://github.com/purcell/flymake-easy).

Usage
=====

Add the following to your emacs init file:

    (require 'flymake-coffee)
    (add-hook 'coffee-mode-hook 'flymake-coffee-load)

Uses `coffeelint` if available, otherwises `coffee`.

[marmalade]: http://marmalade-repo.org
[melpa]: http://melpa.org

<hr>

[💝 Support this project and my other Open Source work](https://www.patreon.com/sanityinc)

[💼 LinkedIn profile](https://uk.linkedin.com/in/stevepurcell)

[✍ sanityinc.com](http://www.sanityinc.com/)
