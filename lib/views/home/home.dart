import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_heros_test/config/constants.dart';
import 'package:data_heros_test/controllers/branch/branch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: AutoSizeText('الفروع'),
        ),
        body: GetX<BranchController>(
            init: BranchController(),
            builder: (controller) {
              return controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40.0,
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: (() {
                                            Get.toNamed('create');
                                          }),
                                          child: CrudButton(Icons.add)),
                                      SizedBox(width: 5),
                                      CrudButton(Icons.save),
                                      SizedBox(width: 5),
                                      CrudButton(Icons.edit),
                                      SizedBox(width: 5),
                                      GestureDetector(
                                          onTap: () {
                                            controller.removeBranch(
                                                controller.branches.first);
                                          },
                                          child: CrudButton(Icons.delete)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.paginateFirst();
                                        },
                                        child: CrudButton(
                                            Icons.keyboard_double_arrow_right),
                                      ),
                                      SizedBox(width: 5),
                                      GestureDetector(
                                          onTap: () {
                                            controller.paginateMinus1();
                                          },
                                          child:
                                              CrudButton(Icons.arrow_back_ios)),
                                      SizedBox(width: 5),
                                      Container(
                                        width: width * 0.035,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.blue,
                                            width: 2,
                                          ),
                                        ),
                                        child: Text(controller.page.toString()),
                                      ),
                                      SizedBox(width: 5),
                                      GestureDetector(
                                          onTap: () {
                                            controller.paginatePlus1();
                                          },
                                          child: CrudButton(
                                              Icons.arrow_forward_ios)),
                                      SizedBox(width: 5),
                                      CrudButton(
                                          Icons.keyboard_double_arrow_left),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  'اسم الفرع : ' + controller.branchName.value,
                                  style: textStyle2,
                                ),
                                Text(
                                  'الرمز : ' + controller.code.value,
                                  style: textStyle2,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ' الاسم الاجنبي : ' +
                                      controller.branchForiegnName.value,
                                  style: textStyle2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
            }));
  }

  Widget CrudButton(IconData icon) {
    return Container(
      width: Get.width * 0.035,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.green,
          size: Get.width * 0.020,
        ),
      ),
    );
  }
}
