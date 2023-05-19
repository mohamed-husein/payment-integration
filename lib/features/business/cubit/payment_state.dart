part of 'payment_cubit.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

class PaymentInitial extends PaymentState {}

class ChangeLoading extends PaymentState {}
class PaymentGetFirstTokenSuccess extends PaymentState {}

class PaymentGetFirstTokenError extends PaymentState {
  final String error;
  const PaymentGetFirstTokenError({required this.error});

  @override
  List<Object> get props => [error];
}

class PaymentGetOrderIdSuccess extends PaymentState {}

class PaymentGetOrderIdError extends PaymentState {
  final String error;
  const PaymentGetOrderIdError({required this.error});

  @override
  List<Object> get props => [error];
}

class PaymentGetCardFinalTokenSuccess extends PaymentState {}

class PaymentGetCardFinalTokenError extends PaymentState {
  final String error;
  const PaymentGetCardFinalTokenError({required this.error});

  @override
  List<Object> get props => [error];
}

class PaymentGetKioskFinalTokenSuccess extends PaymentState {}

class PaymentGetKioskFinalTokenError extends PaymentState {
  final String error;
  const PaymentGetKioskFinalTokenError({required this.error});

  @override
  List<Object> get props => [error];
}

class PaymentGetKioskRefCodeSuccess extends PaymentState {}

class PaymentGetKioskRefCodeError extends PaymentState {
  final String error;
  const PaymentGetKioskRefCodeError({required this.error});

  @override
  List<Object> get props => [error];
}

