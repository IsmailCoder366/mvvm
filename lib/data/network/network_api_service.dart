import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm/data/exception.dart';
import 'package:mvvm/data/network/base_api_service.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async{

      dynamic responseJson;
    try{

      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);

    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
      return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{

      http.Response response = await http.post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200 :
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400 || 401 :
        return BadRequestException(response.body.toString());
      case 404 :
        return UnathorizedException(response.body.toString());
        default:
          throw FetchDataException(response.statusCode.toString());
    }
  }

}