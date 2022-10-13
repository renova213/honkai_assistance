import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:provider/provider.dart';

import '../../providers/header_provider.dart';

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<HeaderProvider>(
      builder: (context, header, _) => SingleChildScrollView(
        child: AnimatedContainer(
            curve: Curves.easeInOut,
            color: Colors.black,
            width: header.isExpand ? width * 0.8 : 0,
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
                              padding: EdgeInsets.only(left: width * 0.03),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: header.listMenu[index] ==
                                        header.listMenu.last
                                    ? const BoxDecoration()
                                    : const BoxDecoration(
                                        border: Border(
                                          bottom:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                height: 50,
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.score,
                                        color: Colors.white),
                                    const SizedBox(width: 8),
                                    Text(
                                      header.listMenu[index].menu,
                                      style: headline6,
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
            )),
      ),
    );
  }
}
