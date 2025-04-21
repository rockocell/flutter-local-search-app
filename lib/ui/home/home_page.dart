import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/get_current_location.dart';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/ui/home/home_view_model.dart';
import 'package:flutter_local_search_app/ui/home/widgets/locations_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

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
                onTap: () async {
                  final position = await getCurrentLocation();
                  ref
                      .read(homeViewModelProvider.notifier)
                      .searchByCurrentLocation(
                        position.latitude,
                        position.longitude,
                      );
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
                child:
                    (homeState.locations == null)
                        ? SizedBox()
                        : (homeState.locations!.isEmpty)
                        ? Center(
                          child: Text(
                            '검색 결과가 없습니다',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                        : ListView.separated(
                          itemCount: homeState.locations!.length,
                          itemBuilder: (context, index) {
                            final location = homeState.locations![index];
                            return LocationInformation(location);
                          },
                          separatorBuilder:
                              (contex, index) => SizedBox(height: 10),
                        ),
              ), // 검색 전엔 빈 화면 표시, 검색 결과가 없으면 안내 문구 표시, 검색 결과가 있으면 Listview build
            ],
          ),
        ),
      ),
    );
  }
}
