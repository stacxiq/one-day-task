import 'package:data_heros_test/model/request/branch_request.dart';
import 'package:data_heros_test/repositories/branch_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController foriegn_nameController = TextEditingController();

  Future<void> create() async {
    var response = await branchRepository.saveBranches(BranchRequest(
        code: codeController.text,
        name: nameController.text,
        foreign_name: foriegn_nameController.text));
    if (response != null) {
      print(response.data);

      if (response.statusCode == 200) {
        print('success');
        Get.back();
      } else {
        Get.snackbar('Error', 'Something went wrong',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }
}
