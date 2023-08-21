
(cl:in-package :asdf)

(defsystem "robotiq_force_torque_sensor-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "sensor_accessor" :depends-on ("_package_sensor_accessor"))
    (:file "_package_sensor_accessor" :depends-on ("_package"))
  ))