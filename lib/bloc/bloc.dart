import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application/bloc/event.dart';
import 'package:job_application/bloc/state.dart';


class ListBloc extends Bloc<ListEvent, ListStates> {
  List<String> list = List.of([]);

  ListBloc() : super(InitialListState()) {
    on<AddToList>(addToList);
  }
  
  void addToList(AddToList event, Emitter<ListStates> emit) async {
    list.add(event.text);
    emit(UpdateListState(list));
  }

}
