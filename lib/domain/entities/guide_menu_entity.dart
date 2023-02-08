import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class GuideMenuEntity extends Equatable {
  final String title;
  final String urlImage;
  final Widget screen;

  const GuideMenuEntity(
      {required this.title, required this.urlImage, required this.screen});
  @override
  List<Object> get props => [title, urlImage, screen];
}
