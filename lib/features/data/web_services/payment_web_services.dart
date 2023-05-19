import 'dart:developer';

import 'package:payment_tutorial/core/api/dio_consumer.dart';
import 'package:payment_tutorial/core/api/end_points.dart';
import 'package:payment_tutorial/features/data/model/first_token_model.dart';
import 'package:payment_tutorial/features/data/model/kiosk_model.dart';
import 'package:payment_tutorial/features/data/model/order_id_model.dart';

import '../../../core/api/constants.dart';

class PaymentWebServices {
  final DioConsumer dioConsumer;

  PaymentWebServices({required this.dioConsumer});

  Future<FirstTokenModel> getFirstToken() async {
    final response = await dioConsumer.post(
      EndPoints.auth,
      body: {"api_key": paymodApiKey},
    );

    return FirstTokenModel.fromJson(response);
  }

  Future<OrderIdModel> getOrderId(
      {required String authToken, required String price}) async {
    final response = await dioConsumer.post(
      EndPoints.orderId,
      body: {
        "auth_token": authToken,
        "delivery_needed": "false",
        "amount_cents": (int.parse(price) * 100).toString(),
        "currency": "EGP",
        "items": [],
      },
    );
    log("price ${(int.parse(price) * 100).toString()}");
    return OrderIdModel.fromJson(response);
  }

  Future<String> getCardRequestToken(
      {required String authToken,
      required String orderId,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String price,
      
      }) async {
    final response = await dioConsumer.post(
      EndPoints.cardRequestToken,
      body: {
        "auth_token": authToken,
        "amount_cents": (int.parse(price) * 100).toString(),
        "expiration": 3600,
        "order_id": orderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": integrationCardId,
      },
    );

    return response['token'];
  }

  Future<String> getKioskRequestToken(
      {required String authToken,
      required String orderId,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String price,
      
      }) async {
    final response = await dioConsumer.post(
      EndPoints.kioskRequestToken,
      body: {
        "auth_token": authToken,
        "amount_cents": (int.parse(price) * 100).toString(),
        "expiration": 3600,
        "order_id": orderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": integrationKioskId,
      },
    );

    return response['token'];
  }

  Future<KioskModel> geRefCode(final token) async {
    final response = await dioConsumer.post(
      EndPoints.kioskRefCode,
      body: {
        "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
        "payment_token": token
      },
    );

    return KioskModel.fromJson(response);
  }
}
