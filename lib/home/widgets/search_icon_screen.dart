import 'package:flutter/material.dart';

class SearchIconScreen extends StatelessWidget {
  const SearchIconScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width * 0.95,
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
    );
  }
}
