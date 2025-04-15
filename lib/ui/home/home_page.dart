import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/ui/home/widgets/local_information.dart';

class HomePage extends StatelessWidget {
  void search(String text) {
    // TODO: 뷰모델 search함수 호출
    print("search");
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
