import 'package:flutter/material.dart';
import 'package:movie_screen/presentation/base/stateful_view_base.dart';
import 'package:movie_screen/presentation/pages/home_page/home_page_view_model.dart';

class HomePageView extends StatefulViewBase {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends ViewState<HomePageView, HomePageViewModel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text(
        'Popular List',
        style: TextStyle(
          fontSize: 16,
          color: Colors.green,
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return GridView(
      controller: viewModel.scrollController,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
