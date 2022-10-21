import 'package:flutter/material.dart';

import '../../../common/style.dart';
import '../../../domain/entities/character.dart';

class EquipmentCharacterContainer extends StatelessWidget {
  final Detail detail;
  const EquipmentCharacterContainer({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleContainer("Recommended Weapon", width),
                  const SizedBox(height: 16),
                  _listWeapon(width: width, context: context),
                  const SizedBox(height: 16),
                  _titleContainer("Recommended Stigmata", width),
                  const SizedBox(height: 16),
                  _listStigmata(width: width, context: context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _titleContainer(String title, double width) {
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

  Widget _customContainer(
      {required String rank,
      required String nameItem,
      required int indexColor,
      required double width,
      required String urlImage,
      required BuildContext context}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color:
                  indexColor.isEven ? Colors.grey.shade700 : Colors.transparent,
              border: Border.all(color: Colors.grey.shade600),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                rank,
                style: bodyText2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color:
                  indexColor.isEven ? Colors.grey.shade700 : Colors.transparent,
              border: Border.all(color: Colors.grey.shade600),
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TextButton(
                  onPressed: () {
                    _bottomSheet(
                        context: context, urlImage: urlImage, width: width);
                  },
                  child: Text(
                    nameItem,
                    style: bodyText2.copyWith(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _listWeapon({required double width, required BuildContext context}) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: detail.characterEquipment.weapons.length,
      itemBuilder: (context, index) {
        final data = detail.characterEquipment.weapons[index];
        return _customContainer(
            urlImage: data.urlImage,
            rank: data.rank,
            nameItem: data.nameWeapon,
            indexColor: index,
            width: width,
            context: context);
      },
    );
  }

  Widget _listStigmata({required double width, required BuildContext context}) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: detail.characterEquipment.stigmatas.length,
      itemBuilder: (context, index) {
        final data = detail.characterEquipment.stigmatas[index];
        return _customContainer(
            urlImage: data.urlImage,
            rank: data.rank,
            nameItem: data.nameStigmata,
            indexColor: index,
            width: width,
            context: context);
      },
    );
  }

  void _bottomSheet(
      {required BuildContext context,
      required String urlImage,
      required double width}) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              urlImage,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
