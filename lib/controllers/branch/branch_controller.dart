import 'package:data_heros_test/model/response/branch/branch.dart';
import 'package:data_heros_test/repositories/branch_repository.dart';
import 'package:get/get.dart';

class BranchController extends GetxController {
  RxInt page = 0.obs;
  RxInt perPage = 1.obs;
  RxBool isLoading = true.obs;
  RxBool reachToEnd = false.obs;
  RxString code = ''.obs;
  RxString branchName = ''.obs;
  RxString branchForiegnName = ''.obs;
  RxList<Branch> branches = <Branch>[].obs;

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  void paginatePlus1() {
    if (reachToEnd.value) return;
    page.value++;
    fetchApi();
  }

  void paginateMinus1() {
    if (page.value == 0) return;
    page.value--;
    fetchApi();
  }

  void paginateFirst() {
    page.value = 0;
    fetchApi();
  }

  fetchApi() async {
    isLoading.value = true;
    final response =
        await branchRepository.fetchBranches(page.value, perPage.value);
    if (response != null) {
      if (response.statusCode == 200) {
        print(response.data);
        branches.clear();
        if (response.data['data'].isNotEmpty) {
          for (var element in response.data['data']) {
            branches.add(Branch.fromJson(element));
          }
          code.value = branches.value.first.code!;
          branchName.value = branches.value.first.name!;
          branchForiegnName.value = branches.value.first.foreign_name!;
        } else {
          reachToEnd.value = true;
        }

        isLoading.value = false;
      } else {
        print(response.statusCode); // error
        isLoading.value = false;
      }
    }
  }

  removeBranch(Branch branch) async {
    isLoading.value = true;
    var response = await branchRepository.deleteBranch(branch.guide!);
    if (response != null) {
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'لقد تم حذف البيانات بنجاح',
            snackPosition: SnackPosition.BOTTOM);
        fetchApi();
      } else {
        print(response.statusCode); // error
        isLoading.value = false;
      }
    }
  }
}
