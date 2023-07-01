import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/presentation/provider/navbar_provider.dart';

void main() {
  test('should update the index header', () {
    const newIndex = 1;
    final provider = NavbarProvider();

    provider.changeIndex(newIndex);

    expect(provider.currentIndex, newIndex);
  });
}
