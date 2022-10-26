import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/responsive_layout.dart';

import '../../../../common/style.dart';

class RerollGuidePage extends StatelessWidget {
  const RerollGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text("Reroll Guide", style: headline6),
                    const SizedBox(height: 8),
                    _titleContainer("Should You Consider Rerolling?"),
                    const SizedBox(height: 16),
                    Text(
                        '''Before you do reroll, is it worth for your time? because rerolling in honkai takes quite a bit of time investment to it, if it's worth, you good. However, anyone who excels at math to the point where they're able to do additions will understand that rerolling is 100% worth it, that is to say not everyone can figure out its value.
              
Having a more powerful valk allows you to keep earning more crystals every week than you otherwise could. Now that you understand that rerolling is worth it, here's how to do it:''',
                        style: bodyText2),
                    const SizedBox(height: 8),
                    _customWidget(
                        text: "1. Create New Account",
                        text2:
                            "Some games have an account delete feature, but honkai impact doesn't have that, so you are required to create an account with a new email to continue the reroll session if your previous reroll didn't work as expected.",
                        urlImage: "https://i.ibb.co/HBvxTKM/1.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _customWidget(
                        text: "2. Clear Tutorial",
                        text2:
                            "After create an account, you need to clear tutorial with ai-chan, this tutorial can't be skip, it takes time around 20 minutes",
                        urlImage: "https://i.ibb.co/mTX4R9W/2.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _customWidget(
                        text: "3. Clear Chapter 1 & 2",
                        text2:
                            "rush through chapter 1 and 2 to become level 20, which will take an hour if you're really good at it and you're not because you're new, then you get the most important achievements that give crys such as the ''grinder'' achievement that requires you to level up the 3 starter valks + their skills.",
                        urlImage: "https://i.ibb.co/MMvsPB6/4.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _customWidget(
                        text: "4. Gacha Time!",
                        text2:
                            "You should have at least 2800, but maybe like 3200, and you use it all to pull the starter supply to get Herrscher of Flamescion (DPS Fire), Herrscher of Sentience (Support Physical/Can be DPS), or any current banner",
                        urlImage: "https://i.ibb.co/58tDD5Y/3.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _titleContainer("Conclusion"),
                    const SizedBox(height: 16),
                    Text(
                        "Rerolling might take a lot of time if you're unlucky, but spending 3 months to farm up the crys takes a lot longer. Nothing to it but to grind it out.",
                        style: bodyText2),
                    const SizedBox(height: 16),
                  ],
                ),
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
