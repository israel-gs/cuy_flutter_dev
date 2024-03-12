import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)?.email ?? '',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)?.pleaseEnterEmail ?? '';
              }
              if (!emailRegex.hasMatch(value)) {
                return AppLocalizations.of(context)?.pleaseEnterValidEmail ??
                    '';
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
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)?.password ?? '',
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)?.pleaseEnterPassword ?? '';
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
            child: Text(
              AppLocalizations.of(context)?.login ?? '',
              style: const TextStyle(
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
