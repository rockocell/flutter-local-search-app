import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/ui/home/home_view_model.dart';
import 'package:flutter_local_search_app/ui/home/widgets/local_information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  void search(String text) {
    // TODO: 뷰모델 search함수 호출
    print("search");
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
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              maxLines: 1,
              autocorrect: false,
              onSubmitted: search,
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              LocalInformation(),
              LocalInformation(),
              LocalInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
