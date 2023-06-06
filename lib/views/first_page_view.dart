import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_application/bloc/bloc.dart';
import 'package:job_application/bloc/event.dart';
import 'package:job_application/bloc/state.dart';
import 'package:tuple/tuple.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('First screen'),
              ElevatedButton(onPressed: _onNextScreenPressed, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),child: Text("Next screen"))
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: BlocBuilder<ListBloc, ListStates>(
              builder: (context, state) {
                if (state is InitialListState) {
                  return _buildContent(context, []);
                }

                if (state is UpdateListState) {
                  return _buildContent(context, state.tupleList);
                }

                return Container();
              },
            ),
          ),
        ));
  }

  Widget _buildContent(BuildContext context, List<Tuple2> list) {
    var repeating = list.where((item) => item.item2);
    var corrects = list.where((item) => !item.item2);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*...List.generate(list.length,
              (index) => Text(list[index])),*/
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("New words: "),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(corrects.map((c) => c.item1).toList().join(', '))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Wrong words: "),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    repeating.map((c) => c.item1).toList().join(', '),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          TextFormField(
              controller: _textEditingController,
              validator: (value) => value == null || value.isEmpty
                  ? 'Write a new word'
                  : (alphaExp.hasMatch(value)
                      ? null
                      : 'Only Alphabets are allowed')),
          ElevatedButton(onPressed: _onSubmitPressed, child: Text('Store'))
        ],
      ),
    );
  }

  static final RegExp alphaExp = RegExp(
      r'^[a-zA-Z ]*$'); //Regex for english alphabet characters and whitespace

  void _onSubmitPressed() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      context
          .read<ListBloc>()
          .add(AddToList(_textEditingController.text.split(" ")));
      _textEditingController.clear();
    }
    //Navigator.of(context).pushNamed('/list');
    //var a = (context.read<ListBloc>().list);
    //print(a.toString());
  }

  _onNextScreenPressed() {
    Navigator.of(context).pushNamed('/list');
  }
}
