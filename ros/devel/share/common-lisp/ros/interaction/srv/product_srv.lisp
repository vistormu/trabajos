; Auto-generated. Do not edit!


(cl:in-package interaction-srv)


;//! \htmlinclude product_srv-request.msg.html

(cl:defclass <product_srv-request> (roslisp-msg-protocol:ros-message)
  ((age
    :reader age
    :initarg :age
    :type cl:integer
    :initform 0))
)

(cl:defclass product_srv-request (<product_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <product_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'product_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaction-srv:<product_srv-request> is deprecated: use interaction-srv:product_srv-request instead.")))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <product_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-srv:age-val is deprecated.  Use interaction-srv:age instead.")
  (age m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <product_srv-request>) ostream)
  "Serializes a message object of type '<product_srv-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'age)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <product_srv-request>) istream)
  "Deserializes a message object of type '<product_srv-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'age)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<product_srv-request>)))
  "Returns string type for a service object of type '<product_srv-request>"
  "interaction/product_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'product_srv-request)))
  "Returns string type for a service object of type 'product_srv-request"
  "interaction/product_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<product_srv-request>)))
  "Returns md5sum for a message object of type '<product_srv-request>"
  "9b383809021b2be879ecb6c4bb797d14")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'product_srv-request)))
  "Returns md5sum for a message object of type 'product_srv-request"
  "9b383809021b2be879ecb6c4bb797d14")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<product_srv-request>)))
  "Returns full string definition for message of type '<product_srv-request>"
  (cl:format cl:nil "uint32 age~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'product_srv-request)))
  "Returns full string definition for message of type 'product_srv-request"
  (cl:format cl:nil "uint32 age~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <product_srv-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <product_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'product_srv-request
    (cl:cons ':age (age msg))
))
;//! \htmlinclude product_srv-response.msg.html

(cl:defclass <product_srv-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass product_srv-response (<product_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <product_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'product_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaction-srv:<product_srv-response> is deprecated: use interaction-srv:product_srv-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <product_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-srv:result-val is deprecated.  Use interaction-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <product_srv-response>) ostream)
  "Serializes a message object of type '<product_srv-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'result)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'result)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'result)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <product_srv-response>) istream)
  "Deserializes a message object of type '<product_srv-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'result)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'result)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'result)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'result)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<product_srv-response>)))
  "Returns string type for a service object of type '<product_srv-response>"
  "interaction/product_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'product_srv-response)))
  "Returns string type for a service object of type 'product_srv-response"
  "interaction/product_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<product_srv-response>)))
  "Returns md5sum for a message object of type '<product_srv-response>"
  "9b383809021b2be879ecb6c4bb797d14")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'product_srv-response)))
  "Returns md5sum for a message object of type 'product_srv-response"
  "9b383809021b2be879ecb6c4bb797d14")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<product_srv-response>)))
  "Returns full string definition for message of type '<product_srv-response>"
  (cl:format cl:nil "uint32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'product_srv-response)))
  "Returns full string definition for message of type 'product_srv-response"
  (cl:format cl:nil "uint32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <product_srv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <product_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'product_srv-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'product_srv)))
  'product_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'product_srv)))
  'product_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'product_srv)))
  "Returns string type for a service object of type '<product_srv>"
  "interaction/product_srv")