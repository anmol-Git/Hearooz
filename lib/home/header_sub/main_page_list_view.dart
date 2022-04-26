import 'package:flutter/material.dart';

class MainPageListView extends StatelessWidget {
  const MainPageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Container(
                height: 150,
                width: 150,
                color: Colors.pink,
              ),
            ),
          );
        },
      ),
    );
  }
}
