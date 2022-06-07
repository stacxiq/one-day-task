import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_heros_test/controllers/branch/create_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateView extends StatelessWidget {
  late CreateController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put<CreateController>(CreateController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: AutoSizeText('الفروع'),
        ),
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TextFormField(
                  controller: controller.nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'الرجاء إدخال اسم الفرع';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(12),
                    labelText: 'اسم الفرع',
                  )),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controller.codeController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الرجاء إدخال رمز الفرع';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                  labelText: 'الرمز',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: controller.foriegn_nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الرجاء إدخال اسم الفرع باللغة الأجنبية';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(12),
                  labelText: 'الاسم الاجنبي',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.create();
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, fixedSize: Size(250, 30)),
                icon: Icon(Icons.save),
                label: Text('اضافة'),
              ),
            ]),
          ),
        ));
  }
}
