import 'package:flutter/material.dart';
import 'package:form_widget/reusable/widget/custom_password_field.dart';
import 'package:form_widget/reusable/widget/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    void register() {
      if (formKey.currentState!.validate()) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Dang ky thanh cong')));
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Form Dang ky')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: emailController,
                label: 'Email',
                hint: 'Nhap email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email khong duoc de trong";
                  }
                  final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (!emailRegex.hasMatch(value)) {
                    return "Email khong dung dinh dang";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomPasswordField(
                controller: passwordController,
                label: 'Mat khau',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Mat khau khong duoc de trong";
                  }
                  if (value.length < 6) {
                    return "Mat khau phai co it nhat 6 ky tu";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomPasswordField(
                controller: confirmPasswordController,
                label: 'Xac nhan mat khau',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nhap lai mat khau";
                  }
                  if (value != passwordController.text) {
                    return "Mat khau khong khop";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: register,
                child: const Text('Dang ky'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
