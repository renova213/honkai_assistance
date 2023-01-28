import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/blocs/event/event_bloc.dart';
import 'package:honkai_assistance/presentation/widgets/title_line.dart';

import '../../../../common/style/style.dart';
import '../../../widgets/loading.dart';

class CurrentEvent extends StatelessWidget {
  const CurrentEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleLine(title: "Curent Event"),
        SizedBox(height: 16.h),
        _listEvents(),
      ],
    );
  }

  Widget _listEvents() {
    return BlocBuilder<EventBloc, EventState>(builder: (context, state) {
      if (state is LoadedEventState) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.events.length <= 3 ? state.events.length : 3,
          separatorBuilder: (context, index) => const SizedBox(height: 32),
          itemBuilder: (context, index) {
            final data = state.events[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  height: 200.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.blue, width: 3),
                  ),
                  child: CachedNetworkImage(
                      imageUrl: data.urlImage,
                      errorWidget: (context, url, error) {
                        return const Center(
                          child: Icon(Icons.error, color: AppColor.red),
                        );
                      },
                      placeholder: (context, url) {
                        return const Loading(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            borderRadius: 0);
                      },
                      fit: BoxFit.fill),
                ),
                SizedBox(height: 16.h),
                Text(data.title,
                    style: AppFont.subtitle,
                    textAlign: TextAlign.center,
                    maxLines: 2),
                const SizedBox(height: 8),
                Text("Ends on ${data.endDate}",
                    style: AppFont.smallText, textAlign: TextAlign.center),
              ],
            );
          },
        );
      }
      return _loading();
    });
  }

  Widget _loading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16.h),
        const Loading(width: double.maxFinite, height: 200, borderRadius: 0),
        SizedBox(height: 16.h),
        const Loading(width: 250, height: 20, borderRadius: 0),
        SizedBox(height: 8.h),
        const Loading(width: 150, height: 15, borderRadius: 0),
      ],
    );
  }
}
