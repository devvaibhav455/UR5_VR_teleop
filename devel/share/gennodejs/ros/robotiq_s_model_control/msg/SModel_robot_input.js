// Auto-generated. Do not edit!

// (in-package robotiq_s_model_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class SModel_robot_input {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gACT = null;
      this.gMOD = null;
      this.gGTO = null;
      this.gIMC = null;
      this.gSTA = null;
      this.gDTA = null;
      this.gDTB = null;
      this.gDTC = null;
      this.gDTS = null;
      this.gFLT = null;
      this.gPRA = null;
      this.gPOA = null;
      this.gCUA = null;
      this.gPRB = null;
      this.gPOB = null;
      this.gCUB = null;
      this.gPRC = null;
      this.gPOC = null;
      this.gCUC = null;
      this.gPRS = null;
      this.gPOS = null;
      this.gCUS = null;
    }
    else {
      if (initObj.hasOwnProperty('gACT')) {
        this.gACT = initObj.gACT
      }
      else {
        this.gACT = 0;
      }
      if (initObj.hasOwnProperty('gMOD')) {
        this.gMOD = initObj.gMOD
      }
      else {
        this.gMOD = 0;
      }
      if (initObj.hasOwnProperty('gGTO')) {
        this.gGTO = initObj.gGTO
      }
      else {
        this.gGTO = 0;
      }
      if (initObj.hasOwnProperty('gIMC')) {
        this.gIMC = initObj.gIMC
      }
      else {
        this.gIMC = 0;
      }
      if (initObj.hasOwnProperty('gSTA')) {
        this.gSTA = initObj.gSTA
      }
      else {
        this.gSTA = 0;
      }
      if (initObj.hasOwnProperty('gDTA')) {
        this.gDTA = initObj.gDTA
      }
      else {
        this.gDTA = 0;
      }
      if (initObj.hasOwnProperty('gDTB')) {
        this.gDTB = initObj.gDTB
      }
      else {
        this.gDTB = 0;
      }
      if (initObj.hasOwnProperty('gDTC')) {
        this.gDTC = initObj.gDTC
      }
      else {
        this.gDTC = 0;
      }
      if (initObj.hasOwnProperty('gDTS')) {
        this.gDTS = initObj.gDTS
      }
      else {
        this.gDTS = 0;
      }
      if (initObj.hasOwnProperty('gFLT')) {
        this.gFLT = initObj.gFLT
      }
      else {
        this.gFLT = 0;
      }
      if (initObj.hasOwnProperty('gPRA')) {
        this.gPRA = initObj.gPRA
      }
      else {
        this.gPRA = 0;
      }
      if (initObj.hasOwnProperty('gPOA')) {
        this.gPOA = initObj.gPOA
      }
      else {
        this.gPOA = 0;
      }
      if (initObj.hasOwnProperty('gCUA')) {
        this.gCUA = initObj.gCUA
      }
      else {
        this.gCUA = 0;
      }
      if (initObj.hasOwnProperty('gPRB')) {
        this.gPRB = initObj.gPRB
      }
      else {
        this.gPRB = 0;
      }
      if (initObj.hasOwnProperty('gPOB')) {
        this.gPOB = initObj.gPOB
      }
      else {
        this.gPOB = 0;
      }
      if (initObj.hasOwnProperty('gCUB')) {
        this.gCUB = initObj.gCUB
      }
      else {
        this.gCUB = 0;
      }
      if (initObj.hasOwnProperty('gPRC')) {
        this.gPRC = initObj.gPRC
      }
      else {
        this.gPRC = 0;
      }
      if (initObj.hasOwnProperty('gPOC')) {
        this.gPOC = initObj.gPOC
      }
      else {
        this.gPOC = 0;
      }
      if (initObj.hasOwnProperty('gCUC')) {
        this.gCUC = initObj.gCUC
      }
      else {
        this.gCUC = 0;
      }
      if (initObj.hasOwnProperty('gPRS')) {
        this.gPRS = initObj.gPRS
      }
      else {
        this.gPRS = 0;
      }
      if (initObj.hasOwnProperty('gPOS')) {
        this.gPOS = initObj.gPOS
      }
      else {
        this.gPOS = 0;
      }
      if (initObj.hasOwnProperty('gCUS')) {
        this.gCUS = initObj.gCUS
      }
      else {
        this.gCUS = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SModel_robot_input
    // Serialize message field [gACT]
    bufferOffset = _serializer.uint8(obj.gACT, buffer, bufferOffset);
    // Serialize message field [gMOD]
    bufferOffset = _serializer.uint8(obj.gMOD, buffer, bufferOffset);
    // Serialize message field [gGTO]
    bufferOffset = _serializer.uint8(obj.gGTO, buffer, bufferOffset);
    // Serialize message field [gIMC]
    bufferOffset = _serializer.uint8(obj.gIMC, buffer, bufferOffset);
    // Serialize message field [gSTA]
    bufferOffset = _serializer.uint8(obj.gSTA, buffer, bufferOffset);
    // Serialize message field [gDTA]
    bufferOffset = _serializer.uint8(obj.gDTA, buffer, bufferOffset);
    // Serialize message field [gDTB]
    bufferOffset = _serializer.uint8(obj.gDTB, buffer, bufferOffset);
    // Serialize message field [gDTC]
    bufferOffset = _serializer.uint8(obj.gDTC, buffer, bufferOffset);
    // Serialize message field [gDTS]
    bufferOffset = _serializer.uint8(obj.gDTS, buffer, bufferOffset);
    // Serialize message field [gFLT]
    bufferOffset = _serializer.uint8(obj.gFLT, buffer, bufferOffset);
    // Serialize message field [gPRA]
    bufferOffset = _serializer.uint8(obj.gPRA, buffer, bufferOffset);
    // Serialize message field [gPOA]
    bufferOffset = _serializer.uint8(obj.gPOA, buffer, bufferOffset);
    // Serialize message field [gCUA]
    bufferOffset = _serializer.uint8(obj.gCUA, buffer, bufferOffset);
    // Serialize message field [gPRB]
    bufferOffset = _serializer.uint8(obj.gPRB, buffer, bufferOffset);
    // Serialize message field [gPOB]
    bufferOffset = _serializer.uint8(obj.gPOB, buffer, bufferOffset);
    // Serialize message field [gCUB]
    bufferOffset = _serializer.uint8(obj.gCUB, buffer, bufferOffset);
    // Serialize message field [gPRC]
    bufferOffset = _serializer.uint8(obj.gPRC, buffer, bufferOffset);
    // Serialize message field [gPOC]
    bufferOffset = _serializer.uint8(obj.gPOC, buffer, bufferOffset);
    // Serialize message field [gCUC]
    bufferOffset = _serializer.uint8(obj.gCUC, buffer, bufferOffset);
    // Serialize message field [gPRS]
    bufferOffset = _serializer.uint8(obj.gPRS, buffer, bufferOffset);
    // Serialize message field [gPOS]
    bufferOffset = _serializer.uint8(obj.gPOS, buffer, bufferOffset);
    // Serialize message field [gCUS]
    bufferOffset = _serializer.uint8(obj.gCUS, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SModel_robot_input
    let len;
    let data = new SModel_robot_input(null);
    // Deserialize message field [gACT]
    data.gACT = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gMOD]
    data.gMOD = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gGTO]
    data.gGTO = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gIMC]
    data.gIMC = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gSTA]
    data.gSTA = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gDTA]
    data.gDTA = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gDTB]
    data.gDTB = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gDTC]
    data.gDTC = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gDTS]
    data.gDTS = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gFLT]
    data.gFLT = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gPRA]
    data.gPRA = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gPOA]
    data.gPOA = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gCUA]
    data.gCUA = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gPRB]
    data.gPRB = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gPOB]
    data.gPOB = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gCUB]
    data.gCUB = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gPRC]
    data.gPRC = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gPOC]
    data.gPOC = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gCUC]
    data.gCUC = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gPRS]
    data.gPRS = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gPOS]
    data.gPOS = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [gCUS]
    data.gCUS = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robotiq_s_model_control/SModel_robot_input';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4d0701156e580a420c48833f57bc83f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 gACT 
    uint8 gMOD 
    uint8 gGTO 
    uint8 gIMC 
    uint8 gSTA 
    uint8 gDTA 
    uint8 gDTB 
    uint8 gDTC 
    uint8 gDTS 
    uint8 gFLT 
    uint8 gPRA 
    uint8 gPOA 
    uint8 gCUA 
    uint8 gPRB 
    uint8 gPOB 
    uint8 gCUB 
    uint8 gPRC 
    uint8 gPOC 
    uint8 gCUC 
    uint8 gPRS 
    uint8 gPOS 
    uint8 gCUS
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SModel_robot_input(null);
    if (msg.gACT !== undefined) {
      resolved.gACT = msg.gACT;
    }
    else {
      resolved.gACT = 0
    }

    if (msg.gMOD !== undefined) {
      resolved.gMOD = msg.gMOD;
    }
    else {
      resolved.gMOD = 0
    }

    if (msg.gGTO !== undefined) {
      resolved.gGTO = msg.gGTO;
    }
    else {
      resolved.gGTO = 0
    }

    if (msg.gIMC !== undefined) {
      resolved.gIMC = msg.gIMC;
    }
    else {
      resolved.gIMC = 0
    }

    if (msg.gSTA !== undefined) {
      resolved.gSTA = msg.gSTA;
    }
    else {
      resolved.gSTA = 0
    }

    if (msg.gDTA !== undefined) {
      resolved.gDTA = msg.gDTA;
    }
    else {
      resolved.gDTA = 0
    }

    if (msg.gDTB !== undefined) {
      resolved.gDTB = msg.gDTB;
    }
    else {
      resolved.gDTB = 0
    }

    if (msg.gDTC !== undefined) {
      resolved.gDTC = msg.gDTC;
    }
    else {
      resolved.gDTC = 0
    }

    if (msg.gDTS !== undefined) {
      resolved.gDTS = msg.gDTS;
    }
    else {
      resolved.gDTS = 0
    }

    if (msg.gFLT !== undefined) {
      resolved.gFLT = msg.gFLT;
    }
    else {
      resolved.gFLT = 0
    }

    if (msg.gPRA !== undefined) {
      resolved.gPRA = msg.gPRA;
    }
    else {
      resolved.gPRA = 0
    }

    if (msg.gPOA !== undefined) {
      resolved.gPOA = msg.gPOA;
    }
    else {
      resolved.gPOA = 0
    }

    if (msg.gCUA !== undefined) {
      resolved.gCUA = msg.gCUA;
    }
    else {
      resolved.gCUA = 0
    }

    if (msg.gPRB !== undefined) {
      resolved.gPRB = msg.gPRB;
    }
    else {
      resolved.gPRB = 0
    }

    if (msg.gPOB !== undefined) {
      resolved.gPOB = msg.gPOB;
    }
    else {
      resolved.gPOB = 0
    }

    if (msg.gCUB !== undefined) {
      resolved.gCUB = msg.gCUB;
    }
    else {
      resolved.gCUB = 0
    }

    if (msg.gPRC !== undefined) {
      resolved.gPRC = msg.gPRC;
    }
    else {
      resolved.gPRC = 0
    }

    if (msg.gPOC !== undefined) {
      resolved.gPOC = msg.gPOC;
    }
    else {
      resolved.gPOC = 0
    }

    if (msg.gCUC !== undefined) {
      resolved.gCUC = msg.gCUC;
    }
    else {
      resolved.gCUC = 0
    }

    if (msg.gPRS !== undefined) {
      resolved.gPRS = msg.gPRS;
    }
    else {
      resolved.gPRS = 0
    }

    if (msg.gPOS !== undefined) {
      resolved.gPOS = msg.gPOS;
    }
    else {
      resolved.gPOS = 0
    }

    if (msg.gCUS !== undefined) {
      resolved.gCUS = msg.gCUS;
    }
    else {
      resolved.gCUS = 0
    }

    return resolved;
    }
};

module.exports = SModel_robot_input;
