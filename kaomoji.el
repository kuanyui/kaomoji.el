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

(setq kaomoji-candidates-limit nil)
(setq kaomoji-buffer-name "*Kaomoji*")
(setq emoji-talbe-prompt "Search Emoji")

(helm :source (helm-build-sync-source "Please input pattern to search Emoji: "
                :candidates (lambda () (kaomoji-get-candidates helm-pattern))
                :volatile t
                :fuzzy-match nil
                :candidate-number-limit kaomoji-candidates-limit
                :action #'kaomoji-insert-this
                :requires-pattern nil
                )
      :buffer kaomoji-buffer-name
      :prompt kaomoji-prompt)


(defun kaomoji-get-candidates (pattern)
  ""
  )

(provide 'kaomoji)
;;; kaomoji.el ends here
