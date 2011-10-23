;;; flymake-coffee.el --- Flymake support for coffee script
;;
;;; Author: Steve Purcell <steve@sanityinc.com>
;;; Homepage: https://github.com/purcell/flymake-coffee
;;; Version: DEV
;;
;;; Commentary:
;;
;; Based in part on http://d.hatena.ne.jp/antipop/20110508/1304838383
;;
;; Usage: (add-hook 'coffee-mode-hook 'flymake-coffee-load)
(require 'flymake)

;;; Code:

;; Doesn't strictly require coffee-mode, but will use 'coffee-command if set

(defconst flymake-coffee-err-line-patterns
  '(("\\(Error: In \\([^,]+\\), .+ on line \\([0-9]+\\).*\\)" 2 3 nil 1)))

(defun flymake-coffee-init ()
  "Construct a command that flymake can use to check coffeescript source."
  (list (if (boundp 'coffee-command)
            coffee-command
          "coffee")
        (list (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))))

;;;###autoload
(defun flymake-coffee-load ()
  "Configure flymake mode to check the current buffer's coffeescript syntax.

This function is designed to be called in `coffee-mode-hook'; it
does not alter flymake's global configuration, so function
`flymake-mode' alone will not suffice."
  (interactive)
  (set (make-local-variable 'flymake-allowed-file-name-masks) '(("." flymake-coffee-init)))
  (set (make-local-variable 'flymake-err-line-patterns) flymake-coffee-err-line-patterns)
  (if (executable-find "coffee")
      (flymake-mode t)
    (message "Not enabling flymake: coffee command not found")))


(provide 'flymake-coffee)
;;; flymake-coffee.el ends here
