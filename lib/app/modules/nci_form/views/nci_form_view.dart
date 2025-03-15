import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nci_form_controller.dart';

class NciFormView extends GetView<NciFormController> {
  const NciFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NciFormView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NciFormView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
