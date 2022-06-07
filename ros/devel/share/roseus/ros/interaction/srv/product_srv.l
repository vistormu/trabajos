;; Auto-generated. Do not edit!


(when (boundp 'interaction::product_srv)
  (if (not (find-package "INTERACTION"))
    (make-package "INTERACTION"))
  (shadow 'product_srv (find-package "INTERACTION")))
(unless (find-package "INTERACTION::PRODUCT_SRV")
  (make-package "INTERACTION::PRODUCT_SRV"))
(unless (find-package "INTERACTION::PRODUCT_SRVREQUEST")
  (make-package "INTERACTION::PRODUCT_SRVREQUEST"))
(unless (find-package "INTERACTION::PRODUCT_SRVRESPONSE")
  (make-package "INTERACTION::PRODUCT_SRVRESPONSE"))

(in-package "ROS")





(defclass interaction::product_srvRequest
  :super ros::object
  :slots (_age ))

(defmethod interaction::product_srvRequest
  (:init
   (&key
    ((:age __age) 0)
    )
   (send-super :init)
   (setq _age (round __age))
   self)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:serialization-length
   ()
   (+
    ;; uint32 _age
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _age
       (write-long _age s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _age
     (setq _age (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass interaction::product_srvResponse
  :super ros::object
  :slots (_result ))

(defmethod interaction::product_srvResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; uint32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass interaction::product_srv
  :super ros::object
  :slots ())

(setf (get interaction::product_srv :md5sum-) "9b383809021b2be879ecb6c4bb797d14")
(setf (get interaction::product_srv :datatype-) "interaction/product_srv")
(setf (get interaction::product_srv :request) interaction::product_srvRequest)
(setf (get interaction::product_srv :response) interaction::product_srvResponse)

(defmethod interaction::product_srvRequest
  (:response () (instance interaction::product_srvResponse :init)))

(setf (get interaction::product_srvRequest :md5sum-) "9b383809021b2be879ecb6c4bb797d14")
(setf (get interaction::product_srvRequest :datatype-) "interaction/product_srvRequest")
(setf (get interaction::product_srvRequest :definition-)
      "uint32 age
---
uint32 result
")

(setf (get interaction::product_srvResponse :md5sum-) "9b383809021b2be879ecb6c4bb797d14")
(setf (get interaction::product_srvResponse :datatype-) "interaction/product_srvResponse")
(setf (get interaction::product_srvResponse :definition-)
      "uint32 age
---
uint32 result
")



(provide :interaction/product_srv "9b383809021b2be879ecb6c4bb797d14")


