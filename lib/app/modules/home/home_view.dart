import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_draggable_examples/app/modules/home/widgets/nav_button.dart';
import 'package:getx_draggable_examples/app/routes/app_pages.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
             NavButton(route: Routes.OFFICIAL, label: 'OFFICIAL_EXAMPLE'),
            NavButton(route: Routes.REORDABLE_LIST, label: 'REORDERABLE_LIST'),
            NavButton(route: Routes.TASK_BOARD, label: 'TASK_BOARD'),
            NavButton(route: Routes.PUZZLE_GAME, label: 'PUZZLE_GAME'),
          ],
        ),
      ),
    );
  }
}
