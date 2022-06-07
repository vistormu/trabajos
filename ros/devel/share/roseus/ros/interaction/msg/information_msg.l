;; Auto-generated. Do not edit!


(when (boundp 'interaction::information_msg)
  (if (not (find-package "INTERACTION"))
    (make-package "INTERACTION"))
  (shadow 'information_msg (find-package "INTERACTION")))
(unless (find-package "INTERACTION::INFORMATION_MSG")
  (make-package "INTERACTION::INFORMATION_MSG"))

(in-package "ROS")
;;//! \htmlinclude information_msg.msg.html


(defclass interaction::information_msg
  :super ros::object
  :slots (_name _age _languages ))

(defmethod interaction::information_msg
  (:init
   (&key
    ((:name __name) "")
    ((:age __age) 0)
    ((:languages __languages) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _age (round __age))
   (setq _languages __languages)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:age
   (&optional __age)
   (if __age (setq _age __age)) _age)
  (:languages
   (&optional __languages)
   (if __languages (setq _languages __languages)) _languages)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; uint32 _age
    4
    ;; string[] _languages
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _languages)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint32 _age
       (write-long _age s)
     ;; string[] _languages
     (write-long (length _languages) s)
     (dolist (elem _languages)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _age
     (setq _age (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string[] _languages
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _languages (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _languages i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get interaction::information_msg :md5sum-) "e60c7dfb26c5bf1eb0d8cbb8e4791239")
(setf (get interaction::information_msg :datatype-) "interaction/information_msg")
(setf (get interaction::information_msg :definition-)
      "string name
uint32 age
string[] languages
")



(provide :interaction/information_msg "e60c7dfb26c5bf1eb0d8cbb8e4791239")


