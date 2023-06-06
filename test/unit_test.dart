import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_application/bloc/bloc.dart';
import 'package:job_application/bloc/event.dart';
import 'package:job_application/bloc/state.dart';
import 'package:job_application/utils/util.dart';
import 'package:tuple/tuple.dart';

class MockListBloc extends MockBloc<ListEvent, ListStates>
    implements ListBloc {}

void main(){
  setUp(() async {

  });

  tearDown(() async {
  });

  group("Test utils", () {
    test('Test empty input', () {
      String? result = Util.validation("");
      String? resultNull = Util.validation(null);
      expect(result, "Write a new word");
      expect(resultNull, "Write a new word");
    });

    test('Test non alphabetic input', () {
      String? result = Util.validation("123#");
      expect(result, "Only Alphabets are allowed");
    });

    test('Test too long input', () {
      String? result = Util.validation("dasjdkasndjsadksadsakdsakdjsakdsakdsandsjdsakndjsakdsadsakdsakdsakdsadsakdsakdsakdsakdsakdsakdsakd");
      expect(result, "One of the words is too long");
    });

    test('Test not valid input', () {
      String? result = Util.validation("xxssqq");
      expect(result, "One of the words is not valid");
    });
  });

  blocTest<ListBloc, ListStates>(
    'Bloc starts in initState state [0]',
    build: () => ListBloc(),
    expect: () => [],
    verify: (bloc) {
      expect(bloc.state, InitialListState());
    },
  );

  blocTest<ListBloc, ListStates>(
    'AddToList event add an item to the list, sends success state [1]',
    build: () => ListBloc(),
    act: (bloc) => bloc.add(AddToList(['test'])),
    verify: (bloc) {
      expect(bloc.state, UpdateListState(['test'], [Tuple2('test', false)]));
    },

  );
}
