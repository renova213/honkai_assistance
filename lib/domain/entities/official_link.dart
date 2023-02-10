import 'package:equatable/equatable.dart';

class OfficialLink extends Equatable {
  final String platform;
  final String assetIcon;
  final String url;

  const OfficialLink(
      {required this.platform, required this.assetIcon, required this.url});

  @override
  List<Object> get props => [platform, assetIcon, url];
}
