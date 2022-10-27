import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../blocs/home/redeem_code_bloc/redeem_code_bloc.dart';

class RedeemCode extends StatelessWidget {
  const RedeemCode({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference data =
        FirebaseFirestore.instance.collection('character');
    final width = MediaQuery.of(context).size.width;
    return Consumer<HomeProvider>(
      builder: (context, notifier, _) =>
          BlocBuilder<RedeemCodeBloc, RedeemCodeState>(
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            state is ActiveCodeState
                ? state.codesSea.isEmpty || state.codesGlobal.isEmpty
                    ? _oneServerCode(state)
                    : _allServer(notifier)
                : _oneServerCode(state),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                data.add({
                  "detail": {
                    "characterElysianRealm": {
                      "coreSignet": [
                        {
                          "contents1": "Griseo2",
                          "contents2":
                              "Red, Yellow, Blue, Grey and Orange are the key choices, must pick all enhanced, recommended to pick orange first"
                        }
                      ],
                      "reinforcementSignet": [
                        {
                          "contents1": "Pardofelis1",
                          "contents2":
                              "Both damage boosts are the key choices, unlock nexus"
                        },
                        {
                          "contents1": "Kosma2",
                          "contents2":
                              "	Ultimate, evasion, time extension are the key choices, must unlock nexus"
                        },
                      ],
                      "recommendedSetup": {
                        "emblemSetup": [
                          {
                            "contents1": "Early",
                            "contents2": "Veil of Tears/The Lonely Moon"
                          },
                          {
                            "contents1": "Mid",
                            "contents2": "Mad King's Mask/It Will Be Written"
                          },
                          {
                            "contents1": "Late",
                            "contents2": "Tin Flask/Dreamful Gold"
                          }
                        ],
                        "setupSignet": [
                          {
                            "contents1":
                                "Blessing of Victory 席胜 Increase number of consecutive combo ATKs in Herrscher Form",
                            "contents2": "Start"
                          },
                          {
                            "contents1":
                                "Blessing of Dark Plumes 黑羽 Combo attack triggers feathers that apply vulnerability and restore SP",
                            "contents2": "1st"
                          },
                          {
                            "contents1":
                                "Blessing of Supremacy 独尊 Refreshing or ending shield deals AOE physical dmg",
                            "contents2": "Reinforcement"
                          },
                          {
                            "contents1":
                                "Blessing of Legion 百兵 After using Combo ATK, restore energy and gain Total DMG",
                            "contents2": "No"
                          },
                          {
                            "contents1":
                                "Blessing of Ego 本我 Using Combo ATK summons illusion that copies your attacks	",
                            "contents2": "No"
                          }
                        ],
                        "supportSetup": [
                          {
                            "contents1": "Valkyrie Chariot",
                            "contents2": "Snowy Sniper",
                            "contents3": "Utility"
                          },
                          {
                            "contents1": "Valkyrie Chariot",
                            "contents2": "Snowy Sniper",
                            "contents3": "Damage"
                          }
                        ]
                      }
                    },
                    "characterEquipment": {
                      "stigmatas": [
                        {
                          "nameStigmata": "Shattered Sword",
                          "rank": "tier 0",
                          "urlImage":
                              "https://uploadstatic-sea.mihoyo.com/strategyweb/20210228/2021022821464588737.png"
                        },
                        {
                          "nameStigmata": "Shattered Sword",
                          "rank": "tier 0",
                          "urlImage":
                              "https://uploadstatic-sea.mihoyo.com/strategyweb/20210228/2021022821464588737.png"
                        },
                        {
                          "nameStigmata": "Holmes",
                          "rank": "tier 1",
                          "urlImage":
                              "https://i.ibb.co/kHN4nsy/Untitled-removebg-preview.png"
                        }
                      ],
                      "weapons": [
                        {
                          "nameWeapon": "Domain of Sentience",
                          "rank": "Tier 0",
                          "urlImage":
                              "https://i.ibb.co/ZGPPhnh/Untitled-removebg-preview.png"
                        },
                        {
                          "nameWeapon": "Keys of Oblivion",
                          "rank": "Tier 1",
                          "urlImage":
                              "https://uploadstatic-sea.mihoyo.com/strategyweb/20210228/2021022821050465804.png"
                        },
                        {
                          "nameWeapon": "Nebulus Duality",
                          "rank": "Tier 2",
                          "urlImage":
                              "https://i.ibb.co/DrZ7DKj/nebulus-removebg-preview.png"
                        },
                      ]
                    },
                    "characterTeam": [
                      {
                        "characterTeamItem": [
                          {
                            "nameCharacter": "Griseo",
                            "urlImage":
                                "https://i.ibb.co/cD2dkPw/griseo-removebg-preview-1.png"
                          },
                          {
                            "nameCharacter": "Herrscher of Sentience",
                            "urlImage":
                                "https://i.ibb.co/fv4WVTF/senti-chibi-removebg-preview.png"
                          },
                          {
                            "nameCharacter": "Any Physical DPS",
                            "urlImage":
                                "https://www.pngall.com/wp-content/uploads/13/Damage-PNG-File.png"
                          },
                        ],
                        "nameTeam": "Standart"
                      },
                      {
                        "characterTeamItem": [
                          {
                            "nameCharacter": "Griseo",
                            "urlImage":
                                "https://i.ibb.co/cD2dkPw/griseo-removebg-preview-1.png"
                          },
                          {
                            "nameCharacter": "Herrscher of Sentience",
                            "urlImage":
                                "https://i.ibb.co/fv4WVTF/senti-chibi-removebg-preview.png"
                          },
                          {
                            "nameCharacter": "Carole",
                            "urlImage":
                                "https://i.ibb.co/BGkGjL3/Untitled-removebg-preview.png"
                          },
                        ],
                        "nameTeam": "3 Support Team"
                      }
                    ],
                    "profile": {
                      "battlesuitDetail":
                          "The Herrscher of Sentience is known to be the most beautiful and the strongest of the universe. She has fully commited herself to the crusade of fighting Honkai and protecting the world. However, from time to time, she causes more damage than honkai while fighting it.",
                      "birthplace": "A Schicksal life support pod",
                      "gender": "You can't tell?",
                      "height": "Same as Her",
                      "weight": "Lighter than her for sure!",
                      "organization": "School of Taixuan",
                      "dateBirth": "Same as Her"
                    },
                    "rankUpLevel": [
                      {
                        "description":
                            "The level cap of A Leaf for Lifeboat is raised from 5 to 10",
                        "rankUp": "S1"
                      },
                      {
                        "description": "Unlocks Alliteration is an Agony",
                        "rankUp": "S2"
                      },
                      {
                        "description":
                            "The level cap of Innate Invulnerability is raised from 6 to 8",
                        "rankUp": "S3"
                      },
                      {
                        "description": "Unlocks Mercy Means Meekness",
                        "rankUp": "SS"
                      },
                      {
                        "description":
                            "The level cap of Warden of the World is raised from 7 to 11",
                        "rankUp": "SS1"
                      },
                      {
                        "description":
                            "The level cap of Alliteration is an Agony is raised from 1 to 2",
                        "rankUp": "SS2"
                      },
                      {
                        "description": "Unlocks The Wicked Will Never Win",
                        "rankUp": "SS3"
                      },
                      {"description": "Unlocks Stellar Start", "rankUp": "SSS"}
                    ]
                  },
                  "element": "Thunder",
                  "elementImage": "https://i.postimg.cc/4Hcb2FJr/lightning.png",
                  "image": "https://i.ibb.co/qFQLFZt/eden-removebg-preview.png",
                  "imageChibi":
                      "https://i.ibb.co/bHDhgr2/7b943d4ad9f2b8b9441e13be5da33bde-1580540449542731186-removebg-preview.png",
                  "nameCharacter": "Eden",
                  "role": "support",
                  "tier": "s"
                });
              },
              child: Container(
                height: 110,
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: BorderSide(color: Colors.blue, width: 3),
                  ),
                ),
                child: BlocBuilder<RedeemCodeBloc, RedeemCodeState>(
                  builder: (context, state) {
                    if (state is LoadingRedeemCode) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ActiveCodeState) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: notifier.indexServer == 0
                            ? state.codesSea.length
                            : state.codesGlobal.length,
                        itemBuilder: (context, index) {
                          final data = notifier.indexServer == 0
                              ? state.codesSea[index]
                              : state.codesGlobal[index];

                          final length = notifier.indexServer == 0
                              ? state.codesSea.length
                              : state.codesGlobal.length;

                          return SizedBox(
                            width: width * 0.9,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data.code, style: subtitle),
                                  const SizedBox(height: 16),
                                  Text(data.reward,
                                      style: bodyText2,
                                      textAlign: TextAlign.center),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "${index + 1} / $length",
                                        style: bodyText2.copyWith(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(
                        child: Text("Failed get data from server",
                            style: subtitle));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _allServer(HomeProvider notifier) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.blue, width: 3),
              ),
            ),
            child: Text("Active Codes", style: subtitle),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => notifier.changeIndexServer(0),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: notifier.indexServer == 0
                      ? const BorderSide(color: Colors.red, width: 3)
                      : BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
              child: Text("SEA",
                  style: notifier.indexServer == 0
                      ? bodyText1.copyWith(fontWeight: FontWeight.bold)
                      : bodyText1),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => notifier.changeIndexServer(1),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: notifier.indexServer == 1
                      ? const BorderSide(color: Colors.red, width: 3)
                      : BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
              child: Text("Global",
                  style: notifier.indexServer == 1
                      ? bodyText1.copyWith(fontWeight: FontWeight.bold)
                      : bodyText1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _oneServerCode(RedeemCodeState state) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.blue, width: 3),
              ),
            ),
            child: Text("Active Codes", style: subtitle),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade700, width: 1),
              ),
            ),
            child: Text(
                state is ActiveCodeState
                    ? state.codesGlobal.isEmpty
                        ? "Only for the SEA server"
                        : "Only for the global server"
                    : "Empty",
                style: bodyText1),
          ),
        ),
      ],
    );
  }
}
