import 'package:flutter/material.dart';

class InforowWidget extends StatelessWidget {
  final String title;
  final String info;
  const InforowWidget(this.info, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(info),
            Text(title),
          ],
        ),
      );
  }
}