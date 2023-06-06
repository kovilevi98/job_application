import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application/bloc/event.dart';
import 'package:job_application/bloc/state.dart';
import 'package:tuple/tuple.dart';


class ListBloc extends Bloc<ListEvent, ListStates> {
  List<String> list = List.of([]);
  List<Tuple2> feedBackList = List.of([]);

  ListBloc() : super(InitialListState()) {
    on<AddToList>(addToList);
  }
  
  void addToList(AddToList event, Emitter<ListStates> emit) async {
    var listWithoutDuplicates = event.list.toSet().toList();
    var shouldAdd = listWithoutDuplicates.where((item) => !list.contains(item));
    var repeating = listWithoutDuplicates.where((item) => list.contains(item));

    feedBackList = [];
    for (var element in repeating) {
        feedBackList.add(Tuple2(element, true));
    }

    for (var element in shouldAdd) {
      feedBackList.add(Tuple2(element, false));
    }

    list = [...list];
    list.addAll(shouldAdd);

    emit(UpdateListState(list, feedBackList));
  }

}

