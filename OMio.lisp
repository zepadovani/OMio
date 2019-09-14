;; OMio - 0.1 - OM input/output: designed to make easier to import/export data
;; 14/sept/2019


(defvar omio)

(defpackage omio)

(in-package :omio)

(mapc 'om::compile&load (list
                         (make-pathname  :directory (append (pathname-directory *load-pathname*) (list "sources")) :name "omiocsv" :type "lisp")
                         ))

;; menu/sub-menu structure
;("sub-pack-name" subpacke-lists class-list function-list class-alias-list)


(defvar *subpackages-omio-var* nil)
(setf *subpackages-omio-var*
         '(("csv" nil nil (

                           csv-floats-in


                                     ) nil)))

   ;--------------------------------------------------
   ;filling packages
   ;--------------------------------------------------
(om::fill-library *subpackages-omio-var*)


(om::set-lib-release 0.1)

(om::fill-library
 '(("csv" nil nil
    (om::csv-floats-in) nil)
   ))
