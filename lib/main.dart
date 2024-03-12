import 'package:cuy_flutter_dev/config/routes/routes.dart';
import 'package:cuy_flutter_dev/config/theme/theme.dart';
import 'package:cuy_flutter_dev/injection_container.dart';
import 'package:cuy_flutter_dev/presentation/bloc/auth/auth_bloc.dart';
import 'package:cuy_flutter_dev/presentation/bloc/login/login_bloc.dart';
import 'package:cuy_flutter_dev/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()
            ..add(
              const AuthStarted(
                email: 'sys@cuy.pe',
                password: '123456',
              ),
            ),
        ),
        BlocProvider(create: (context) => sl<LoginBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const LoginPage(),
      ),
    );
  }
}
