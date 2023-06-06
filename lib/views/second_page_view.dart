import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application/bloc/bloc.dart';
import 'package:job_application/bloc/event.dart';
import 'package:job_application/bloc/state.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Text Change'),
        ),
        body: Center(
          child: BlocBuilder<ListBloc, ListStates>(
            builder: (context, state) {
              if (state is InitialListState) {
                return _buildContent(context, []);
              }

              if (state is UpdateListState) {
                return _buildContent(context, state.list);
              }

              return Container();
            },
          ),
        ));
  }

  Widget _buildContent(BuildContext context, List<String> list) {
    int total = 0;

    for (var element in list) {
      total += element.length;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your current point is: $total',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                        list.length,
                        (index) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text("${list[index]} ${list[index].length}"),
                            )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
