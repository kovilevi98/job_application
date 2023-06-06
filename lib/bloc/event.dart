import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

@immutable
abstract class ListEvent extends Equatable {}

class AddToList extends ListEvent {
  final List<String> list;
  AddToList(this.list);

  @override
  List<Object?> get props => [list];
}

class ChangeFeedbackEvent extends ListEvent {
  final List<Tuple2> list;
  ChangeFeedbackEvent(this.list);

  @override
  List<Object?> get props => [list];
}