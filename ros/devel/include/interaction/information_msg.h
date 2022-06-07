// Generated by gencpp from file interaction/information_msg.msg
// DO NOT EDIT!


#ifndef INTERACTION_MESSAGE_INFORMATION_MSG_H
#define INTERACTION_MESSAGE_INFORMATION_MSG_H


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
struct information_msg_
{
  typedef information_msg_<ContainerAllocator> Type;

  information_msg_()
    : name()
    , age(0)
    , languages()  {
    }
  information_msg_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , age(0)
    , languages(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef uint32_t _age_type;
  _age_type age;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _languages_type;
  _languages_type languages;





  typedef boost::shared_ptr< ::interaction::information_msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::interaction::information_msg_<ContainerAllocator> const> ConstPtr;

}; // struct information_msg_

typedef ::interaction::information_msg_<std::allocator<void> > information_msg;

typedef boost::shared_ptr< ::interaction::information_msg > information_msgPtr;
typedef boost::shared_ptr< ::interaction::information_msg const> information_msgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::interaction::information_msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::interaction::information_msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::interaction::information_msg_<ContainerAllocator1> & lhs, const ::interaction::information_msg_<ContainerAllocator2> & rhs)
{
  return lhs.name == rhs.name &&
    lhs.age == rhs.age &&
    lhs.languages == rhs.languages;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::interaction::information_msg_<ContainerAllocator1> & lhs, const ::interaction::information_msg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace interaction

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::interaction::information_msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::interaction::information_msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::interaction::information_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::interaction::information_msg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaction::information_msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaction::information_msg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::interaction::information_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e60c7dfb26c5bf1eb0d8cbb8e4791239";
  }

  static const char* value(const ::interaction::information_msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe60c7dfb26c5bf1eULL;
  static const uint64_t static_value2 = 0xb0d8cbb8e4791239ULL;
};

template<class ContainerAllocator>
struct DataType< ::interaction::information_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "interaction/information_msg";
  }

  static const char* value(const ::interaction::information_msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::interaction::information_msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n"
"uint32 age\n"
"string[] languages\n"
;
  }

  static const char* value(const ::interaction::information_msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::interaction::information_msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.age);
      stream.next(m.languages);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct information_msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::interaction::information_msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::interaction::information_msg_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "age: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.age);
    s << indent << "languages[]" << std::endl;
    for (size_t i = 0; i < v.languages.size(); ++i)
    {
      s << indent << "  languages[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.languages[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // INTERACTION_MESSAGE_INFORMATION_MSG_H
