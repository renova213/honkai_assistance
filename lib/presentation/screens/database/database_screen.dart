import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/provider/local/database_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/style/style.dart';
import 'child/list_database_menu.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => Provider.of<DatabaseProvider>(context, listen: false)
        .getMenuDatabase());
  }

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
          ],
        ),
      ),
    );
  }
}
