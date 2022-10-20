import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../common/style.dart';
import '../../../../domain/entities/character.dart';

class ProfileCharacterContainer extends StatelessWidget {
  final String urlImage;
  final Detail detail;
  const ProfileCharacterContainer(
      {super.key, required this.urlImage, required this.detail});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.7,
              width: width,
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
                  fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text("Biography", style: subtitle),
            const SizedBox(height: 16),
            _bioCharacter(width),
          ],
        ),
      ),
    );
  }

  Widget _bioCharacter(double width) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _titleBio("Battlesuit Details", width),
            const SizedBox(height: 16),
            Text(detail.characterProfile.battlesuitDetail, style: bodyText2),
            const SizedBox(height: 16),
            _titleBio("Background Information", width),
            const SizedBox(height: 16),
            _backgroundInformation(),
          ],
        ),
      ),
    );
  }

  _titleBio(String title, double width) {
    return Container(
      height: 30,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        title,
        style: bodyText2.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _backgroundInformation() {
    return Column(
      children: [
        _itemBackgroundInformation(
            info1: "Date of Birth",
            info2: detail.characterProfile.dateBirth,
            color: Colors.grey.shade600),
        const SizedBox(height: 8),
        _itemBackgroundInformation(
            info1: "Gender",
            info2: detail.characterProfile.gender,
            color: Colors.grey.shade600),
        const SizedBox(height: 8),
        _itemBackgroundInformation(
            info1: "Organization",
            info2: detail.characterProfile.organization,
            color: Colors.grey.shade600),
        const SizedBox(height: 8),
        _itemBackgroundInformation(
            info1: "Height",
            info2: detail.characterProfile.height,
            color: Colors.grey.shade600),
        const SizedBox(height: 8),
        _itemBackgroundInformation(
            info1: "Weight",
            info2: detail.characterProfile.weight,
            color: Colors.grey.shade600),
        const SizedBox(height: 8),
        _itemBackgroundInformation(
            info1: "Birthplace",
            info2: detail.characterProfile.birthplace,
            color: Colors.grey.shade600),
      ],
    );
  }

  Widget _itemBackgroundInformation(
      {required String info1, required String info2, required Color color}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(info1, style: bodyText2),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                info2,
                style: bodyText2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
