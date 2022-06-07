; Auto-generated. Do not edit!


(cl:in-package interaction-msg)


;//! \htmlinclude information_msg.msg.html

(cl:defclass <information_msg> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (age
    :reader age
    :initarg :age
    :type cl:integer
    :initform 0)
   (languages
    :reader languages
    :initarg :languages
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass information_msg (<information_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <information_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'information_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaction-msg:<information_msg> is deprecated: use interaction-msg:information_msg instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <information_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-msg:name-val is deprecated.  Use interaction-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'age-val :lambda-list '(m))
(cl:defmethod age-val ((m <information_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-msg:age-val is deprecated.  Use interaction-msg:age instead.")
  (age m))

(cl:ensure-generic-function 'languages-val :lambda-list '(m))
(cl:defmethod languages-val ((m <information_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaction-msg:languages-val is deprecated.  Use interaction-msg:languages instead.")
  (languages m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <information_msg>) ostream)
  "Serializes a message object of type '<information_msg>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'age)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'age)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'languages))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'languages))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <information_msg>) istream)
  "Deserializes a message object of type '<information_msg>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'age)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'age)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'languages) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'languages)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<information_msg>)))
  "Returns string type for a message object of type '<information_msg>"
  "interaction/information_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'information_msg)))
  "Returns string type for a message object of type 'information_msg"
  "interaction/information_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<information_msg>)))
  "Returns md5sum for a message object of type '<information_msg>"
  "e60c7dfb26c5bf1eb0d8cbb8e4791239")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'information_msg)))
  "Returns md5sum for a message object of type 'information_msg"
  "e60c7dfb26c5bf1eb0d8cbb8e4791239")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<information_msg>)))
  "Returns full string definition for message of type '<information_msg>"
  (cl:format cl:nil "string name~%uint32 age~%string[] languages~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'information_msg)))
  "Returns full string definition for message of type 'information_msg"
  (cl:format cl:nil "string name~%uint32 age~%string[] languages~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <information_msg>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'languages) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <information_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'information_msg
    (cl:cons ':name (name msg))
    (cl:cons ':age (age msg))
    (cl:cons ':languages (languages msg))
))
