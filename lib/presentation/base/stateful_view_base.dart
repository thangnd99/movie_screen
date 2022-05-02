import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:movie_screen/presentation/base/view_interface.dart';
import 'view_model_base.dart';

/// StatefulViewBase
abstract class StatefulViewBase extends StatefulWidget {
  /// StatefulViewBase constructor
  const StatefulViewBase({Key? key}) : super(key: key);
}

/// ViewState
abstract class ViewState<Page extends StatefulViewBase,
        ViewModel extends ViewModelBase> extends State<Page>
    with WidgetsBindingObserver, ViewInterFace {
  /// ViewState
  ViewState();

  /// viewModel
  ViewModel get viewModel => GetInstance().find<ViewModel>();

  @override
  void initState() {
    viewModel
      ..listenConnectivityStatus()
      ..onInitView();

    viewModel.onError.listen(onError);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
    if (Navigator.of(context).userGestureInProgress) {
      return false;
    } else {
      return true;
    }
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
