; Warning: First, seting the package where the functions will be defined
(in-package :om)

; Functions definition

; (om::defmethod! csv-floats-in ((filename pathname) &key (defaultformat 'long-float))
; :initvals '(nil long-float)
; :indoc '("<n>")
; :icon 128
; :doc
; "reads csv file at \"filename\" and returns a list of lists of floats (that corresponds to therows of the csv file)\n\nKeyword :defaultformat can be either long-float/double-float (default) or float/short-float/single-float."
; (with-open-file (stream filename)
; (loop for line = (read-line stream nil)
; for linecount from 0
; while line
; collect (loop for start = 0 then (1+ finish)
; for finish = (position #\, line :start start)
; for columncount from 0
; collecting (parse-float (string-trim " " (subseq line start finish)) :default-format defaultformat)
; until (null finish)))))


(om::defmethod! csv-floats-in ((filename pathname) &optional (rowsasstrings nil) (colsasstrings nil) (defaultformat 'long-float))
:initvals '(nil nil nil long-float)
:indoc '("<n>")
:icon '128
:doc
"reads csv file at \"filename\" and returns a list of lists of floats (that corresponds to therows of the csv file)\n\n
Optional parameters rowsasstrings and colsasstrings can be nil or lists: they can be used to specify rows or columns of the original csv file that should not be read as float numbers.\n\n
Keyword :defaultformat can be either long-float/double-float (default) or float/short-float/single-float."

(with-open-file (stream filename)
               (loop for line = (read-line stream nil)
                 while line
                 for linecount from 0
                 collect
                 (loop for start = 0 then (1+ finish)
                       for columnnumber from 0
                       for finish = (position #\, line :start start)
                       collect
                       (cond
                        (colsasstrings ;;se colunas forem especificadas
                         (if rowsasstrings  ;; primeiro ve se é para printar toda a linha como string
                           (if (position linecount rowsasstrings)(string-trim " " (subseq line start finish)) ;;linha como string
                             (if (position columnnumber colsasstrings)(string-trim " " (subseq line start finish))(parse-float (string-trim " " (subseq line start finish)) :default-format defaultformat));; senão, ve se a coluna atual deve ser lida como string ou como numero
                           )
(if (position columnnumber colsasstrings)(string-trim " " (subseq line start finish))(parse-float (string-trim " " (subseq line start finish)) :default-format defaultformat))
)
                         )
                        (rowsasstrings (if (position linecount rowsasstrings)(string-trim " " (subseq line start finish))(parse-float (string-trim " " (subseq line start finish)) :default-format defaultformat)))
                        (t (parse-float (string-trim " " (subseq line start finish)) :default-format defaultformat)))
                       until (null finish)))))
