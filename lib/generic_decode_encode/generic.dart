

import 'dart:convert';

class GenericDecodeEncode{

  dynamic decodeJson(String response){
    return json.decode(response);
  }

  dynamic encodeJson(String reponse){
    return json.encode(reponse);
  }
}