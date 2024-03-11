import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: controller.obx(
        (state) => ListView.separated(
          itemBuilder: (context, index) {
            final user = state![index];
            return Card(
              child: ListTile(
                title: Text(user.name),
                leading: Text(user.id.toString()),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: state?.length ?? 0,
        ),
        onEmpty: const Text('Nenhum dado'),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) => Text(error ?? 'Erro'),
      ),
    );
  }
}
