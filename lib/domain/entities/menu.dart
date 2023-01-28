import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  final String menu;
  final String urlImage;

  const Menu({required this.menu, required this.urlImage});

  @override
  List<Object> get props => [menu, urlImage];
}
