import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/presentation/blocs/home/update_bloc/update_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../responsive_layout.dart';

class ListUpdate extends StatelessWidget {
  const ListUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        _headerUpdate(),
        const SizedBox(height: 16),
        _listUpdate(width),
      ],
    );
  }

  Widget _listUpdate(double width) {
    return BlocBuilder<UpdateBloc, UpdateState>(
      builder: (context, state) {
        if (state is UpdateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UpdateLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.listUpdates.length,
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (context, index) {
              final data = state.listUpdates[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _launchUrl(data.urlWeb),
                    child: Container(
                      width: width,
                      height: ResponsiveLayout.isMobile(context) ? 200 : 220,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 3),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: data.urlImage,
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
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _launchUrl(data.urlWeb),
                    child: Text(data.title, style: subtitle),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(data.description, style: bodyText2),
                  ),
                ],
              );
            },
          );
        }
        return Center(
          child: Text("Failed get update data from server", style: subtitle),
        );
      },
    );
  }

  Widget _headerUpdate() {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(color: Colors.blue, width: 3),
            ),
          ),
          child: Text("Latest Update", style: subtitle),
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

  void _launchUrl(String url) async {
    try {
      await launchUrl(
        Uri.parse(url),
      );
    } catch (_) {
      throw "couldn't launch this url";
    }
  }
}
