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
                return _counter(context, []);
              }

              if(state is UpdateListState){
                return _counter(context, state.list);
              }

              return Container();
            },
          ),
        )
    );
  }


  Widget _counter(BuildContext context, List<String> list) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(context.read<ListBloc>().list.length, (index) => Text(context.read<ListBloc>().list[index])),
          TextFormField(),
          ElevatedButton(onPressed: (){
            context.read<ListBloc>().add(AddToList('dsa'));
          }, child: Text('Submit'))
        ],
      ),
    );
  }
}