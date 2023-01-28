import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/providers/custom_sidebar_provider.dart';
import 'package:honkai_assistance/presentation/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../../common/style/style.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<CustomSidebarProvider>(
      builder: (context, header, _) => SingleChildScrollView(
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          color: Colors.black,
          width: header.isExpand ? 275.w : 0,
          duration: const Duration(milliseconds: 200),
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: header.listMenu.length,
                itemBuilder: ((context, index) => InkWell(
                      onTap: () {
                        header.indexPages(index);
                        header.index(0);
                        header.isExpanded(false);
                      },
                      child: Container(
                        color: header.indexPage == index
                            ? Colors.grey.shade600
                            : Colors.black,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: header.listMenu[index] ==
                                      header.listMenu.last
                                  ? const BoxDecoration()
                                  : const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(color: Colors.white),
                                      ),
                                    ),
                              height: 45.h,
                              width: width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                      imageUrl: header.listMenu[index].urlImage,
                                      errorWidget: (context, url, error) {
                                        return const Center(
                                          child: Icon(Icons.error,
                                              color: AppColor.red),
                                        );
                                      },
                                      placeholder: (context, url) {
                                        return const Loading(
                                            width: 35,
                                            height: 30,
                                            borderRadius: 0);
                                      },
                                      width: 35.w,
                                      height: 30.h),
                                  SizedBox(width: 8.w),
                                  Text(
                                    header.listMenu[index].menu,
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
    );
  }
}
