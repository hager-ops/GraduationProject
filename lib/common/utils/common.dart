import 'package:flutter/cupertino.dart';

Future<T?> pushMaterialPage<T>(
  BuildContext context,
  Widget page, {
  bool rootNavigator = true,
  RouteSettings? settings,
  bool fullscreenDialog = false,
}) {
  return Navigator.of(context, rootNavigator: rootNavigator).push(
      CupertinoPageRoute(
          builder: (context) => page,
          settings: settings,
          fullscreenDialog: fullscreenDialog));
}

Future<T?> navigateRemoveReplacement<T>(
  BuildContext context,
  Widget page, {
  bool rootNavigator = true,
  RouteSettings? settings,
  bool fullscreenDialog = false,
}) {
  Navigator.of(context).popUntil((route) => route.isFirst);
  return Navigator.of(context, rootNavigator: rootNavigator).pushReplacement(
      CupertinoPageRoute(
          builder: (context) => page,
          settings: settings,
          fullscreenDialog: fullscreenDialog));
}
