import 'package:mobx/mobx.dart';

part 'ask_user_button_store.g.dart';

class AskUserButtonStore = AskUserButtonBase with _$AskUserButtonStore;

abstract class AskUserButtonBase with Store {
  @observable
  bool isPressed = true;

  @action
  void changeIsPressed() {
    isPressed = !isPressed;
  }
}
