; Auto-generated. Do not edit!


(cl:in-package interaction-msg)


;//! \htmlinclude user_msg.msg.html

(cl:defclass <user_msg> (roslisp-msg-protocol:ros-message)
  ((information
    :reader information
    :initarg :information
    :type interaction-msg:information_msg
    :initform (cl:make-instance 'interaction-msg:information_msg))
   (position
    :reader position
    :initarg :position
    :type interaction-msg:position_msg
    :initform (cl:make-instance 'interaction-msg:position_msg))
   (emotion
    :reader emotion
    :initarg :emotion
    :type cl:string
    :initform ""))
)

(cl:defclass user_msg (<user_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <user_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'user_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaction-msg:<user_msg> is deprecated: use interaction-msg:user_msg instead.")))

(cl:ensure-generic-function 'information-val :lambda-list '(m))
(cl:defmethod information-val ((m <user_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-msg:information-val is deprecated.  Use interaction-msg:information instead.")
  (information m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <user_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-msg:position-val is deprecated.  Use interaction-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'emotion-val :lambda-list '(m))
(cl:defmethod emotion-val ((m <user_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-msg:emotion-val is deprecated.  Use interaction-msg:emotion instead.")
  (emotion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <user_msg>) ostream)
  "Serializes a message object of type '<user_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'information) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'emotion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'emotion))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <user_msg>) istream)
  "Deserializes a message object of type '<user_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'information) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'emotion) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'emotion) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<user_msg>)))
  "Returns string type for a message object of type '<user_msg>"
  "interaction/user_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'user_msg)))
  "Returns string type for a message object of type 'user_msg"
  "interaction/user_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<user_msg>)))
  "Returns md5sum for a message object of type '<user_msg>"
  "df5514cbf35b34e84b550eb6858f003d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'user_msg)))
  "Returns md5sum for a message object of type 'user_msg"
  "df5514cbf35b34e84b550eb6858f003d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<user_msg>)))
  "Returns full string definition for message of type '<user_msg>"
  (cl:format cl:nil "information_msg information~%position_msg position~%string emotion~%================================================================================~%MSG: interaction/information_msg~%string name~%uint32 age~%string[] languages~%================================================================================~%MSG: interaction/position_msg~%uint32 x~%uint32 y~%uint32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'user_msg)))
  "Returns full string definition for message of type 'user_msg"
  (cl:format cl:nil "information_msg information~%position_msg position~%string emotion~%================================================================================~%MSG: interaction/information_msg~%string name~%uint32 age~%string[] languages~%================================================================================~%MSG: interaction/position_msg~%uint32 x~%uint32 y~%uint32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <user_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'information))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     4 (cl:length (cl:slot-value msg 'emotion))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <user_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'user_msg
    (cl:cons ':information (information msg))
    (cl:cons ':position (position msg))
    (cl:cons ':emotion (emotion msg))
))
