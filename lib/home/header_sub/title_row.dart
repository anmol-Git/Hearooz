import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TitleRow({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: Colors.black, fontSize: 22),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Image.network(
          imageUrl,
          width: 35,
          height: 35,
        ),
      ],
    );
  }
}
