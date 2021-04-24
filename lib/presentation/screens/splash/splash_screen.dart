import 'package:flutter/material.dart';

import '../../../common/constants/size_constants.dart';
import '../../../common/extensions/size_extension.dart';
import '../../../common/screen_util/screen_util.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
      child: const CircularProgressIndicator(),
    ));
  }
}
