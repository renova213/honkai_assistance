import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/responsive_layout.dart';

import '../../../../common/style.dart';

class CadetSenseiPage extends StatelessWidget {
  const CadetSenseiPage({super.key});

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
                  Text("Cadet-Sensei System", style: headline6),
                  const SizedBox(height: 8),
                  Text(
                      "Here you can link yourself up with more experienced captains who are able to guide you through your account progression and help you with anything that you're not sure of!.",
                      style: bodyText1),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "1. Cadet-Sensei Tasks",
                      text2:
                          "The system provides you with a list of tasks that upon completion, provide you with juicy rewards such as crystals and dorm supply tickets! Your sensei will get a sensei-currency, which is equally valuable, so it's a win-win for everyone :D.",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/eab406c41c79c4f19dc1e38caf1974e9_5069479155630635614.png?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,png",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "2. Q&A",
                      text2:
                          "''Ask and you shall receive''. If there's anything that you're not sure of, be-it game mechanics, gear investments or storyline stuff, don't be afraid to hit your sensei up! I'm sure your sensei would be glad to help, and y'all might even become friends! Honkai is so much more fun when there's friends around amirite?",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/971217ca1d737c7a055af271bb3cbf07_8300800293800786333.png?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,png",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "3. Revocation",
                      text2:
                          "A newly-formed Sensei-Cadet relationship cannot be revoked within the first 24 hours by either side. A Sensei who revokes cannot recruit Cadet(s) within the next 48 hours. The revoked Cadet will not be penalized. A Cadet who revokes cannot send applications to other Senseis within the next 48 hours. The revoked Sensei will not be penalized. If your Sensei or Cadet goes offline for more than 2 days, the relationship can be revoked without penalty. Once the relationship is revoked, you will not receive rewards for the current Examination Stage. A Cadet can resume their mentoring with another Sensei from the Examination Trial stage at revocation (but progress for that stage will be reset).",
                      urlImage: "https://i.ibb.co/7gCkKtz/Untitled.png",
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
