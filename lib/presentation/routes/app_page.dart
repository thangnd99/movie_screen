import 'package:get/get.dart';
import 'package:movie_screen/presentation/pages/home_page/home_page_binding.dart';
import 'package:movie_screen/presentation/pages/home_page/views/home_page_view.dart';

part 'app_routes.dart';

class AppPage {
  AppPage._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
  ];
}
