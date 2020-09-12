;;; insert-date.el --- Insert dates in various formats  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Jamie Beardslee

;; Author: Jamie Beardslee <jdb@jamzattack.xyz>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(defun insert-date (format-string)
  "Insert FORMAT-STRING, as parsed by `format-time-string'."
  (insert (format-time-string format-string)))

(defun insert-date-version ()
  "Insert the date for use as a version.
1970.01.30"
  (interactive)
  (insert-date "%Y.%m.%d"))

(defun insert-date-only-date ()
  "Insert the date, separated by hyphens.
1970-01-30"
  (interactive)
  (insert-date "%Y-%m-%d"))

(defun insert-date-only-time (&optional 12-hour)
  "Insert the current time.
With prefix arg, insert 12-HOUR format with AM/PM.
23:11    (24 hour)
11:11 PM (12 hour)"
  (interactive "P")
  (insert-date (if 12-hour
		   "%I:%M %p"
		 "%H:%M")))

(defun insert-date-locale ()
  "Insert the current date and time according to locale."
  (interactive)
  (insert-date "%c %Z"))

(defun insert-date-iso8601 ()
  "Insert the current date and time in full ISO 8601 format."
  (interactive)
  (insert-date "%FT%T%z"))

(provide 'insert-date)
;;; insert-date.el ends here
