import 'package:flutter/material.dart';
import 'package:hearooz/home/main_header.dart';
import 'package:hearooz/utils/colors.dart';

class SearchButtonTap extends StatelessWidget {
  const SearchButtonTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Column(
        children: [
          const Header(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Row(children: [
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.search),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a search term',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
