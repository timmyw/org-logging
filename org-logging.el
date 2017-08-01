;;; org-logging.el --- util functions for logging datestamps

;; Copyright (c) 2017 Tim Whelan <tim@zipt.co>

;;; Commentary:

;;; Code:

(defvar ol-modified-property-name "MODIFIED"
  "The name of the property to use.")

(defun ol-add-datetime (date)
  "Insert the supplied DATE into the properties drawer."
  (save-excursion
    (org-entry-put (point-marker) ol-modified-property-name date)
    ))

(defun ol-insert-datetime ()
  "Insert the current date at point and update the MODIFIED property."
  (interactive)
  (let ((ds (current-time)))
    (ol-add-datetime (format-time-string "<%Y-%m-%d %H:%M>" ds))
    (insert (format-time-string "*%Y/%m/%d* " ds))
    (indent-for-tab-command)))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c d") 'ol-insert-datetime)))

(provide  'org-logging)

;;; org-logging.el ends here
