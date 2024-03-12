import 'package:cuy_flutter_dev/presentation/bloc/auth/auth_bloc.dart';
import 'package:cuy_flutter_dev/presentation/bloc/login/login_bloc.dart';
import 'package:cuy_flutter_dev/presentation/widgets/login_form_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return _buildLoader();
            } else if (state is AuthFailure) {
              return _buildError(state.errorMessage);
            } else if (state is AuthSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTitle(),
                  const SizedBox(height: 80),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return LoginFormWidget(
                        onLoginPressed: (emailOrPhone, password) {
                          context.read<LoginBloc>().add(
                                LoginStarted(
                                  emailOrPhone: emailOrPhone,
                                  password: password,
                                ),
                              );
                        },
                        loading: state is LoginLoading,
                      );
                    },
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorMessage),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else if (state is LoginSuccess) {
                        Navigator.of(context).pushReplacementNamed('/main');
                      }
                    },
                    child: Container(),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  _buildLoader() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  _buildError(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }

  _buildTitle() {
    return const Text(
      'Bienvenido de vuelta',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4A4A4A),
      ),
    );
  }
}
