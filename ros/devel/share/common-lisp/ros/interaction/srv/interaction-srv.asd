
(cl:in-package :asdf)

(defsystem "interaction-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "product_srv" :depends-on ("_package_product_srv"))
    (:file "_package_product_srv" :depends-on ("_package"))
  ))