
(cl:in-package :asdf)

(defsystem "robotiq_s_model_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SModel_robot_input" :depends-on ("_package_SModel_robot_input"))
    (:file "_package_SModel_robot_input" :depends-on ("_package"))
    (:file "SModel_robot_output" :depends-on ("_package_SModel_robot_output"))
    (:file "_package_SModel_robot_output" :depends-on ("_package"))
  ))