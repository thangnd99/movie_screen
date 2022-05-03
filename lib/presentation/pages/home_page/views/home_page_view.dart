import 'package:flutter/material.dart';
import 'package:movie_screen/presentation/base/stateful_view_base.dart';
import 'package:movie_screen/presentation/pages/home_page/home_page_view_model.dart';
import 'package:movie_screen/presentation/pages/home_page/views/movie_item.dart';

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
      elevation: 0,
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
    var size = MediaQuery.of(context).size;

    final double itemHeight = size.height;
    final double itemWidth = size.width * 1.49;
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: GridView.count(
              controller: viewModel.scrollController,
              crossAxisCount: 2,
              childAspectRatio: (itemWidth / itemHeight),
              children: viewModel.listMovie
                  .map((element) => MovieItem(
                        infoMovieModel: element,
                      ))
                  .toList(),
            ),
          ),
        ),
        Visibility(
          visible: viewModel.isLoadMoreMovie.value,
          child: const LinearProgressIndicator(),
        ),
      ],
    );
  }
}
