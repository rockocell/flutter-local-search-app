import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/ui/detail/detail_page.dart';
import 'package:flutter_local_search_app/util/util.dart';

class LocationInformation extends StatelessWidget {
  Location location;
  LocationInformation(this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(location);
            },
          ),
        );
      },
      child: Container(
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
                removeHtmlTags(location.title),

                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Text(
                location.category.toString(),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 2),
              Text(
                location.roadAddress.toString(),
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
