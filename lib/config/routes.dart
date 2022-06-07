import 'package:data_heros_test/views/create/create.dart';
import 'package:data_heros_test/views/detail/detail.dart';
import 'package:data_heros_test/views/home/home.dart';
import 'package:get/get.dart';


appRoutes() => [
      GetPage(
        name: '/home',
        page: () => HomeView(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/detail',
        page: () => DetailView(),
        middlewares: [MyMiddelware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/create',
        page: () => CreateView(),
        middlewares: [MyMiddelware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}