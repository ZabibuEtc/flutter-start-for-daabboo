import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/data/models/user.model.dart';
import 'package:flutter_app_architecture/domain/user.provider.dart';
import 'package:flutter_app_architecture/presentation/widgets/input_field.widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateUserScreen extends ConsumerWidget {
  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userService = ref.watch(userServiceProvider);

    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Créer un compte')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputFieldWidget(
              placeholder: 'Fullname',
              controller: fullNameController,
            ),
            InputFieldWidget(
              placeholder: 'Email Address',
              controller: emailController,
            ),
            InputFieldWidget(
              placeholder: 'Password',
              controller: passwordController,
            ),
            ElevatedButton(
              onPressed: () async {
                // Récupérer les valeurs des champs de saisie
                final name = fullNameController.text;
                final email = emailController.text;
                final password = passwordController.text;

                // Créer un nouvel utilisateur
                await userService.createUser(User(
                  name: name,
                  email: email,
                  password: password,
                ));

                // Naviguer vers une autre page
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
              child: const Text('Créer'),
            ),
          ],
        ),
      ),
    );
  }
}
