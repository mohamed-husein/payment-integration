import 'package:payment_tutorial/features/data/model/first_token_model.dart';
import 'package:payment_tutorial/features/data/model/kiosk_model.dart';
import 'package:payment_tutorial/features/data/model/order_id_model.dart';
import 'package:payment_tutorial/features/data/web_services/payment_web_services.dart';

class PaymentRepository {
  final PaymentWebServices services;

  PaymentRepository({required this.services});

  Future<FirstTokenModel> firstToken() async {
    return await services.getFirstToken();
  }

  Future<OrderIdModel> orderId(
      {required String token, required String price}) async {
    return await services.getOrderId(authToken: token, price: price);
  }

  Future<String> cardRequestToken(
      {required String authToken,
      required String orderId,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,required String price}) async {
    return await services.getCardRequestToken(
        authToken: authToken,
        orderId: orderId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,price: price);
  }

  Future<String> kioskRequestToken(
      {required String authToken,
      required String orderId,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,required String price}) async {
    return await services.getKioskRequestToken(
        authToken: authToken,
        orderId: orderId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,price: price);
  }

  Future<KioskModel> refCode(String token) async {
    return await services.geRefCode(token);
  }
}
