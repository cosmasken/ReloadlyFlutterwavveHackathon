import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:get/get.dart';

import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:dio/dio.dart' as dio;

class FlutterwaveController extends GetxController {
  String transferendpoint = 'https://api.flutterwave.com/v3/transfers';
  var _token = '';
  var bearer = 'Authorization: Bearer FLWSECK_TEST-SANDBOXDEMOKEY-X';
  static String? _currency;
  static String? _reference;
  static String? _email;

  static String? _phoneNumber;

  static get currency => _currency;

  static get reference => _reference;

  static get email => _email;

  static get phoneNumber => _phoneNumber;

// Test Keys
//'FLWPUBK_TEST-2e482f2ecfdf5635abb9adec00d753bc-X'
//'FLWSECK_TEST67fd39b84664'


   beginPayment(BuildContext context) async {
    final Flutterwave flutterWave = Flutterwave.forUIPayment(
        context: context,
        encryptionKey: "FLWSECK_TEST67fd39b84664",
        publicKey: "FLWPUBK_TEST-2e482f2ecfdf5635abb9adec00d753bc-X",
        currency: 'NGN',
        amount: '100',
        email: "cosmasarubaken@gmail.com",
        fullName: "Test",
        txRef: 'reference',
        isDebugMode: true,
        phoneNumber: "08060421709",
        acceptCardPayment: true,
        acceptUSSDPayment: true,
        acceptAccountPayment: true,
        acceptFrancophoneMobileMoney: false,
        acceptGhanaPayment: true,
        acceptMpesaPayment: false,
        acceptRwandaMoneyPayment: true,
        acceptUgandaPayment: true,
        acceptZambiaPayment: false);

    try {
      final ChargeResponse response =
      await flutterWave.initializeForUiPayments();
      if (response == null) {
        // user didn't complete the transaction.
      } else {
        final isSuccessful = checkPaymentIsSuccessful(response);
        if (isSuccessful) {
          print("woooww");
        } else {
          // check message
          print(response.message);

          // check status
          print(response.status);

          // check processor error
          print(response.data!.processorResponse);
        }
      }
    } catch (error, stacktrace) {
      print(error);
    }
  }

  static bool checkPaymentIsSuccessful(final ChargeResponse response) {
    return response.data!.status == FlutterwaveConstants.SUCCESSFUL &&
        response.data!.currency == currency &&
        response.data!.amount == '100' &&
        response.data!.txRef == reference;
  }

}
