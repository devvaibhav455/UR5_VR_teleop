
(cl:in-package :asdf)

(defsystem "ur5_teleop_vive-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "xyzrpy" :depends-on ("_package_xyzrpy"))
    (:file "_package_xyzrpy" :depends-on ("_package"))
  ))