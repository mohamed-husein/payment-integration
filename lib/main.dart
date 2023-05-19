import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_tutorial/core/services/service_locator.dart';
import 'package:payment_tutorial/features/business/cubit/payment_cubit.dart';
import 'package:payment_tutorial/features/presentation/screens/toggle_screen.dart';
import 'core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjectionServices().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PaymentCubit>(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Gordita',
          primaryColor: mainColor,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          brightness: Brightness.light,
        ),
        debugShowCheckedModeBanner: false,
        home: const ToggleScreen(),
      ),
    );
  }
}
