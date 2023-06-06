abstract class ListEvent {}
class AddToList extends ListEvent {
  String text;
  AddToList(this.text);
}