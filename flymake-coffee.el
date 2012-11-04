;;; flymake-coffee.el --- A flymake handler for coffee script
;;
;;; Author: Steve Purcell <steve@sanityinc.com>
;;; Homepage: https://github.com/purcell/flymake-coffee
;;; Version: DEV
;;; Package-Requires: ((flymake-easy "0.1"))
;;
;;; Commentary:
;;
;; Based in part on http://d.hatena.ne.jp/antipop/20110508/1304838383
;;
;; Usage:
;;   (require 'flymake-coffee)
;;   (add-hook 'coffee-mode-hook 'flymake-coffee-load)
;;
;; Uses flymake-easy, from https://github.com/purcell/flymake-easy

;;; Code:

(require 'flymake-easy)
;; Doesn't strictly require coffee-mode, but will use 'coffee-command if set

(defconst flymake-coffee-err-line-patterns
  '(("^SyntaxError: In \\([^,]+\\), \\(.+\\) on line \\([0-9]+\\)" 1 3 nil 2)))

(defun flymake-coffee-command (filename)
  "Construct a command that flymake can use to check coffeescript source."
  (list (if (boundp 'coffee-command) coffee-command "coffee")
        filename))

;;;###autoload
(defun flymake-coffee-load ()
  "Configure flymake mode to check the current buffer's coffeescript syntax."
  (interactive)
  (flymake-easy-load 'flymake-coffee-command
                     flymake-coffee-err-line-patterns
                     'tempdir
                     "coffee"))


(provide 'flymake-coffee)
;;; flymake-coffee.el ends here
