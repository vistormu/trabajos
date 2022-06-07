// Generated by gencpp from file interaction/product_srvResponse.msg
// DO NOT EDIT!


#ifndef INTERACTION_MESSAGE_PRODUCT_SRVRESPONSE_H
#define INTERACTION_MESSAGE_PRODUCT_SRVRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace interaction
{
template <class ContainerAllocator>
struct product_srvResponse_
{
  typedef product_srvResponse_<ContainerAllocator> Type;

  product_srvResponse_()
    : result(0)  {
    }
  product_srvResponse_(const ContainerAllocator& _alloc)
    : result(0)  {
  (void)_alloc;
    }



   typedef uint32_t _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::interaction::product_srvResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::interaction::product_srvResponse_<ContainerAllocator> const> ConstPtr;

}; // struct product_srvResponse_

typedef ::interaction::product_srvResponse_<std::allocator<void> > product_srvResponse;

typedef boost::shared_ptr< ::interaction::product_srvResponse > product_srvResponsePtr;
typedef boost::shared_ptr< ::interaction::product_srvResponse const> product_srvResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::interaction::product_srvResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::interaction::product_srvResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::interaction::product_srvResponse_<ContainerAllocator1> & lhs, const ::interaction::product_srvResponse_<ContainerAllocator2> & rhs)
{
  return lhs.result == rhs.result;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::interaction::product_srvResponse_<ContainerAllocator1> & lhs, const ::interaction::product_srvResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace interaction

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::interaction::product_srvResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::interaction::product_srvResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::interaction::product_srvResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::interaction::product_srvResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaction::product_srvResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaction::product_srvResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::interaction::product_srvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "13d5d28ceaaadbc975dd072a2e10b88a";
  }

  static const char* value(const ::interaction::product_srvResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x13d5d28ceaaadbc9ULL;
  static const uint64_t static_value2 = 0x75dd072a2e10b88aULL;
};

template<class ContainerAllocator>
struct DataType< ::interaction::product_srvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "interaction/product_srvResponse";
  }

  static const char* value(const ::interaction::product_srvResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::interaction::product_srvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint32 result\n"
;
  }

  static const char* value(const ::interaction::product_srvResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::interaction::product_srvResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct product_srvResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::interaction::product_srvResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::interaction::product_srvResponse_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // INTERACTION_MESSAGE_PRODUCT_SRVRESPONSE_H
