;; Auto-generated. Do not edit!


(when (boundp 'robotiq_s_model_control::SModel_robot_input)
  (if (not (find-package "ROBOTIQ_S_MODEL_CONTROL"))
    (make-package "ROBOTIQ_S_MODEL_CONTROL"))
  (shadow 'SModel_robot_input (find-package "ROBOTIQ_S_MODEL_CONTROL")))
(unless (find-package "ROBOTIQ_S_MODEL_CONTROL::SMODEL_ROBOT_INPUT")
  (make-package "ROBOTIQ_S_MODEL_CONTROL::SMODEL_ROBOT_INPUT"))

(in-package "ROS")
;;//! \htmlinclude SModel_robot_input.msg.html


(defclass robotiq_s_model_control::SModel_robot_input
  :super ros::object
  :slots (_gACT _gMOD _gGTO _gIMC _gSTA _gDTA _gDTB _gDTC _gDTS _gFLT _gPRA _gPOA _gCUA _gPRB _gPOB _gCUB _gPRC _gPOC _gCUC _gPRS _gPOS _gCUS ))

(defmethod robotiq_s_model_control::SModel_robot_input
  (:init
   (&key
    ((:gACT __gACT) 0)
    ((:gMOD __gMOD) 0)
    ((:gGTO __gGTO) 0)
    ((:gIMC __gIMC) 0)
    ((:gSTA __gSTA) 0)
    ((:gDTA __gDTA) 0)
    ((:gDTB __gDTB) 0)
    ((:gDTC __gDTC) 0)
    ((:gDTS __gDTS) 0)
    ((:gFLT __gFLT) 0)
    ((:gPRA __gPRA) 0)
    ((:gPOA __gPOA) 0)
    ((:gCUA __gCUA) 0)
    ((:gPRB __gPRB) 0)
    ((:gPOB __gPOB) 0)
    ((:gCUB __gCUB) 0)
    ((:gPRC __gPRC) 0)
    ((:gPOC __gPOC) 0)
    ((:gCUC __gCUC) 0)
    ((:gPRS __gPRS) 0)
    ((:gPOS __gPOS) 0)
    ((:gCUS __gCUS) 0)
    )
   (send-super :init)
   (setq _gACT (round __gACT))
   (setq _gMOD (round __gMOD))
   (setq _gGTO (round __gGTO))
   (setq _gIMC (round __gIMC))
   (setq _gSTA (round __gSTA))
   (setq _gDTA (round __gDTA))
   (setq _gDTB (round __gDTB))
   (setq _gDTC (round __gDTC))
   (setq _gDTS (round __gDTS))
   (setq _gFLT (round __gFLT))
   (setq _gPRA (round __gPRA))
   (setq _gPOA (round __gPOA))
   (setq _gCUA (round __gCUA))
   (setq _gPRB (round __gPRB))
   (setq _gPOB (round __gPOB))
   (setq _gCUB (round __gCUB))
   (setq _gPRC (round __gPRC))
   (setq _gPOC (round __gPOC))
   (setq _gCUC (round __gCUC))
   (setq _gPRS (round __gPRS))
   (setq _gPOS (round __gPOS))
   (setq _gCUS (round __gCUS))
   self)
  (:gACT
   (&optional __gACT)
   (if __gACT (setq _gACT __gACT)) _gACT)
  (:gMOD
   (&optional __gMOD)
   (if __gMOD (setq _gMOD __gMOD)) _gMOD)
  (:gGTO
   (&optional __gGTO)
   (if __gGTO (setq _gGTO __gGTO)) _gGTO)
  (:gIMC
   (&optional __gIMC)
   (if __gIMC (setq _gIMC __gIMC)) _gIMC)
  (:gSTA
   (&optional __gSTA)
   (if __gSTA (setq _gSTA __gSTA)) _gSTA)
  (:gDTA
   (&optional __gDTA)
   (if __gDTA (setq _gDTA __gDTA)) _gDTA)
  (:gDTB
   (&optional __gDTB)
   (if __gDTB (setq _gDTB __gDTB)) _gDTB)
  (:gDTC
   (&optional __gDTC)
   (if __gDTC (setq _gDTC __gDTC)) _gDTC)
  (:gDTS
   (&optional __gDTS)
   (if __gDTS (setq _gDTS __gDTS)) _gDTS)
  (:gFLT
   (&optional __gFLT)
   (if __gFLT (setq _gFLT __gFLT)) _gFLT)
  (:gPRA
   (&optional __gPRA)
   (if __gPRA (setq _gPRA __gPRA)) _gPRA)
  (:gPOA
   (&optional __gPOA)
   (if __gPOA (setq _gPOA __gPOA)) _gPOA)
  (:gCUA
   (&optional __gCUA)
   (if __gCUA (setq _gCUA __gCUA)) _gCUA)
  (:gPRB
   (&optional __gPRB)
   (if __gPRB (setq _gPRB __gPRB)) _gPRB)
  (:gPOB
   (&optional __gPOB)
   (if __gPOB (setq _gPOB __gPOB)) _gPOB)
  (:gCUB
   (&optional __gCUB)
   (if __gCUB (setq _gCUB __gCUB)) _gCUB)
  (:gPRC
   (&optional __gPRC)
   (if __gPRC (setq _gPRC __gPRC)) _gPRC)
  (:gPOC
   (&optional __gPOC)
   (if __gPOC (setq _gPOC __gPOC)) _gPOC)
  (:gCUC
   (&optional __gCUC)
   (if __gCUC (setq _gCUC __gCUC)) _gCUC)
  (:gPRS
   (&optional __gPRS)
   (if __gPRS (setq _gPRS __gPRS)) _gPRS)
  (:gPOS
   (&optional __gPOS)
   (if __gPOS (setq _gPOS __gPOS)) _gPOS)
  (:gCUS
   (&optional __gCUS)
   (if __gCUS (setq _gCUS __gCUS)) _gCUS)
  (:serialization-length
   ()
   (+
    ;; uint8 _gACT
    1
    ;; uint8 _gMOD
    1
    ;; uint8 _gGTO
    1
    ;; uint8 _gIMC
    1
    ;; uint8 _gSTA
    1
    ;; uint8 _gDTA
    1
    ;; uint8 _gDTB
    1
    ;; uint8 _gDTC
    1
    ;; uint8 _gDTS
    1
    ;; uint8 _gFLT
    1
    ;; uint8 _gPRA
    1
    ;; uint8 _gPOA
    1
    ;; uint8 _gCUA
    1
    ;; uint8 _gPRB
    1
    ;; uint8 _gPOB
    1
    ;; uint8 _gCUB
    1
    ;; uint8 _gPRC
    1
    ;; uint8 _gPOC
    1
    ;; uint8 _gCUC
    1
    ;; uint8 _gPRS
    1
    ;; uint8 _gPOS
    1
    ;; uint8 _gCUS
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _gACT
       (write-byte _gACT s)
     ;; uint8 _gMOD
       (write-byte _gMOD s)
     ;; uint8 _gGTO
       (write-byte _gGTO s)
     ;; uint8 _gIMC
       (write-byte _gIMC s)
     ;; uint8 _gSTA
       (write-byte _gSTA s)
     ;; uint8 _gDTA
       (write-byte _gDTA s)
     ;; uint8 _gDTB
       (write-byte _gDTB s)
     ;; uint8 _gDTC
       (write-byte _gDTC s)
     ;; uint8 _gDTS
       (write-byte _gDTS s)
     ;; uint8 _gFLT
       (write-byte _gFLT s)
     ;; uint8 _gPRA
       (write-byte _gPRA s)
     ;; uint8 _gPOA
       (write-byte _gPOA s)
     ;; uint8 _gCUA
       (write-byte _gCUA s)
     ;; uint8 _gPRB
       (write-byte _gPRB s)
     ;; uint8 _gPOB
       (write-byte _gPOB s)
     ;; uint8 _gCUB
       (write-byte _gCUB s)
     ;; uint8 _gPRC
       (write-byte _gPRC s)
     ;; uint8 _gPOC
       (write-byte _gPOC s)
     ;; uint8 _gCUC
       (write-byte _gCUC s)
     ;; uint8 _gPRS
       (write-byte _gPRS s)
     ;; uint8 _gPOS
       (write-byte _gPOS s)
     ;; uint8 _gCUS
       (write-byte _gCUS s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _gACT
     (setq _gACT (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gMOD
     (setq _gMOD (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gGTO
     (setq _gGTO (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gIMC
     (setq _gIMC (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gSTA
     (setq _gSTA (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gDTA
     (setq _gDTA (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gDTB
     (setq _gDTB (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gDTC
     (setq _gDTC (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gDTS
     (setq _gDTS (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gFLT
     (setq _gFLT (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gPRA
     (setq _gPRA (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gPOA
     (setq _gPOA (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gCUA
     (setq _gCUA (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gPRB
     (setq _gPRB (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gPOB
     (setq _gPOB (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gCUB
     (setq _gCUB (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gPRC
     (setq _gPRC (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gPOC
     (setq _gPOC (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gCUC
     (setq _gCUC (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gPRS
     (setq _gPRS (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gPOS
     (setq _gPOS (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gCUS
     (setq _gCUS (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robotiq_s_model_control::SModel_robot_input :md5sum-) "4d0701156e580a420c48833f57bc83f3")
(setf (get robotiq_s_model_control::SModel_robot_input :datatype-) "robotiq_s_model_control/SModel_robot_input")
(setf (get robotiq_s_model_control::SModel_robot_input :definition-)
      "uint8 gACT 
uint8 gMOD 
uint8 gGTO 
uint8 gIMC 
uint8 gSTA 
uint8 gDTA 
uint8 gDTB 
uint8 gDTC 
uint8 gDTS 
uint8 gFLT 
uint8 gPRA 
uint8 gPOA 
uint8 gCUA 
uint8 gPRB 
uint8 gPOB 
uint8 gCUB 
uint8 gPRC 
uint8 gPOC 
uint8 gCUC 
uint8 gPRS 
uint8 gPOS 
uint8 gCUS

")



(provide :robotiq_s_model_control/SModel_robot_input "4d0701156e580a420c48833f57bc83f3")


