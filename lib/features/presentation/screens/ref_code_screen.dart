import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_tutorial/core/api/constants.dart';
import 'package:payment_tutorial/features/business/cubit/payment_cubit.dart';

class RefCodeScreen extends StatelessWidget {
  const RefCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return Text(
              refCode,
              style: const TextStyle(color: Colors.black),
            );
          },
        ),
      ),
    );
  }
}
