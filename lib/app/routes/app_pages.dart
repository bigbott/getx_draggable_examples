import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/official/official_binding.dart';
import '../modules/official/official_view.dart';
import '../modules/puzzle_game/puzzle_game_binding.dart';
import '../modules/puzzle_game/puzzle_game_view.dart';
import '../modules/reordable_list/reorderable_list_binding.dart';
import '../modules/reordable_list/reorderable_list_view.dart';
import '../modules/task_board/task_board_binding.dart';
import '../modules/task_board/task_board_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REORDABLE_LIST,
      page: () => const ReordableListView(),
      binding: ReordableListBinding(),
    ),
    GetPage(
      name: _Paths.TASK_BOARD,
      page: () => const TaskBoardView(),
      binding: TaskBoardBinding(),
    ),
    GetPage(
      name: _Paths.PUZZLE_GAME,
      page: () => const PuzzleGameView(),
      binding: PuzzleGameBinding(),
    ),
    GetPage(
      name: _Paths.OFFICIAL,
      page: () => const OfficialView(),
      binding: OfficialBinding(),
    ),
  ];
}
