; Auto-generated. Do not edit!


(cl:in-package robotiq_s_model_control-msg)


;//! \htmlinclude SModel_robot_output.msg.html

(cl:defclass <SModel_robot_output> (roslisp-msg-protocol:ros-message)
  ((rACT
    :reader rACT
    :initarg :rACT
    :type cl:fixnum
    :initform 0)
   (rMOD
    :reader rMOD
    :initarg :rMOD
    :type cl:fixnum
    :initform 0)
   (rGTO
    :reader rGTO
    :initarg :rGTO
    :type cl:fixnum
    :initform 0)
   (rATR
    :reader rATR
    :initarg :rATR
    :type cl:fixnum
    :initform 0)
   (rGLV
    :reader rGLV
    :initarg :rGLV
    :type cl:fixnum
    :initform 0)
   (rICF
    :reader rICF
    :initarg :rICF
    :type cl:fixnum
    :initform 0)
   (rICS
    :reader rICS
    :initarg :rICS
    :type cl:fixnum
    :initform 0)
   (rPRA
    :reader rPRA
    :initarg :rPRA
    :type cl:fixnum
    :initform 0)
   (rSPA
    :reader rSPA
    :initarg :rSPA
    :type cl:fixnum
    :initform 0)
   (rFRA
    :reader rFRA
    :initarg :rFRA
    :type cl:fixnum
    :initform 0)
   (rPRB
    :reader rPRB
    :initarg :rPRB
    :type cl:fixnum
    :initform 0)
   (rSPB
    :reader rSPB
    :initarg :rSPB
    :type cl:fixnum
    :initform 0)
   (rFRB
    :reader rFRB
    :initarg :rFRB
    :type cl:fixnum
    :initform 0)
   (rPRC
    :reader rPRC
    :initarg :rPRC
    :type cl:fixnum
    :initform 0)
   (rSPC
    :reader rSPC
    :initarg :rSPC
    :type cl:fixnum
    :initform 0)
   (rFRC
    :reader rFRC
    :initarg :rFRC
    :type cl:fixnum
    :initform 0)
   (rPRS
    :reader rPRS
    :initarg :rPRS
    :type cl:fixnum
    :initform 0)
   (rSPS
    :reader rSPS
    :initarg :rSPS
    :type cl:fixnum
    :initform 0)
   (rFRS
    :reader rFRS
    :initarg :rFRS
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SModel_robot_output (<SModel_robot_output>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SModel_robot_output>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SModel_robot_output)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotiq_s_model_control-msg:<SModel_robot_output> is deprecated: use robotiq_s_model_control-msg:SModel_robot_output instead.")))

(cl:ensure-generic-function 'rACT-val :lambda-list '(m))
(cl:defmethod rACT-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rACT-val is deprecated.  Use robotiq_s_model_control-msg:rACT instead.")
  (rACT m))

(cl:ensure-generic-function 'rMOD-val :lambda-list '(m))
(cl:defmethod rMOD-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rMOD-val is deprecated.  Use robotiq_s_model_control-msg:rMOD instead.")
  (rMOD m))

(cl:ensure-generic-function 'rGTO-val :lambda-list '(m))
(cl:defmethod rGTO-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rGTO-val is deprecated.  Use robotiq_s_model_control-msg:rGTO instead.")
  (rGTO m))

(cl:ensure-generic-function 'rATR-val :lambda-list '(m))
(cl:defmethod rATR-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rATR-val is deprecated.  Use robotiq_s_model_control-msg:rATR instead.")
  (rATR m))

(cl:ensure-generic-function 'rGLV-val :lambda-list '(m))
(cl:defmethod rGLV-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rGLV-val is deprecated.  Use robotiq_s_model_control-msg:rGLV instead.")
  (rGLV m))

(cl:ensure-generic-function 'rICF-val :lambda-list '(m))
(cl:defmethod rICF-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rICF-val is deprecated.  Use robotiq_s_model_control-msg:rICF instead.")
  (rICF m))

(cl:ensure-generic-function 'rICS-val :lambda-list '(m))
(cl:defmethod rICS-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rICS-val is deprecated.  Use robotiq_s_model_control-msg:rICS instead.")
  (rICS m))

(cl:ensure-generic-function 'rPRA-val :lambda-list '(m))
(cl:defmethod rPRA-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rPRA-val is deprecated.  Use robotiq_s_model_control-msg:rPRA instead.")
  (rPRA m))

(cl:ensure-generic-function 'rSPA-val :lambda-list '(m))
(cl:defmethod rSPA-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rSPA-val is deprecated.  Use robotiq_s_model_control-msg:rSPA instead.")
  (rSPA m))

(cl:ensure-generic-function 'rFRA-val :lambda-list '(m))
(cl:defmethod rFRA-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rFRA-val is deprecated.  Use robotiq_s_model_control-msg:rFRA instead.")
  (rFRA m))

(cl:ensure-generic-function 'rPRB-val :lambda-list '(m))
(cl:defmethod rPRB-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rPRB-val is deprecated.  Use robotiq_s_model_control-msg:rPRB instead.")
  (rPRB m))

(cl:ensure-generic-function 'rSPB-val :lambda-list '(m))
(cl:defmethod rSPB-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rSPB-val is deprecated.  Use robotiq_s_model_control-msg:rSPB instead.")
  (rSPB m))

(cl:ensure-generic-function 'rFRB-val :lambda-list '(m))
(cl:defmethod rFRB-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rFRB-val is deprecated.  Use robotiq_s_model_control-msg:rFRB instead.")
  (rFRB m))

(cl:ensure-generic-function 'rPRC-val :lambda-list '(m))
(cl:defmethod rPRC-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rPRC-val is deprecated.  Use robotiq_s_model_control-msg:rPRC instead.")
  (rPRC m))

(cl:ensure-generic-function 'rSPC-val :lambda-list '(m))
(cl:defmethod rSPC-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rSPC-val is deprecated.  Use robotiq_s_model_control-msg:rSPC instead.")
  (rSPC m))

(cl:ensure-generic-function 'rFRC-val :lambda-list '(m))
(cl:defmethod rFRC-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rFRC-val is deprecated.  Use robotiq_s_model_control-msg:rFRC instead.")
  (rFRC m))

(cl:ensure-generic-function 'rPRS-val :lambda-list '(m))
(cl:defmethod rPRS-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rPRS-val is deprecated.  Use robotiq_s_model_control-msg:rPRS instead.")
  (rPRS m))

(cl:ensure-generic-function 'rSPS-val :lambda-list '(m))
(cl:defmethod rSPS-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rSPS-val is deprecated.  Use robotiq_s_model_control-msg:rSPS instead.")
  (rSPS m))

(cl:ensure-generic-function 'rFRS-val :lambda-list '(m))
(cl:defmethod rFRS-val ((m <SModel_robot_output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotiq_s_model_control-msg:rFRS-val is deprecated.  Use robotiq_s_model_control-msg:rFRS instead.")
  (rFRS m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SModel_robot_output>) ostream)
  "Serializes a message object of type '<SModel_robot_output>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rACT)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rMOD)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rGTO)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rATR)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rGLV)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rICF)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rICS)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rPRA)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rSPA)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rFRA)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rPRB)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rSPB)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rFRB)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rPRC)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rSPC)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rFRC)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rPRS)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rSPS)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rFRS)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SModel_robot_output>) istream)
  "Deserializes a message object of type '<SModel_robot_output>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rACT)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rMOD)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rGTO)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rATR)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rGLV)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rICF)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rICS)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rPRA)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rSPA)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rFRA)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rPRB)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rSPB)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rFRB)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rPRC)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rSPC)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rFRC)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rPRS)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rSPS)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rFRS)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SModel_robot_output>)))
  "Returns string type for a message object of type '<SModel_robot_output>"
  "robotiq_s_model_control/SModel_robot_output")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SModel_robot_output)))
  "Returns string type for a message object of type 'SModel_robot_output"
  "robotiq_s_model_control/SModel_robot_output")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SModel_robot_output>)))
  "Returns md5sum for a message object of type '<SModel_robot_output>"
  "31ba91390a569c669af204c3d006a806")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SModel_robot_output)))
  "Returns md5sum for a message object of type 'SModel_robot_output"
  "31ba91390a569c669af204c3d006a806")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SModel_robot_output>)))
  "Returns full string definition for message of type '<SModel_robot_output>"
  (cl:format cl:nil "uint8 rACT ~%uint8 rMOD ~%uint8 rGTO ~%uint8 rATR ~%uint8 rGLV ~%uint8 rICF ~%uint8 rICS ~%uint8 rPRA ~%uint8 rSPA ~%uint8 rFRA ~%uint8 rPRB ~%uint8 rSPB ~%uint8 rFRB ~%uint8 rPRC ~%uint8 rSPC ~%uint8 rFRC ~%uint8 rPRS ~%uint8 rSPS ~%uint8 rFRS~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SModel_robot_output)))
  "Returns full string definition for message of type 'SModel_robot_output"
  (cl:format cl:nil "uint8 rACT ~%uint8 rMOD ~%uint8 rGTO ~%uint8 rATR ~%uint8 rGLV ~%uint8 rICF ~%uint8 rICS ~%uint8 rPRA ~%uint8 rSPA ~%uint8 rFRA ~%uint8 rPRB ~%uint8 rSPB ~%uint8 rFRB ~%uint8 rPRC ~%uint8 rSPC ~%uint8 rFRC ~%uint8 rPRS ~%uint8 rSPS ~%uint8 rFRS~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SModel_robot_output>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SModel_robot_output>))
  "Converts a ROS message object to a list"
  (cl:list 'SModel_robot_output
    (cl:cons ':rACT (rACT msg))
    (cl:cons ':rMOD (rMOD msg))
    (cl:cons ':rGTO (rGTO msg))
    (cl:cons ':rATR (rATR msg))
    (cl:cons ':rGLV (rGLV msg))
    (cl:cons ':rICF (rICF msg))
    (cl:cons ':rICS (rICS msg))
    (cl:cons ':rPRA (rPRA msg))
    (cl:cons ':rSPA (rSPA msg))
    (cl:cons ':rFRA (rFRA msg))
    (cl:cons ':rPRB (rPRB msg))
    (cl:cons ':rSPB (rSPB msg))
    (cl:cons ':rFRB (rFRB msg))
    (cl:cons ':rPRC (rPRC msg))
    (cl:cons ':rSPC (rSPC msg))
    (cl:cons ':rFRC (rFRC msg))
    (cl:cons ':rPRS (rPRS msg))
    (cl:cons ':rSPS (rSPS msg))
    (cl:cons ':rFRS (rFRS msg))
))
