import 'package:flutter/material.dart';
import 'package:need_to_do/core/viewmodels/user_provider.dart';
import 'package:need_to_do/core/widgets/textfield.dart';
import 'package:need_to_do/features/addingTaskShared/viewmodel/task_viewmodel.dart';
import 'package:provider/provider.dart';

class AddCustomTask extends StatefulWidget {
  const AddCustomTask({super.key});

  @override
  State<AddCustomTask> createState() => _AddCustomTaskState();
}

class _AddCustomTaskState extends State<AddCustomTask> {
  final _taskNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
    formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final taskViewModel = Provider.of<TaskViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Custom Task"),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Add Custom Task"),
              const SizedBox(height: 20),
              CustomField(
                  hintText: "Enter Task Name", controller: _taskNameController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await taskViewModel.addTask(_taskNameController.text,
                        userProvider.user!.uid, context);
                    print("Submitted");
                  }
                },
                child: const Text("Upload"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
