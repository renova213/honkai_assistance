import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/database_provider.dart';
import '../../../widgets/menu_item_container.dart';

class ListDatabaseMenu extends StatelessWidget {
  const ListDatabaseMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, notifier, _) => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final data = notifier.menuDatabases[index];

          return MenuItemContainer(
              assetImage: data.assetImage,
              title: data.title,
              screen: data.widget);
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: notifier.menuDatabases.length,
      ),
    );
  }
}
