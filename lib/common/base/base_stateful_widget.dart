import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

abstract class BaseStatefulWidget<T extends StatefulWidget> extends State<T> {
  ThemeData get theme => Theme.of(context);
  TextTheme get textTheme => Theme.of(context).textTheme;
  Size get device => MediaQuery.of(context).size;
  EdgeInsets get padding => MediaQuery.of(context).padding;
  //S get l10n => S.of(context);

  void showLoading() {
    if (!context.loaderOverlay.visible) {
      context.loaderOverlay.show();
    }
  }

  void hideLoading() {
    if (context.loaderOverlay.visible) {
      context.loaderOverlay.hide();
    }
  }
}
