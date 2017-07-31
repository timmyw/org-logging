;;; ol-utils.el --- utils required by org-logging

;; Copyright (c) 2017 Tim Whelan <tim@zipt.co>

;;; Commentary:

;;; Code:

(defvar ol-modified-property-name "MODIFIED"
  "The name of the property to use.")

(defvar current-date-time-format "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `insert-current-date-time' func.
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun ol-add-datetime (date)
  "Insert the supplied DATE into the properties drawer."
  (save-excursion
    (org-entry-put (point-marker) ol-modified-property-name date)
    ))

(defun ol-insert-datetime ()
  "Insert the current date at point and update the MODIFIED property."
  (interactive)
  (let ((date "2017-04-03"))
    (ol-add-datetime date)
    (insert (format-time-string "*%Y/%m/%d* " (current-time)))
    (indent-for-tab-command)))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c d") 'ol-insert-datetime)))

(provide  'ol-utils)

;;; ol-utils.el ends here
