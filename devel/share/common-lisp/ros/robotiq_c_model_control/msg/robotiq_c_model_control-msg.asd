
(cl:in-package :asdf)

(defsystem "robotiq_c_model_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CModel_robot_input" :depends-on ("_package_CModel_robot_input"))
    (:file "_package_CModel_robot_input" :depends-on ("_package"))
    (:file "CModel_robot_output" :depends-on ("_package_CModel_robot_output"))
    (:file "_package_CModel_robot_output" :depends-on ("_package"))
  ))