import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_employeee_controller.dart';

class NewEmployeeeView extends GetView<NewEmployeeeController> {
  const NewEmployeeeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewEmployeeeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewEmployeeeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
