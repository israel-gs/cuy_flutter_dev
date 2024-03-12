import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  final Function(String, String) onLoginPressed;
  final bool loading;
  const LoginFormWidget({
    super.key,
    required this.onLoginPressed,
    this.loading = false,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final formKey = GlobalKey<FormState>();
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  String email = 'demo@cuy.pe';
  String password = '12345678';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: email,
            onChanged: (value) {
              email = value;
            },
            decoration: const InputDecoration(
              labelText: 'Correo electrónico',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese su correo electrónico';
              }
              if (!emailRegex.hasMatch(value)) {
                return 'Por favor, ingrese un correo electrónico válido';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: password,
            onChanged: (value) {
              password = value;
            },
            decoration: const InputDecoration(
              labelText: 'Contraseña',
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese su contraseña';
              }
              return null;
            },
          ),
          const SizedBox(height: 83),
          ElevatedButton(
            onPressed: widget.loading
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    if (formKey.currentState!.validate()) {
                      widget.onLoginPressed(email, password);
                    }
                  },
            child: const Text(
              'Iniciar sesión',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
