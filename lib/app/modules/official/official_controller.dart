import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfficialController extends GetxController {
  int _acceptedData = 0;
  get acceptedData => _acceptedData;
  set acceptedData(value) {
    _acceptedData = value;
    update();
  }

  bool _isDragging = false;
  get isDragging => _isDragging;

  Offset _position = Offset(0, 0);
  get position => _position;

  void onDragStarted() {
    _isDragging = true;
    Get.snackbar('onDragStart', '', duration: Duration(seconds: 1));
  }

  void onDragUpdate(DragUpdateDetails details) {
    _position = details.globalPosition;
    update();
  }

  void onDragEnd(DraggableDetails details) {
    _isDragging = false;
    Get.snackbar('onDragEnd', 'wasAccepted: ${details.wasAccepted}',
        duration: Duration(seconds: 1));
    update();
  }

  void onDragCompleted() {
    _isDragging = false;
    Get.snackbar('onDragComplete', '', duration: Duration(seconds: 1));
  }

  void onAcceptWithDetails(DragTargetDetails<int> details) {
    acceptedData += details.data;
    Get.snackbar('onAcceptWithDetails', 'data:${details.data}', duration: Duration(seconds: 1));
  }
}
