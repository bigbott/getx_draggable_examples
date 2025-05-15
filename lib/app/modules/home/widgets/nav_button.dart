import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavButton extends StatelessWidget {
  final String route;
  final String label;

  const NavButton({super.key, required this.route, required this.label});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      sizeStyle: CupertinoButtonSize.medium,
      onPressed: () {
        Get.toNamed(route);
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
