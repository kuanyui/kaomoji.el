;;; kaomoji.el --- Input kaomoji superb easily      -*- lexical-binding: t; -*-

;; Author: Ono Hiroko <azazabc123@gmail.com>
;; Keywords: tools, fun
;; Package-Requires: ((emacs "24.3") (helm-core "1.9.1"))
;; X-URL: https://github.com/kuanyui/kaomoji.el
;; Version: {{VERSION}}

;; Ono Hiroko (kuanyui) (ɔ) Copyleft 2016
;;
;; This program is free software. It comes without any warranty, to
;; the extent permitted by applicable law. You can redistribute it
;; and/or modify it under the terms of the Do What The Fuck You Want
;; To Public License, Version 2, as published by Sam Hocevar. See
;; http://www.wtfpl.net/ for more details.

;;; Commentary:
;;
;; Visit https://github.com/kuanyui/kaomoji.el
;; to see screenshot & usage guide.

;; ======= Usage =======
;; (require 'kaomoji), then M-x `kaomoji'
;;
;; === Customization ===
;; Variables:

;; `kaomoji-table' : The main table contains '(((ALIAS ...) . KAOMOJI) ...)
;; You can customize like this to append new items to this talbe:
;;
;; (setq kaomoji-table
;;       (append '((("angry" "furious") . "(／‵Д′)／~ ╧╧ ")
;;                 (("angry" "punch") . "#ﾟÅﾟ）⊂彡☆))ﾟДﾟ)･∵"))
;;               kaomoji-table))

;; `kaomoji-patterns-inserted-along-with' : When your input (from Helm
;; minibuffer) contains any of the patterns, insert the input along
;; with the kaomoji.
;;
;; (setq kaomoji-patterns-inserted-along-with nil) to disable this
;; function.

;; `kaomoji-insert-user-input-at' : 'left-side or 'right-side

;;; Code:

(require 'cl-lib)
(require 'helm)
(require 'kaomoji-data)

(defvar kaomoji-candidates-limit 9999)
(defvar kaomoji-buffer-name "*Kaomoji*")
(defvar kaomoji-prompt "Search Kaomoji: ")
(defvar kaomoji-patterns-inserted-along-with
  '("fuck" "shit"
    "バカ" "くそう"
    "幹" "靠")
  "When your input matched any pattern in this list, the input
  will be concatenate with kaomoji before being inserted.")

(defvar kaomoji-insert-user-input-at 'right-side
  "Which side to concatenate your input with kaomoji. The value
  can be `left-side' or `right-side'.  This variable is working with
  variable `kaomoji-patterns-inserted-along-with'")

;;;###autoload
(defun kaomoji ()
  (interactive)
  (helm :sources (helm-build-sync-source "Please input pattern to search Kaomoji: "
                   :candidates (lambda () (kaomoji-get-candidates helm-pattern))
                   :volatile t
                   :action (lambda (str) (insert (kaomoji-process-the-string-to-insert helm-pattern str)))
                   :candidate-number-limit kaomoji-candidates-limit)
        :buffer kaomoji-buffer-name
        :prompt kaomoji-prompt))

(defun kaomoji-get-candidates (pattern)
  "Get candidates list from `kaomoji-internal-get-candidates',
align & format the them as ((DISPLAY . REAL-KAOMOJI) ...)"
  (let* ((candidates-list (kaomoji-internal-get-candidates pattern))
         (max-length (kaomoji-max (kaomoji-collect-lengths-of-matched-string candidates-list))))
    (mapcar (lambda (x)
              (cons (concat (propertize (car x) 'face 'font-lock-keyword)
                            (make-string (- max-length (string-width (car x))) 32) ;`32' is space
                            " => "
                            (propertize (cdr x) 'face 'bold)) ;DISPLAY
                    (cdr x)))     ;REAL
            candidates-list)))

(defun kaomoji-internal-get-candidates (pattern)
  "Return ((MATCHED-STRING . KAOMOJI) ...)"
  (cl-remove-if
   #'null
   (mapcar (lambda (row)
             (let ((matched (cl-member pattern (car row)
                                       :test (lambda (pat str) (string-match pat str)))))
               (if matched
                   (cons (car matched) (cdr row)) ;Return this
                 nil)))          ; this will be removed
           kaomoji-table
           )))

(defun kaomoji-collect-lengths-of-matched-string (list)
  (mapcar (lambda (x) (string-width (car x)))
          list))

(defun kaomoji-max (list)
  (if (and (listp list) list)
      (apply #'max list)))

(defun kaomoji-matched-pattern? (user-input)
  "See variable `kaomoji-patterns-inserted-along-with'"
  (cl-some (lambda (pattern)
             (string-match pattern user-input))
           kaomoji-patterns-inserted-along-with))

(defun kaomoji-process-the-string-to-insert (user-input kaomoji-string)
  "Check if should concatenate USER-INPUT to KAOMOJI, then return
the string for `insert'"
  (if (not (kaomoji-matched-pattern? user-input))
      kaomoji-string
    (if (eq 'left-side kaomoji-insert-user-input-at)
        (concat user-input " " kaomoji-string)
      (concat kaomoji-string " " user-input))))

(provide 'kaomoji)
;;; kaomoji.el ends here
