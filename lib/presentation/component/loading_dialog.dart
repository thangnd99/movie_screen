import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant/text_constant.dart';

/// LoadingDialog
class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Text(
                    TextConstants.loading,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                CupertinoActivityIndicator(
                  radius: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
