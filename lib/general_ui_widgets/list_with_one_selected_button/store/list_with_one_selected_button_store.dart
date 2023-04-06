import 'package:mobx/mobx.dart';

part 'list_with_one_selected_button_store.g.dart';

class ListWithOneSelectedButtonStore = ListWithOneSelectedButtonBase
    with _$ListWithOneSelectedButtonStore;

abstract class ListWithOneSelectedButtonBase with Store {
  @observable
  int selectedButtonIndex = 0;

  @action
  void changeSelectedButtonIndex(int index) {
    selectedButtonIndex = index;
  }
}
