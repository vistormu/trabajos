// Auto-generated. Do not edit!

// (in-package interaction.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let information_msg = require('./information_msg.js');
let position_msg = require('./position_msg.js');

//-----------------------------------------------------------

class user_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.information = null;
      this.position = null;
      this.emotion = null;
    }
    else {
      if (initObj.hasOwnProperty('information')) {
        this.information = initObj.information
      }
      else {
        this.information = new information_msg();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new position_msg();
      }
      if (initObj.hasOwnProperty('emotion')) {
        this.emotion = initObj.emotion
      }
      else {
        this.emotion = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type user_msg
    // Serialize message field [information]
    bufferOffset = information_msg.serialize(obj.information, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = position_msg.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [emotion]
    bufferOffset = _serializer.string(obj.emotion, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type user_msg
    let len;
    let data = new user_msg(null);
    // Deserialize message field [information]
    data.information = information_msg.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = position_msg.deserialize(buffer, bufferOffset);
    // Deserialize message field [emotion]
    data.emotion = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += information_msg.getMessageSize(object.information);
    length += _getByteLength(object.emotion);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'interaction/user_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'df5514cbf35b34e84b550eb6858f003d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    information_msg information
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new user_msg(null);
    if (msg.information !== undefined) {
      resolved.information = information_msg.Resolve(msg.information)
    }
    else {
      resolved.information = new information_msg()
    }

    if (msg.position !== undefined) {
      resolved.position = position_msg.Resolve(msg.position)
    }
    else {
      resolved.position = new position_msg()
    }

    if (msg.emotion !== undefined) {
      resolved.emotion = msg.emotion;
    }
    else {
      resolved.emotion = ''
    }

    return resolved;
    }
};

module.exports = user_msg;
