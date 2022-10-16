import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/common/utils/finite_state.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CurrentEvent extends StatefulWidget {
  const CurrentEvent({super.key});

  @override
  State<CurrentEvent> createState() => _CurrentEventState();
}

class _CurrentEventState extends State<CurrentEvent> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<HomeProvider>(context, listen: false).fetchEventHonkai(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<HomeProvider>(
      builder: (context, notifier, _) => Column(
        children: [
          _headerEvent(notifier),
          const SizedBox(height: 16),
          _listEvents(width, notifier),
        ],
      ),
    );
  }

  Widget _listEvents(double width, HomeProvider notifier) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notifier.indexEvent == 0
          ? notifier.currentEvents.length
          : notifier.upcomingEvent.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final data = notifier.indexEvent == 0
            ? notifier.currentEvents[index]
            : notifier.upcomingEvent[index];
        if (notifier.myState == MyState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (notifier.myState == MyState.failed) {
          return Center(
            child: Text("Failed get data from server", style: subtitle),
          );
        }
        return SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                height: 50,
                child: Center(
                  child: Text(
                      notifier.indexEvent == 0
                          ? "Current Event"
                          : "Upcoming Event",
                      style: subtitle),
                ),
              ),
              Container(
                width: width,
                height: 200,
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
              const SizedBox(height: 16),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(data.title, style: subtitle),
                    const SizedBox(height: 8),
                    Text(data.description,
                        style: bodyText2, textAlign: TextAlign.center),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _headerEvent(HomeProvider notifier) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => notifier.changeIndexEvent(0),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: notifier.indexEvent == 0
                      ? const BorderSide(color: Colors.red, width: 3)
                      : BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
              child: Text("Current Events",
                  style: notifier.indexEvent == 0 ? subtitle : bodyText1),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => notifier.changeIndexEvent(1),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: notifier.indexEvent == 1
                      ? const BorderSide(color: Colors.red, width: 3)
                      : BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
              child: Text("Upcoming Events",
                  style: notifier.indexEvent == 1 ? subtitle : bodyText1),
            ),
          ),
        ),
      ],
    );
  }
}
