import 'package:flutter/material.dart';

class LocalInformation extends StatelessWidget {
  const LocalInformation({super.key});

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
              '삼성1동 주민센터',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            Text('공공, 사회기관', style: TextStyle(fontSize: 12)),
            SizedBox(height: 2),
            Text(
              '서울특별시 강남구 봉은사로 616 삼성1동 주민센터',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
