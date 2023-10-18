import 'package:flutter/material.dart';

extension StateNavigatorExt on State {
  Future<void> push(Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

  Future<void> pushAndPopBack(Widget screen) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => screen),
        (route) => false,
      );
}

extension StatelessNavigatorExt on StatelessWidget {
  Future<void> push(BuildContext context, Widget screen) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));

  Future<void> pushAndPopBack(BuildContext context, Widget screen) =>
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => screen),
        (route) => false,
      );
}
