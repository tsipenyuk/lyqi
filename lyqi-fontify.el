;;; Part of lyqi, a major emacs mode derived from LilyPond-Mode,
;;; for quick note insertion while editing GNU LilyPond music scores.
;;; 
;;; (c) copyright 2009 Nicolas Sceaux <nicolas.sceaux@free.fr>
;;; See http://nicolas.sceaux.free.fr/lilypond/

(eval-when-compile (require 'cl))
(require 'eieio)
(require 'lp-base)
(require 'lyqi-syntax)

;;;
;;; Fontification
;;;

(defgroup lyqi-faces nil
  "Faces for LilyPond buffers."
  :prefix "lyqi:"
  :group 'lyqi)

;; TODO: these are debug faces, define real ones.
(defface lyqi:note-face
  '((((class color) (background dark)) :foreground "blue")
    (((class color) (background light)) :foreground "blue"))
  "Face for notes."
  :group 'lyqi-faces)

(defface lyqi:rest-face
  '((((class color) (background dark)) :foreground "green")
    (((class color) (background light)) :foreground "green"))
  "Face for rests and skips."
  :group 'lyqi-faces)

(defface lyqi:duration-face
  '((((class color) (background dark)) :foreground "red")
    (((class color) (background light)) :foreground "red"))
  "Face for rests and skips."
  :group 'lyqi-faces)

(defface lyqi:verbatim-face
  '((((class color) (background dark)) :background "yellow")
    (((class color) (background light)) :background "yellow"))
  "Face for rests and skips."
  :group 'lyqi-faces)

(defface lyqi:scheme-face
  '((((class color) (background dark)) :background "violet")
    (((class color) (background light)) :background "violet"))
  "Face for scheme forms."
  :group 'lyqi-faces)

(defface lyqi:delimiter-face
  '((((class color) (background dark)) :foreground "grey")
    (((class color) (background light)) :foreground "grey"))
  "Face for delimiters."
  :group 'lyqi-faces)

(defmethod lp:fontify ((this lyqi:verbatim-form))
  (let* ((start (marker-position (lp:marker this)))
         (end (+ start (lp:size this))))
    (set-text-properties start end '(face lyqi:verbatim-face))))

(defmethod lp:face ((this lyqi:note-lexeme))
  '(face lyqi:note-face))

(defmethod lp:face ((this lyqi:rest-skip-etc-lexeme))
  '(face lyqi:rest-face))

(defmethod lp:face ((this lyqi:duration-lexeme))
  '(face lyqi:duration-face))

(defmethod lp:face ((this lyqi:scheme-lexeme))
  '(face lyqi:scheme-face))

(defmethod lp:face ((this lp:delimiter-lexeme))
  '(face lyqi:delimiter-face))

(provide 'lyqi-fontify)
