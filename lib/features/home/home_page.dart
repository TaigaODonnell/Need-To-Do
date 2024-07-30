import 'package:flutter/material.dart';
import 'package:need_to_do/core/viewmodels/user_provider.dart';
import 'package:need_to_do/features/addingTaskShared/view/add_custom_task.dart';
import 'package:need_to_do/features/addingTaskShared/viewmodel/task_viewmodel.dart';
import 'package:need_to_do/features/auth/view/welcome_page.dart';
import 'package:need_to_do/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final authViewModel = Provider.of<AuthViewmodel>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AddCustomTask(),
                      ),
                    ),
                child: const Text("Add Custom Task")),
            const SizedBox(height: 20),
            Text("user: ${userProvider.user?.name}"),
            const SizedBox(height: 20),
            if (userProvider.tasks != null && userProvider.tasks!.isNotEmpty)
              Text("tasks: ${userProvider.tasks![0].title}")
            else
              const Text("No tasks available"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authViewModel.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              },
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
