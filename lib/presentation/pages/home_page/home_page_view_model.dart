import 'package:movie_screen/domain/repository/home_page_repository.dart';
import 'package:movie_screen/presentation/base/view_model_base.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/info_movie_model/info_movie_model.dart';
import '../../../domain/model/info_movie_model/info_movie_response_model.dart';

class HomePageViewModel extends ViewModelBase {
  HomePageViewModel({required this.homePageRepository});

  final HomePageRepository homePageRepository;

  ScrollController scrollController = ScrollController();

  final listMovie = <InfoMovieModel>[].obs;

  final infoMovieResponseModel = InfoMovieResponseModel().obs;

  final isLoadMoreMovie = false.obs;

  int _page = 1;

  @override
  void onInit() async {
    await fetchListMovie();
    scrollController.addListener(() async {
      if (scrollController.position.pixels < -100) {
        await Future.delayed(const Duration(milliseconds: 500));
        await fetchListMovie();
      } else {
        await loadMoreMovie();
      }
    });
    super.onInit();
  }

  Future<void> fetchListMovie() async {
    status.value = Status.loading;
    _page = 1;
    await homePageRepository.getListMovie(page: _page).then((value) {
      infoMovieResponseModel.value = value;
      listMovie
        ..clear()
        ..addAll(infoMovieResponseModel.value.results ?? []);
    });
    status.value = Status.success;
  }

  Future<void> loadMoreMovie() async {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels &&
        _page < infoMovieResponseModel.value.totalPages!) {
      _page++;
      isLoadMoreMovie.value = true;
      await homePageRepository.getListMovie(page: _page).then((value) {
        listMovie.addAll(value.results ?? []);
        listMovie.refresh();
      });
      isLoadMoreMovie.value = false;
    }
  }
}
