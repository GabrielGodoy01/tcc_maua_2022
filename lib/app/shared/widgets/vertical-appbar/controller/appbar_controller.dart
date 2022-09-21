import 'package:mobx/mobx.dart';

part 'appbar_controller.g.dart';

class AppbarController = AppbarControllerBase with _$AppbarController;

abstract class AppbarControllerBase with Store {
  @observable
  int indexToShow = 0;

  @action
  Future<void> toggleIndex(index) async {
    indexToShow = index;
  }
}
