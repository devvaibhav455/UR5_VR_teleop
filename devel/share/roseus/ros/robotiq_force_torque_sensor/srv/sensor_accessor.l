;; Auto-generated. Do not edit!


(when (boundp 'robotiq_force_torque_sensor::sensor_accessor)
  (if (not (find-package "ROBOTIQ_FORCE_TORQUE_SENSOR"))
    (make-package "ROBOTIQ_FORCE_TORQUE_SENSOR"))
  (shadow 'sensor_accessor (find-package "ROBOTIQ_FORCE_TORQUE_SENSOR")))
(unless (find-package "ROBOTIQ_FORCE_TORQUE_SENSOR::SENSOR_ACCESSOR")
  (make-package "ROBOTIQ_FORCE_TORQUE_SENSOR::SENSOR_ACCESSOR"))
(unless (find-package "ROBOTIQ_FORCE_TORQUE_SENSOR::SENSOR_ACCESSORREQUEST")
  (make-package "ROBOTIQ_FORCE_TORQUE_SENSOR::SENSOR_ACCESSORREQUEST"))
(unless (find-package "ROBOTIQ_FORCE_TORQUE_SENSOR::SENSOR_ACCESSORRESPONSE")
  (make-package "ROBOTIQ_FORCE_TORQUE_SENSOR::SENSOR_ACCESSORRESPONSE"))

(in-package "ROS")





(defclass robotiq_force_torque_sensor::sensor_accessorRequest
  :super ros::object
  :slots (_command ))

(defmethod robotiq_force_torque_sensor::sensor_accessorRequest
  (:init
   (&key
    ((:command __command) "")
    )
   (send-super :init)
   (setq _command (string __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robotiq_force_torque_sensor::sensor_accessorResponse
  :super ros::object
  :slots (_res ))

(defmethod robotiq_force_torque_sensor::sensor_accessorResponse
  (:init
   (&key
    ((:res __res) "")
    )
   (send-super :init)
   (setq _res (string __res))
   self)
  (:res
   (&optional __res)
   (if __res (setq _res __res)) _res)
  (:serialization-length
   ()
   (+
    ;; string _res
    4 (length _res)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _res
       (write-long (length _res) s) (princ _res s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _res
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _res (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robotiq_force_torque_sensor::sensor_accessor
  :super ros::object
  :slots ())

(setf (get robotiq_force_torque_sensor::sensor_accessor :md5sum-) "3432968d93676935641d2adbeeedf719")
(setf (get robotiq_force_torque_sensor::sensor_accessor :datatype-) "robotiq_force_torque_sensor/sensor_accessor")
(setf (get robotiq_force_torque_sensor::sensor_accessor :request) robotiq_force_torque_sensor::sensor_accessorRequest)
(setf (get robotiq_force_torque_sensor::sensor_accessor :response) robotiq_force_torque_sensor::sensor_accessorResponse)

(defmethod robotiq_force_torque_sensor::sensor_accessorRequest
  (:response () (instance robotiq_force_torque_sensor::sensor_accessorResponse :init)))

(setf (get robotiq_force_torque_sensor::sensor_accessorRequest :md5sum-) "3432968d93676935641d2adbeeedf719")
(setf (get robotiq_force_torque_sensor::sensor_accessorRequest :datatype-) "robotiq_force_torque_sensor/sensor_accessorRequest")
(setf (get robotiq_force_torque_sensor::sensor_accessorRequest :definition-)
      "string command
---
string res

")

(setf (get robotiq_force_torque_sensor::sensor_accessorResponse :md5sum-) "3432968d93676935641d2adbeeedf719")
(setf (get robotiq_force_torque_sensor::sensor_accessorResponse :datatype-) "robotiq_force_torque_sensor/sensor_accessorResponse")
(setf (get robotiq_force_torque_sensor::sensor_accessorResponse :definition-)
      "string command
---
string res

")



(provide :robotiq_force_torque_sensor/sensor_accessor "3432968d93676935641d2adbeeedf719")


