; Auto-generated. Do not edit!


(cl:in-package interaction-msg)


;//! \htmlinclude position_msg.msg.html

(cl:defclass <position_msg> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (z
    :reader z
    :initarg :z
    :type cl:integer
    :initform 0))
)

(cl:defclass position_msg (<position_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <position_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'position_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaction-msg:<position_msg> is deprecated: use interaction-msg:position_msg instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <position_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-msg:x-val is deprecated.  Use interaction-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <position_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-msg:y-val is deprecated.  Use interaction-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <position_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-msg:z-val is deprecated.  Use interaction-msg:z instead.")
  (z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <position_msg>) ostream)
  "Serializes a message object of type '<position_msg>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'y)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'y)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'z)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'z)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'z)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'z)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <position_msg>) istream)
  "Deserializes a message object of type '<position_msg>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'y)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'y)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'y)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'z)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'z)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'z)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'z)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<position_msg>)))
  "Returns string type for a message object of type '<position_msg>"
  "interaction/position_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'position_msg)))
  "Returns string type for a message object of type 'position_msg"
  "interaction/position_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<position_msg>)))
  "Returns md5sum for a message object of type '<position_msg>"
  "bfde2953ee46d97d36a711ef3cbc85f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'position_msg)))
  "Returns md5sum for a message object of type 'position_msg"
  "bfde2953ee46d97d36a711ef3cbc85f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<position_msg>)))
  "Returns full string definition for message of type '<position_msg>"
  (cl:format cl:nil "uint32 x~%uint32 y~%uint32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'position_msg)))
  "Returns full string definition for message of type 'position_msg"
  (cl:format cl:nil "uint32 x~%uint32 y~%uint32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <position_msg>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <position_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'position_msg
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
))
