; Warning: First, seting the package where the functions will be defined
(in-package :om)

; Functions definition

(om::defmethod! csv-floats-in ((filename pathname))
  :initvals '( 5)
  :indoc '("<n>")
  :icon 128
  :doc "reads csv file at \"filename\" and returns a list of lists of floats (that corresponds to the rows of the csv file)"
  (with-open-file (stream filename)
                  (loop for line = (read-line stream nil)
                       while line
                       collect (loop for start = 0 then (1+ finish)
                                 for finish = (position #\, line :start start)
                                 collecting (parse-float (string-trim " " (subseq line start finish)))
                                 until (null finish)))))
