import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/style.dart';
import 'child/list_database_menu.dart';

class DatabaseScreen extends StatelessWidget {
  const DatabaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Database", style: AppFont.headline6),
            SizedBox(height: 24.h),
            const ListDatabaseMenu(),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}
