import 'package:flutter/material.dart';

import 'package:string_validator/string_validator.dart' as validator;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Cliente Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormClientePage(),
    );
  }
}

class FormClientePage extends StatefulWidget {
  const FormClientePage({Key? key}) : super(key: key);

  @override
  State<FormClientePage> createState() => _FormClientePageState();
}

class _FormClientePageState extends State<FormClientePage> {
  final formKey = GlobalKey<FormState>();
  var user = UserModel();
  var passwordCache = '';
  var passwordCacheConfirm = '';
  bool obscuredTextPassoword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário do Cliente'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            CustomTextFiled(
              label: 'Full Name',
              hint: 'type your name...',
              icon: Icons.person,
              onSaved: (text) => user = user.copyWith(name: text),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'This field cann\'t be empery';
                }
                if (text.length < 5) {
                  return 'Field name needs more 5 characters. (Has ${text.length})';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            CustomTextFiled(
              label: 'Email',
              hint: 'type your email...',
              icon: Icons.mail,
              onSaved: (text) => user = user.copyWith(email: text),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'This field cann\'t be empery';
                }
                if (!validator.isEmail(text)) {
                  return 'Value must be email type';
                }
              },
            ),
            const SizedBox(height: 15),
            CustomTextFiled(
              label: 'Password',
              hint: 'type your password...',
              icon: Icons.vpn_key,
              obscureText: obscuredTextPassoword,
              suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      obscuredTextPassoword = !obscuredTextPassoword;
                    });
                  },
                  icon: Icon(obscuredTextPassoword
                      ? Icons.visibility
                      : Icons.visibility_off)),
              onSaved: (text) => user = user.copyWith(password: text),
              onChanged: (text) => passwordCache = text,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'This field cann\'t be empery';
                }
              },
            ),
            const SizedBox(height: 15),
            CustomTextFiled(
              label: 'Confirm Password',
              hint: 'confirm your password...',
              icon: Icons.vpn_key,
              obscureText: obscuredTextPassoword,
              suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      obscuredTextPassoword = !obscuredTextPassoword;
                    });
                  },
                  icon: Icon(obscuredTextPassoword
                      ? Icons.visibility
                      : Icons.visibility_off)),
              onSaved: (text) => user = user.copyWith(password: text),
              onChanged: (text) => passwordCacheConfirm = text,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'This field cann\'t be empery';
                }
                if (passwordCacheConfirm != passwordCache) {
                  return 'Password don\'t match';
                }
              },
            ),
            const SizedBox(height: 40),
            Builder(builder: (context) {
              return SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (Form.of(context)!.validate()) {
                      formKey.currentState!.save();
                      print('''
                      Form 
                      
                      Name: ${user.name}
                      Email: ${user.email}
                      Passoword: ${user.password}
                      ''');
                    }
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                ),
              );
            }),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  formKey.currentState?.reset();
                },
                icon: const Icon(Icons.save),
                label: const Text('Reset'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CustomTextFiled extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final bool obscureText;
  final Widget? suffix;
  final String? Function(String? text)? validator;
  final void Function(String? text)? onSaved;
  final void Function(String text)? onChanged;

  const CustomTextFiled({
    Key? key,
    required this.label,
    this.icon,
    this.obscureText = false,
    this.hint,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        onSaved: onSaved,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
          prefixIcon: icon == null ? null : Icon(icon),
          suffixIcon: suffix,
        ));
  }
}

@immutable
class UserModel {
  final String name;
  final String email;
  final String password;

  UserModel({
    this.name = '',
    this.email = '',
    this.password = '',
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
