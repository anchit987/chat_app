import 'package:chat_app/common/constants/size_constants.dart';
import 'package:chat_app/common/screen_util/screen_util.dart';
import 'package:flutter/material.dart';
import '../../../common/extensions/size_extension.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil.defaultWidth.toDouble(),
        height: Sizes.dimen_300.h,
        color: Colors.purple,
      )
    );
  }
}
