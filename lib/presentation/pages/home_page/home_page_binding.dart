import 'package:get/get.dart';
import 'package:movie_screen/domain/repository/home_page_repository.dart';
import 'package:movie_screen/presentation/pages/home_page/home_page_view_model.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<HomePageRepository>(() => HomePageRepository())
      ..lazyPut<HomePageViewModel>(
          () => HomePageViewModel(homePageRepository: Get.find()));
  }
}
