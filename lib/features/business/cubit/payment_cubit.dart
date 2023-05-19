import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_tutorial/features/data/model/order_id_model.dart';
import 'package:payment_tutorial/features/data/repository/payment_repository.dart';
import 'package:payment_tutorial/features/presentation/screens/visa_screen.dart';

import '../../../core/api/constants.dart';
import '../../data/model/first_token_model.dart';
import '../../presentation/screens/ref_code_screen.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository paymentRepository;
  PaymentCubit({required this.paymentRepository}) : super(PaymentInitial());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isLoading = false;

  Future<void> getFirstToken(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String price,
      required bool isVisa,
      required BuildContext context}) async {
    await paymentRepository.firstToken().then((FirstTokenModel value) {
      isLoading = true;
      emit(ChangeLoading());
      paymobFirstToken = value.token;

      emit(PaymentGetFirstTokenSuccess());
      getOrderId(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone,
          price: price,
          isVisa: isVisa,
          context: context);

      isLoading = false;
      emit(ChangeLoading());
    }).onError(
      (error, stackTrace) {
        emit(
          PaymentGetFirstTokenError(
            error: error.toString(),
          ),
        );
      },
    );
  }

  Future<void> getOrderId(
      {required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String price,
      required bool isVisa,
      required BuildContext context}) async {
    await paymentRepository
        .orderId(token: paymobFirstToken, price: price)
        .then((OrderIdModel value) async {
      orderId = value.id.toString();

      emit(PaymentGetOrderIdSuccess());

      if (isVisa) {
        getCardRequestToken(
            authToken: paymobFirstToken,
            orderId: orderId,
            firstName: firstName,
            lastName: lastName,
            price: price,
            email: email,
            context: context,
            phone: phone);
      
      } else {
        await getKioskRequestToken(
            authToken: paymobFirstToken,
            orderId: orderId,
            firstName: firstName,
            lastName: lastName,
            price: price,
            email: email,
            phone: phone);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const RefCodeScreen(),
          ),
        );
      }
    }).onError(
      (error, stackTrace) {
        emit(
          PaymentGetOrderIdError(
            error: error.toString(),
          ),
        );
      },
    );
  }

  Future<void> getCardRequestToken(
      {required String authToken,
      required String orderId,
      required String firstName,
      required String lastName,
      required String price,
      required String email,
      required BuildContext context,
      required String phone}) async {
    await paymentRepository
        .cardRequestToken(
            authToken: authToken,
            orderId: orderId,
            firstName: firstName,
            price: price,
            lastName: lastName,
            email: email,
            phone: phone)
        .then((String value) {
      finalCardToken = value;

      emit(PaymentGetCardFinalTokenSuccess());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>  VisaCardScreen(token: finalCardToken),
          ),
        );
    }).onError(
      (error, stackTrace) {
        emit(
          PaymentGetCardFinalTokenError(
            error: error.toString(),
          ),
        );
      },
    );
  }

  Future<void> getKioskRequestToken(
      {required String authToken,
      required String orderId,
      required String firstName,
      required String lastName,
      required String email,
      required String price,
      required String phone}) async {
    await paymentRepository
        .kioskRequestToken(
            authToken: authToken,
            orderId: orderId,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
            price: price)
        .then((String value) {
      finalKioskToken = value;
      log("Final kiosk token $value");
      emit(PaymentGetKioskFinalTokenSuccess());
      getRefCode(finalKioskToken);
    }).onError(
      (error, stackTrace) {
        emit(
          PaymentGetKioskFinalTokenError(
            error: error.toString(),
          ),
        );
      },
    );
  }

  Future<void> getRefCode(String token) async {
    await paymentRepository.refCode(token).then((value) {
      refCode = value.data.billReference.toString();
      log("refCode $refCode");
      log("==============");

      emit(PaymentGetKioskRefCodeSuccess());
    });
  }

  void dispose() {
    lastNameController.dispose();
    firstNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    priceController.dispose();
  }

  void clear() {
    lastNameController.clear();
    firstNameController.clear();
    emailController.clear();
    phoneController.clear();
    priceController.clear();
  }
}
