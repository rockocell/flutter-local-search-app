import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/model/local.dart';

class LocalInformation extends StatelessWidget {
  Local local;
  LocalInformation(this.local, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300] ?? Colors.grey, width: 1),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              local.title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text(local.category.toString(), style: TextStyle(fontSize: 12)),
            SizedBox(height: 2),
            Text(local.roadAddress.toString(), style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
