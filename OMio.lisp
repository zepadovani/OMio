;; OMio - 0.2 - OM input/output: designed to make easier to import/export data
;; 24/oct/2022

(defvar omio)
(defpackage :omio)

(in-package :omio)


(mapc 'om::compile&load (list
                         ;(make-pathname  :directory (append (pathname-directory *load-pathname*) (list "sources")) :name "xmls" :type "lisp")
                         (make-pathname  :directory (append (pathname-directory *load-pathname*) (list "sources")) :name "omiocsv" :type "lisp")
                         ))



;; menu/sub-menu structure
;("sub-pack-name" subpacke-lists class-list function-list class-alias-list)

; (defvar omio)
;
; (defpackage omio)

(defvar *subpackages-list* nil)
(setf *subpackages-list*
      '( ("csv" nil nil (csv-floats-in) nil)
      ;("csv" nil nil (csv-floats-in csv-floats-in2) nil)
         ))






   ;--------------------------------------------------
   ;filling packages
   ;--------------------------------------------------

(om::fill-library *subpackages-list*)


(om::set-lib-release 0.2)

   (print "
   ;;;-----------------
   ;;; OMio 0.2 - in/out functions for OpenMusic
   ;;;
   ;;; Jose Henrique Padovani (2022)
   ;;;===========================================================================
   ")
