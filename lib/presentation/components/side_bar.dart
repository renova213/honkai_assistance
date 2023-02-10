import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common/style/style.dart';
import '../provider/button/sidebar_button_provider.dart';
import '../provider/local/sidebar_provider.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() =>
        Provider.of<SidebarProvider>(context, listen: false).getSidebarMenu());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<SidebarProvider>(
      builder: (context, sideBar, _) => Consumer<SidebarButtonProvider>(
        builder: (context, sideBarButton, _) => SingleChildScrollView(
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            color: Colors.black,
            width: sideBarButton.isExpand ? 275.w : 0,
            duration: const Duration(milliseconds: 200),
            child: Column(
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: sideBar.sidebarMenus.length,
                  itemBuilder: ((context, index) => InkWell(
                        onTap: () {
                          sideBarButton.indexPages(index);
                          sideBarButton.index(0);
                          sideBarButton.isExpanded(false);
                        },
                        child: Container(
                          color: sideBarButton.indexPage == index
                              ? Colors.grey.shade600
                              : Colors.black,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: sideBar.sidebarMenus[index] ==
                                        sideBar.sidebarMenus.last
                                    ? const BoxDecoration()
                                    : const BoxDecoration(
                                        border: Border(
                                          bottom:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                height: 45.h,
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                        sideBar.sidebarMenus[index].assetImage,
                                        width: 35.w,
                                        height: 30.h,
                                        fit: BoxFit.fill),
                                    SizedBox(width: 8.w),
                                    Text(
                                      sideBar.sidebarMenus[index].menu,
                                      style: AppFont.subtitle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
