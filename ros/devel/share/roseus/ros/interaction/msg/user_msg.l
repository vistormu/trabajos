;; Auto-generated. Do not edit!


(when (boundp 'interaction::user_msg)
  (if (not (find-package "INTERACTION"))
    (make-package "INTERACTION"))
  (shadow 'user_msg (find-package "INTERACTION")))
(unless (find-package "INTERACTION::USER_MSG")
  (make-package "INTERACTION::USER_MSG"))

(in-package "ROS")
;;//! \htmlinclude user_msg.msg.html


(defclass interaction::user_msg
  :super ros::object
  :slots (_information _position _emotion ))

(defmethod interaction::user_msg
  (:init
   (&key
    ((:information __information) (instance interaction::information_msg :init))
    ((:position __position) (instance interaction::position_msg :init))
    ((:emotion __emotion) "")
    )
   (send-super :init)
   (setq _information __information)
   (setq _position __position)
   (setq _emotion (string __emotion))
   self)
  (:information
   (&rest __information)
   (if (keywordp (car __information))
       (send* _information __information)
     (progn
       (if __information (setq _information (car __information)))
       _information)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:emotion
   (&optional __emotion)
   (if __emotion (setq _emotion __emotion)) _emotion)
  (:serialization-length
   ()
   (+
    ;; interaction/information_msg _information
    (send _information :serialization-length)
    ;; interaction/position_msg _position
    (send _position :serialization-length)
    ;; string _emotion
    4 (length _emotion)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; interaction/information_msg _information
       (send _information :serialize s)
     ;; interaction/position_msg _position
       (send _position :serialize s)
     ;; string _emotion
       (write-long (length _emotion) s) (princ _emotion s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; interaction/information_msg _information
     (send _information :deserialize buf ptr-) (incf ptr- (send _information :serialization-length))
   ;; interaction/position_msg _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; string _emotion
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _emotion (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get interaction::user_msg :md5sum-) "df5514cbf35b34e84b550eb6858f003d")
(setf (get interaction::user_msg :datatype-) "interaction/user_msg")
(setf (get interaction::user_msg :definition-)
      "information_msg information
position_msg position
string emotion
================================================================================
MSG: interaction/information_msg
string name
uint32 age
string[] languages
================================================================================
MSG: interaction/position_msg
uint32 x
uint32 y
uint32 z
")



(provide :interaction/user_msg "df5514cbf35b34e84b550eb6858f003d")


