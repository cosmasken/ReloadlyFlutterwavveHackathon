import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:swarp/model/country.dart'as country;
import 'package:swarp/model/gift_card.dart';
import 'package:swarp/model/token.dart';



class ReloadlyController extends GetxController{
  late TextEditingController numberTextController;
  var countries = <country.Country>[].obs;

  @override
  void onInit() {

    super.onInit();
    numberTextController =  TextEditingController.fromValue(TextEditingValue(
      text: '2547xxxxxxx',
    ));
  }

  var reloadlyBalance = '0'.obs;
  var dataBalance = '0'.obs;
  var reloadlyName = ''.obs;
  String countriesUrl = 'https://topups.reloadly.com/countries';
  String tokenUrl = 'https://auth.reloadly.com/oauth/token';
  String topup = 'https://topups.reloadly.com/topups';
  String giftcardUrl = 'https://giftcards.reloadly.com/products';
  String balanceUrl = 'https://topups.reloadly.com/accounts/balance';
  String clientId='e1eWtNxxKH5JhAwMzFmmQT2O09zdJVyQ';
  String secretId='zIpOYVLk5X-2j9JL5dLwpDVlCM4erE-MwC9cVV2udA7mfBvJi8QtVm7TH5aQ1Zx';
  var _token = '';
  var balance = ''.obs;
  var currencyCode= ''.obs;
  var currencyName= ''.obs;
  var updatedAt = ''.obs;
 /* data: {
  "operatorId":"1",
  "amount":"1",
  "useLocalAmount": false,
  "customIdentifier": "This is example identifier",
  "recipientPhone": {
  "countryCode": "CA",
  "number": "1231231231"
  },
  "senderPhone": {
  "countryCode": "CA",
  "number": "1231231231"
  }
  }*/

  Future<void> getCountries() async {
    var net = dio.Dio();
    var body = {
      "client_id": 'e1eWtNxxKH5JhAwMzFmmQT2O09zdJVyQ',
      "client_secret": 'zIpOYVLk5X-2j9JL5dLwpDVlCM4erE-MwC9cVV2udA7mfBvJi8QtVm7TH5aQ1Zx',
      "grant_type": "client_credentials",
      "audience": "https://topups.reloadly.com"
    };
    try{
      dio.Response token = await net.post(tokenUrl,
          data: body,
          options: dio.Options(
            headers: {
              'Content-type': 'application/json'
            },
          ));
      Map<dynamic, dynamic> tokendata = token.data;
      _token = tokendata["access_token"];
      print(_token);

    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
   /* try{
      dio.Response token = await net.get(countriesUrl,
          options: dio.Options(
            headers: {
              'Authorization': 'Bearer $_token',
              'Content-type': 'application/json'
            },
          ));

      Map<String, dynamic> map = json.decode(token.toString());
      //balance.value =map["name"].toString() ;
     // countries.value.add(value);
      //return map["name"].toString();
      final contents = Country.fromJson(json.decode(token.data));
     print(map);

    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }*/
  }

  void getToken() async {
    var options = {
      "client_id": 'W0KIHaAPOEsjgbv27xIPCllqQQnj0Aoz',
      "client_secret": 'lL0QLbrrqN-ThoQiVdoW12bskT8QnG-o1HQO8LoJEETItwSXFvpeWeUruEbHWOY',
      "grant_type": "client_credentials",
      "audience": "https://topups.reloadly.com"
    };

    final getToken = await http.post(Uri.parse(tokenUrl),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(options));

  }
   topupno() async {
    var net = dio.Dio();
    var body = {
      "client_id": 'W0KIHaAPOEsjgbv27xIPCllqQQnj0Aoz',
      "client_secret": 'lL0QLbrrqN-ThoQiVdoW12bskT8QnG-o1HQO8LoJEETItwSXFvpeWeUruEbHWOY',
      "grant_type": "client_credentials",
      "audience": "https://topups.reloadly.com"
    };
    var topupbody = {
      "operatorId": '685',
      "amount": '50',
      "receiverPhone": "254790780235",
      "senderPhone": '254704262011',
      "countryCode": '254',
      "number": "254790780235"
    };
    try{
      dio.Response token = await net.post(tokenUrl,
          data: body,
          options: dio.Options(
            headers: {
              'Content-type': 'application/json'
            },
          ));
      Map<dynamic, dynamic> tokendata = token.data;
      _token = tokendata["access_token"];
      print(_token);


    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

    try{

      dio.Response token = await net.post(topup,
          data: topupbody,
          options: dio.Options(

            headers: {
              'Authorization': 'Bearer $_token',
              'Content-type': 'application/json'
            },
          ));

      print(token.toString());
 Map<String, dynamic> map = json.decode(token.toString());
      balance.value =map["balance"].toString() ;
      return map["balance"].toString();


    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<String> getBalance() async {
    var net = dio.Dio();
    var body = {
      "client_id": 'W0KIHaAPOEsjgbv27xIPCllqQQnj0Aoz',
      "client_secret": 'lL0QLbrrqN-ThoQiVdoW12bskT8QnG-o1HQO8LoJEETItwSXFvpeWeUruEbHWOY',
      "grant_type": "client_credentials",
      "audience": "https://topups.reloadly.com"
    };
    try{
      dio.Response token = await net.post(tokenUrl,
          data: body,
          options: dio.Options(
        headers: {
          'Content-type': 'application/json'
        },
      ));
      Map<dynamic, dynamic> tokendata = token.data;
       _token = tokendata["access_token"];
      print(_token);

    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
    try{
      dio.Response token = await net.get(balanceUrl,
          options: dio.Options(
            headers: {
              'Authorization': 'Bearer $_token',
              'Content-type': 'application/json'
            },
          ));

      print(token.toString());
      Map<String, dynamic> map = json.decode(token.toString());
      balance.value =map["balance"].toString() ;
      return map["balance"].toString();

    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  //fetch gift cards
Future<List<Content>> fetchGiftCards() async {
    var tokenOption = {
      "client_id": clientId,
      "client_secret": secretId,
      "grant_type": "client_credentials",
      "audience": "https://topups.reloadly.com"
    };

    //1.get token
    final token = await http.post(Uri.parse(tokenUrl),
        headers: {
          'Content-type': 'application/json',
        },
        body: json.encode(tokenOption));

    Token getToken = tokenFromJson(token.body);
    //...
    _token = getToken.accessToken;

    //2. use token to get all products
    final response = await http.get(
      Uri.parse(giftcardUrl),
      headers: {
        'Authorization': 'Bearer $_token',
        'Accept': 'application/com.reloadly.giftcards-v1+json',
      },
    );

    final contents = GiftCard.fromJson(json.decode(response.body));

    return contents.content;
  }

  //fetch product/ gift card by id
  Future<List<Content>> fetchGiftCardById(int productId) async {
    String url = giftcardUrl + "/" + "$productId";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $_token',
        'Accept': 'application/com.reloadly.giftcards-v1+json',
      },
    );

    final contents = GiftCard.fromJson(json.decode(response.body));

    return contents.content;
  }


}
