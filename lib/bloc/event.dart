import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ListEvent extends Equatable {}

class AddToList extends ListEvent {
  final List<String> list;
  AddToList(this.list);

  @override
  List<Object?> get props => [list];
}
