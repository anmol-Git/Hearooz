import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hearooz/providers/catalog_retrieval_provider.dart';
import 'package:provider/provider.dart';

class SearchIconScreen extends StatefulWidget {
  const SearchIconScreen({Key? key}) : super(key: key);

  @override
  State<SearchIconScreen> createState() => _SearchIconScreenState();
}

class _SearchIconScreenState extends State<SearchIconScreen> {
  Future<String?> getImgUrl(String? imgUrl) async {
    if (imgUrl != null) {
      try {
        Uint8List bytes =
            (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl))
                .buffer
                .asUint8List();
        print("The image exists!");
        return imgUrl;
      } catch (e) {
        print("Error: $e");
        return null;
      }
    } else
      return null;
  }

  final myController = TextEditingController();
  String pat = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: SingleChildScrollView(
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
                    child: TextFormField(
                      controller: myController,
                      onChanged: ((value) {
                        setState(() {
                          pat = value;
                        });
                      }),
                      decoration: const InputDecoration(
                        hintText: 'Enter a search term',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: Provider.of<CatalogueRetrivalProvider>(context)
                    .searchCatalogue(pat),
                builder: (context, AsyncSnapshot snapshot) {
                  List<dynamic>? list = snapshot.data;

                  if (snapshot.connectionState == ConnectionState.done &&
                      list != null) {
                    return SizedBox(
                      height: 120.0 * list.length,
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: 150,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox(
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.25,
                                        child: FutureBuilder(
                                            future: getImgUrl(list[index]
                                                ['data']['cover_image']),
                                            builder: (context,
                                                AsyncSnapshot snapshot) {
                                              bool error =
                                                  snapshot.data == null;
                                              return SizedBox(
                                                  child: !error
                                                      ? Image.network(
                                                          snapshot.data)
                                                      : Image.asset(
                                                          'assets/app_icon.png'));
                                            }),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .7,
                                      child: Text(
                                        snapshot.data[index]['data']['title'] ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 35, 35, 35),
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
    );
  }
}
