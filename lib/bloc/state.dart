class ListStates {}
class InitialListState extends ListStates{}
class UpdateListState extends ListStates{
  final List<String> list;
  UpdateListState(this.list);
}