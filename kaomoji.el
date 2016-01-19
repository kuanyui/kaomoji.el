;;; kaomoji.el --- Input emoji superb easily      -*- lexical-binding: t; -*-

;; Copyright (C) 2016  kuanyui

;; Author: kuanyui <azazabc123@gmail.com>
;; Keywords: tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(require 'cl)
(require 'helm)
(require 'kaomoji-data)

(setq kaomoji-candidates-limit 9999)
(setq kaomoji-buffer-name "*Kaomoji*")
(setq kaomoji-prompt "Search Kaomoji: ")

(defun kaomoji ()
  (interactive)
  (helm :sources (helm-build-sync-source "Please input pattern to search Kaomoji: "
                   :candidates (lambda () (kaomoji-get-candidates helm-pattern))
                   :volatile t
                   ;; :nohighlight t
                   :action #'insert
                   :candidate-number-limit kaomoji-candidates-limit
                   )
        :buffer kaomoji-buffer-name
        :prompt kaomoji-prompt))

(defun kaomoji-get-candidates (pattern)
  "Get candidates list from `kaomoji-internal-get-candidates',
align & format the them as ((DISPLAY . REAL-KAOMOJI) ...)"
  (let* ((candidates-list (kaomoji-internal-get-candidates pattern))
         (max-length (kaomoji-max (kaomoji-collect-lengths-of-matched-string candidates-list))))
    (mapcar (lambda (x)
              (cons (concat (propertize (car x) 'face 'font-lock-keyword)
                            (make-string (- max-length (length (car x))) 32) ;`32' is space
                            " => "
                            (propertize (cdr x) 'face 'bold)) ;DISPLAY
                    (cdr x)))     ;REAL
            candidates-list)))

(defun kaomoji-internal-get-candidates (pattern)
  "Return ((MATCHED-STRING . KAOMOJI) ...)"
  (remove-if
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
  (mapcar (lambda (x) (length (car x))) list))

(defun kaomoji-max (list)
  (apply #'max list))



(kaomoji-get-candidates "u")

(provide 'kaomoji)
;;; kaomoji.el ends here
