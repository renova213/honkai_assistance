import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/presentation/widgets/header.dart';
import 'package:honkai_lab/presentation/widgets/menu_header.dart';
import 'package:honkai_lab/presentation/providers/header_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Tap back again to exit'),
        ),
        child: SafeArea(
          child: Container(
            color: Colors.black87,
            child: Consumer<HeaderProvider>(
              builder: (context, notifier, _) => GestureDetector(
                onTap: () {
                  notifier.isExpanded(false);
                  notifier.index(0);
                },
                child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Header(),
                        Stack(
                          children: [
                            notifier.pages[notifier.indexPage],
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                MenuHeader(),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
