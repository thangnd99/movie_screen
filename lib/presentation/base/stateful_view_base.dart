import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:movie_screen/presentation/base/view_interface.dart';
import 'view_model_base.dart';

/// ViewState
abstract class ViewState<Page extends StatefulViewBase,
        ViewModel extends ViewModelBase>
    extends State<Page> // ignore: prefer_mixin
    with
        WidgetsBindingObserver, ViewInterFace {
  /// ViewState
  ViewState();

  /// globalKey
  final GlobalKey<State<StatefulWidget>> globalKey =
      GlobalKey<State<StatefulWidget>>();

  /// viewModel
  ViewModel get viewModel => GetInstance().find<ViewModel>();

  @mustCallSuper
  void initViewState() {}

  @mustCallSuper
  void didChangeViewDependencies() {}

  @override
  @mustCallSuper
  void didChangeDependencies() {
    didChangeViewDependencies();
    super.didChangeDependencies();
  }

  void onInActive() {}

  void onPaused() {}

  void onResumed() {}

  void onDetached() {}

  @override
  @nonVirtual
  void initState() {
    initViewState();
    viewModel
      ..listenConnectivityStatus()
      ..onInitView();

    viewModel.onError.listen(onError);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Obx(
          () => buildPage(context, viewModel),
        ),
        onWillPop: willPopCallBack);
  }

  /// willPopCallBack
  Future<bool> willPopCallBack() async {
    return true;
  }

  @override
  @mustCallSuper
  void dispose() {
    viewModel
      ..cancelConnectivitySubscription()
      ..onDisposeView();
    super.dispose();
  }

  /// onError
  void onError(Object error) {}
}

/// StatefulViewBase
abstract class StatefulViewBase extends StatefulWidget {
  /// StatefulViewBase constructor
  const StatefulViewBase({Key? key}) : super(key: key);
}
