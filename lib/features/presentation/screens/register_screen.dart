// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_tutorial/features/business/cubit/payment_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final bool isPayByVisa;

  SignUpScreen({Key? key, required this.isPayByVisa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeCtrl = BlocProvider.of<PaymentCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(isPayByVisa ? 'Payment By Visa' : 'Payment By Ref Code',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w500, color: mainColor)),
      ),
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    right: 20,
                    left: 20,
                  ),
                  child: Text(
                    'Payment-Gateway Integration',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: mainColor),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormFieldUtils(
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  controller: homeCtrl.firstNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter valid name';
                    }
                    return null;
                  },
                  hintText: 'First Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/icons/User.svg',
                        color: mainColor),
                  ),
                ),
                TextFormFieldUtils(
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  controller: homeCtrl.lastNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter valid name';
                    }
                    return null;
                  },
                  hintText: 'Last Name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/icons/User.svg',
                        color: mainColor),
                  ),
                ),
                TextFormFieldUtils(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: homeCtrl.emailController,
                  validator: (value) {
                    if (value.toString().length <= 2) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                  hintText: 'Email',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/icons/envelope.svg',
                        color: mainColor),
                  ),
                ),
                TextFormFieldUtils(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  controller: homeCtrl.phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your phone';
                    }
                    return null;
                  },
                  hintText: 'Phone',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/icons/phone-call.svg',
                        color: mainColor),
                  ),
                ),
                TextFormFieldUtils(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  controller: homeCtrl.priceController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter valid price';
                    }
                    return null;
                  },
                  hintText: 'Price',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset('assets/icons/tags.svg',
                        color: mainColor),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                BlocBuilder<PaymentCubit, PaymentState>(
                  builder: (context, state) {
                    if (homeCtrl.isLoading) {
                      return const CircularProgressIndicator();
                    }
                    return ButtonUtils(
                      text: isPayByVisa ? 'Go to pay' : 'Get Ref Code',
                      onPressed: () async {
                        await BlocProvider.of<PaymentCubit>(context)
                            .getFirstToken(
                          firstName: homeCtrl.firstNameController.text,
                          lastName: homeCtrl.lastNameController.text,
                          email: homeCtrl.emailController.text,
                          phone: homeCtrl.phoneController.text,
                          price: homeCtrl.priceController.text,
                          isVisa: isPayByVisa,
                          context: context,
                        );

                        homeCtrl.clear();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
