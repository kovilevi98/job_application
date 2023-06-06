import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job_application/bloc/bloc.dart';
import 'package:job_application/bloc/event.dart';
import 'package:job_application/bloc/state.dart';

import 'package:job_application/main.dart';
import 'package:job_application/views/first_page_view.dart';
import 'package:mocktail/mocktail.dart';

class MockListBloc extends MockBloc<ListEvent, ListStates>
    implements ListBloc {}

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);
  });

  /*testWidgets('AutoLoginEvent is added to BLoC [1]', (tester) async {
    var bloc = MockListBloc();
    whenListen(bloc, const Stream<ListStates>.empty(),
        initialState: InitialListState());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<ListBloc>.value(
          value: bloc,
          child: const FirstPage(),
        ),
      ),
    );

    await tester.enterText(find.byType(TextFormField).first, 'test');
    await tester.tap(find.bySubtype<ButtonStyleButton>());
    await tester.pumpAndSettle();

    verify(() => bloc.add(AddToList('test')));
  });*/
}
