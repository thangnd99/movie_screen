import 'package:flutter/material.dart';
import 'package:movie_screen/presentation/base/view_model_base.dart';

import '../component/loading_dialog.dart';

mixin ViewInterFace {
  /// buildBody
  Widget buildBody(BuildContext context);

  /// buildAppBar
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  /// buildBottomNavigationBar
  Widget? buildBottomNavigationBar(BuildContext context) {
    return null;
  }

  /// buildBottomSheet
  Widget? buildBottomSheet(BuildContext context) {
    return null;
  }

  /// buildDrawer
  Widget? buildDrawer(BuildContext context) {
    return null;
  }

  /// buildEndDrawer
  Widget? buildEndDrawer(BuildContext context) {
    return null;
  }

  /// buildFloatActionButton
  Widget? buildFloatActionButton(BuildContext context) {
    return null;
  }

  void _clearFocus(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  /// buildPage
  Widget buildPage(BuildContext context, ViewModelBase viewModel) {
    return Scaffold(
      backgroundColor: viewModel.scaffoldBackgroundColor.value,
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            _clearFocus(context);
          },
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Visibility(
                  visible: viewModel.status.value != Status.loading,
                  child: buildBody(context),
                ),
                Visibility(
                  child: const LoadingDialog(),
                  visible: viewModel.status.value == Status.loading,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
      bottomSheet: buildBottomSheet(context),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      floatingActionButton: buildFloatActionButton(context),
    );
  }
}
