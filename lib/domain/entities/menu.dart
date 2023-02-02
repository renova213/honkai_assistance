import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  final String menu;
  final String assetImage;

  const Menu({required this.menu, required this.assetImage});

  @override
  List<Object> get props => [menu, assetImage];
}
