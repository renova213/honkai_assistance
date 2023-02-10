import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MenuDatabase extends Equatable {
  final String title;
  final String assetImage;
  final Widget widget;

  const MenuDatabase(
      {required this.title, required this.assetImage, required this.widget});

  @override
  List<Object> get props => [title, assetImage, widget];
}
