;; Auto-generated. Do not edit!


(when (boundp 'interaction::position_msg)
  (if (not (find-package "INTERACTION"))
    (make-package "INTERACTION"))
  (shadow 'position_msg (find-package "INTERACTION")))
(unless (find-package "INTERACTION::POSITION_MSG")
  (make-package "INTERACTION::POSITION_MSG"))

(in-package "ROS")
;;//! \htmlinclude position_msg.msg.html


(defclass interaction::position_msg
  :super ros::object
  :slots (_x _y _z ))

(defmethod interaction::position_msg
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    ((:z __z) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _z (round __z))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; uint32 _x
    4
    ;; uint32 _y
    4
    ;; uint32 _z
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _x
       (write-long _x s)
     ;; uint32 _y
       (write-long _y s)
     ;; uint32 _z
       (write-long _z s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _y
     (setq _y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _z
     (setq _z (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get interaction::position_msg :md5sum-) "bfde2953ee46d97d36a711ef3cbc85f4")
(setf (get interaction::position_msg :datatype-) "interaction/position_msg")
(setf (get interaction::position_msg :definition-)
      "uint32 x
uint32 y
uint32 z
")



(provide :interaction/position_msg "bfde2953ee46d97d36a711ef3cbc85f4")


