import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

@immutable
abstract class ListStates extends Equatable {
  @override
  List<Object?> get props => [];
}

@immutable
class InitialListState extends ListStates {
  @override
  List<Object?> get props => [];
}

@immutable
class UpdateListState extends ListStates {
  final List<Tuple2> tupleList;
  final List<String> list;

  UpdateListState(this.list, this.tupleList);

  @override
  List<Object?> get props => [list, tupleList];
}
