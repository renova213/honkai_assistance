import 'package:equatable/equatable.dart';

class Glossary extends Equatable {
  final String title;
  final String descirption;

  const Glossary({required this.title, required this.descirption});

  @override
  List<Object> get props => [];
}
