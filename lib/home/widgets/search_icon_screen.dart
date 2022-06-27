import 'package:flutter/material.dart';

class SearchIconScreen extends StatelessWidget {
  const SearchIconScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[700],
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            height: 50,
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                const Icon(Icons.search, color: Colors.black),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a search term',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
