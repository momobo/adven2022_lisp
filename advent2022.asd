(asdf:defsystem #:advent2022
  :description "Describe advent2022 here"
  :author "max"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:alexandria #:cl-ppcre #:split-sequence)
  :components ((:file "package")
               (:file "day1"))
  
  :in-order-to ((test-op (test-op #:advent2022/test))))

;; (asdf:defsystem #:advent2022/test
;;   :depends-on (#:advent2022
;;                #:parachute)
;;   :components ((:module "tests"
;;  ;               :components ((:file "package")
;;  ;                            (:file "main"))
;; 		))
;;   :perform (test-op (op _) (symbol-call :parachute :test :advent2022/test)))
