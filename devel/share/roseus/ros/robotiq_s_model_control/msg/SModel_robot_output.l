;; Auto-generated. Do not edit!


(when (boundp 'robotiq_s_model_control::SModel_robot_output)
  (if (not (find-package "ROBOTIQ_S_MODEL_CONTROL"))
    (make-package "ROBOTIQ_S_MODEL_CONTROL"))
  (shadow 'SModel_robot_output (find-package "ROBOTIQ_S_MODEL_CONTROL")))
(unless (find-package "ROBOTIQ_S_MODEL_CONTROL::SMODEL_ROBOT_OUTPUT")
  (make-package "ROBOTIQ_S_MODEL_CONTROL::SMODEL_ROBOT_OUTPUT"))

(in-package "ROS")
;;//! \htmlinclude SModel_robot_output.msg.html


(defclass robotiq_s_model_control::SModel_robot_output
  :super ros::object
  :slots (_rACT _rMOD _rGTO _rATR _rGLV _rICF _rICS _rPRA _rSPA _rFRA _rPRB _rSPB _rFRB _rPRC _rSPC _rFRC _rPRS _rSPS _rFRS ))

(defmethod robotiq_s_model_control::SModel_robot_output
  (:init
   (&key
    ((:rACT __rACT) 0)
    ((:rMOD __rMOD) 0)
    ((:rGTO __rGTO) 0)
    ((:rATR __rATR) 0)
    ((:rGLV __rGLV) 0)
    ((:rICF __rICF) 0)
    ((:rICS __rICS) 0)
    ((:rPRA __rPRA) 0)
    ((:rSPA __rSPA) 0)
    ((:rFRA __rFRA) 0)
    ((:rPRB __rPRB) 0)
    ((:rSPB __rSPB) 0)
    ((:rFRB __rFRB) 0)
    ((:rPRC __rPRC) 0)
    ((:rSPC __rSPC) 0)
    ((:rFRC __rFRC) 0)
    ((:rPRS __rPRS) 0)
    ((:rSPS __rSPS) 0)
    ((:rFRS __rFRS) 0)
    )
   (send-super :init)
   (setq _rACT (round __rACT))
   (setq _rMOD (round __rMOD))
   (setq _rGTO (round __rGTO))
   (setq _rATR (round __rATR))
   (setq _rGLV (round __rGLV))
   (setq _rICF (round __rICF))
   (setq _rICS (round __rICS))
   (setq _rPRA (round __rPRA))
   (setq _rSPA (round __rSPA))
   (setq _rFRA (round __rFRA))
   (setq _rPRB (round __rPRB))
   (setq _rSPB (round __rSPB))
   (setq _rFRB (round __rFRB))
   (setq _rPRC (round __rPRC))
   (setq _rSPC (round __rSPC))
   (setq _rFRC (round __rFRC))
   (setq _rPRS (round __rPRS))
   (setq _rSPS (round __rSPS))
   (setq _rFRS (round __rFRS))
   self)
  (:rACT
   (&optional __rACT)
   (if __rACT (setq _rACT __rACT)) _rACT)
  (:rMOD
   (&optional __rMOD)
   (if __rMOD (setq _rMOD __rMOD)) _rMOD)
  (:rGTO
   (&optional __rGTO)
   (if __rGTO (setq _rGTO __rGTO)) _rGTO)
  (:rATR
   (&optional __rATR)
   (if __rATR (setq _rATR __rATR)) _rATR)
  (:rGLV
   (&optional __rGLV)
   (if __rGLV (setq _rGLV __rGLV)) _rGLV)
  (:rICF
   (&optional __rICF)
   (if __rICF (setq _rICF __rICF)) _rICF)
  (:rICS
   (&optional __rICS)
   (if __rICS (setq _rICS __rICS)) _rICS)
  (:rPRA
   (&optional __rPRA)
   (if __rPRA (setq _rPRA __rPRA)) _rPRA)
  (:rSPA
   (&optional __rSPA)
   (if __rSPA (setq _rSPA __rSPA)) _rSPA)
  (:rFRA
   (&optional __rFRA)
   (if __rFRA (setq _rFRA __rFRA)) _rFRA)
  (:rPRB
   (&optional __rPRB)
   (if __rPRB (setq _rPRB __rPRB)) _rPRB)
  (:rSPB
   (&optional __rSPB)
   (if __rSPB (setq _rSPB __rSPB)) _rSPB)
  (:rFRB
   (&optional __rFRB)
   (if __rFRB (setq _rFRB __rFRB)) _rFRB)
  (:rPRC
   (&optional __rPRC)
   (if __rPRC (setq _rPRC __rPRC)) _rPRC)
  (:rSPC
   (&optional __rSPC)
   (if __rSPC (setq _rSPC __rSPC)) _rSPC)
  (:rFRC
   (&optional __rFRC)
   (if __rFRC (setq _rFRC __rFRC)) _rFRC)
  (:rPRS
   (&optional __rPRS)
   (if __rPRS (setq _rPRS __rPRS)) _rPRS)
  (:rSPS
   (&optional __rSPS)
   (if __rSPS (setq _rSPS __rSPS)) _rSPS)
  (:rFRS
   (&optional __rFRS)
   (if __rFRS (setq _rFRS __rFRS)) _rFRS)
  (:serialization-length
   ()
   (+
    ;; uint8 _rACT
    1
    ;; uint8 _rMOD
    1
    ;; uint8 _rGTO
    1
    ;; uint8 _rATR
    1
    ;; uint8 _rGLV
    1
    ;; uint8 _rICF
    1
    ;; uint8 _rICS
    1
    ;; uint8 _rPRA
    1
    ;; uint8 _rSPA
    1
    ;; uint8 _rFRA
    1
    ;; uint8 _rPRB
    1
    ;; uint8 _rSPB
    1
    ;; uint8 _rFRB
    1
    ;; uint8 _rPRC
    1
    ;; uint8 _rSPC
    1
    ;; uint8 _rFRC
    1
    ;; uint8 _rPRS
    1
    ;; uint8 _rSPS
    1
    ;; uint8 _rFRS
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _rACT
       (write-byte _rACT s)
     ;; uint8 _rMOD
       (write-byte _rMOD s)
     ;; uint8 _rGTO
       (write-byte _rGTO s)
     ;; uint8 _rATR
       (write-byte _rATR s)
     ;; uint8 _rGLV
       (write-byte _rGLV s)
     ;; uint8 _rICF
       (write-byte _rICF s)
     ;; uint8 _rICS
       (write-byte _rICS s)
     ;; uint8 _rPRA
       (write-byte _rPRA s)
     ;; uint8 _rSPA
       (write-byte _rSPA s)
     ;; uint8 _rFRA
       (write-byte _rFRA s)
     ;; uint8 _rPRB
       (write-byte _rPRB s)
     ;; uint8 _rSPB
       (write-byte _rSPB s)
     ;; uint8 _rFRB
       (write-byte _rFRB s)
     ;; uint8 _rPRC
       (write-byte _rPRC s)
     ;; uint8 _rSPC
       (write-byte _rSPC s)
     ;; uint8 _rFRC
       (write-byte _rFRC s)
     ;; uint8 _rPRS
       (write-byte _rPRS s)
     ;; uint8 _rSPS
       (write-byte _rSPS s)
     ;; uint8 _rFRS
       (write-byte _rFRS s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _rACT
     (setq _rACT (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rMOD
     (setq _rMOD (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rGTO
     (setq _rGTO (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rATR
     (setq _rATR (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rGLV
     (setq _rGLV (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rICF
     (setq _rICF (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rICS
     (setq _rICS (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rPRA
     (setq _rPRA (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rSPA
     (setq _rSPA (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rFRA
     (setq _rFRA (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rPRB
     (setq _rPRB (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rSPB
     (setq _rSPB (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rFRB
     (setq _rFRB (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rPRC
     (setq _rPRC (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rSPC
     (setq _rSPC (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rFRC
     (setq _rFRC (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rPRS
     (setq _rPRS (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rSPS
     (setq _rSPS (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _rFRS
     (setq _rFRS (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robotiq_s_model_control::SModel_robot_output :md5sum-) "31ba91390a569c669af204c3d006a806")
(setf (get robotiq_s_model_control::SModel_robot_output :datatype-) "robotiq_s_model_control/SModel_robot_output")
(setf (get robotiq_s_model_control::SModel_robot_output :definition-)
      "uint8 rACT 
uint8 rMOD 
uint8 rGTO 
uint8 rATR 
uint8 rGLV 
uint8 rICF 
uint8 rICS 
uint8 rPRA 
uint8 rSPA 
uint8 rFRA 
uint8 rPRB 
uint8 rSPB 
uint8 rFRB 
uint8 rPRC 
uint8 rSPC 
uint8 rFRC 
uint8 rPRS 
uint8 rSPS 
uint8 rFRS

")



(provide :robotiq_s_model_control/SModel_robot_output "31ba91390a569c669af204c3d006a806")


