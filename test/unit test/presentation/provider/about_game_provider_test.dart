import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/presentation/provider/about_game_provider.dart';

void main() {
  test('should update the index header', () {
    const newIndex = 1;
    final provider = AboutGameProvider();

    provider.changeIndexHeader(newIndex);

    expect(provider.indexHeader, newIndex);
  });
}
