
(cl:in-package :asdf)

(defsystem "interaction-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "information_msg" :depends-on ("_package_information_msg"))
    (:file "_package_information_msg" :depends-on ("_package"))
    (:file "position_msg" :depends-on ("_package_position_msg"))
    (:file "_package_position_msg" :depends-on ("_package"))
    (:file "user_msg" :depends-on ("_package_user_msg"))
    (:file "_package_user_msg" :depends-on ("_package"))
  ))