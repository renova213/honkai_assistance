import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/responsive_layout.dart';

import '../../../../common/style.dart';

class ArmadaPage extends StatelessWidget {
  const ArmadaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87),
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text("Armada", style: headline6),
                  const SizedBox(height: 8),
                  Text(
                      "Armada is like a 'guild', where you can join a community of fellow Captains and help each other out!.",
                      style: bodyText1),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "1. Commissions",
                      text2:
                          "Commissions is an open-donation drive where you can donate items to fellow players to help them out. In exchange, you'll stand a chance to receive awesome rewards such as valk fragments Dorm Supply tickets!.",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/1ed7abcddf3bdd7ce3bb68ce8a9c2db5_1092358677945417011.png?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,png",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "2. Warehouse",
                      text2:
                          "To give, and to receive... Warehouse is where you get to request specific items from your fellow armada mates, and hopefully they'll fulfill your requests! Request items may vary from valkyrie fragments to upgrading and forging materials.",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/4a8790d9b9a7b8c8bb6c6d493accfa40_7558400299585427862.png?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,png",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "3. Sim Battle",
                      text2:
                          "Sim Battle allows you to experience the full capabilities of a whale, I mean of a fully geared team setup. Here you get to rekt bosses like you never could before, and get tempted to empty your wallets to get the good stuff! Very good indeed XD.",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/be0aaf94384ac828568f079989b4021c_6451173218978299791.png?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,png",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleContainer(String title) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(color: Colors.blue, width: 3),
            ),
          ),
          child: Text(title, style: subtitle),
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade700, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _customWidget(
      {required String text,
      required String text2,
      required String urlImage,
      required double width,
      required BuildContext context}) {
    return Column(
      children: [
        _titleContainer(text),
        const SizedBox(height: 16),
        Text(text2, style: bodyText2),
        const SizedBox(height: 16),
        SizedBox(
          height: ResponsiveLayout.isMobile(context) ? 150 : 200,
          width: width * 0.7,
          child: CachedNetworkImage(
            imageUrl: urlImage,
            errorWidget: (context, url, error) {
              return const Center(
                child: Icon(Icons.error, color: Colors.red),
              );
            },
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
