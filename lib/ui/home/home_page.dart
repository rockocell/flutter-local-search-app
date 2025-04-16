import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/ui/home/home_view_model.dart';
import 'package:flutter_local_search_app/ui/home/widgets/locations_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  void search(String text) {
    ref.read(homeViewModelProvider.notifier).search(text);
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HomeState homeState = ref.watch(homeViewModelProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: 50,
            child: TextField(
              maxLines: 1,
              autocorrect: false,
              onSubmitted: search,
              textInputAction: TextInputAction.search,
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Search...',
                border: WidgetStateInputBorder.resolveWith((states) {
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    );
                  }
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  );
                }),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  ref
                      .read(homeViewModelProvider.notifier)
                      .searchByCurrentLocation();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                  child: Icon(Icons.gps_fixed),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: homeState.locations?.length ?? 0,
                  itemBuilder: (context, index) {
                    Location location = homeState.locations![index];
                    return LocationInformation(location);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
