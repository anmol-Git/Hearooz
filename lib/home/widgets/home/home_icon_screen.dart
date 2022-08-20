import 'package:flutter/material.dart';
import 'package:hearooz/providers/catalog_retrieval_provider.dart';
import 'package:provider/provider.dart';

import '../../header_sub/circular_main_page_list_view.dart';
import '../../header_sub/main_page_list_view.dart';
import '../../header_sub/title_row.dart';

class HomeIconScreen extends StatelessWidget {
  const HomeIconScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Consumer<CatalogueRetrivalProvider>(
            builder: (context, data, child) {
          return Container(
            color: Colors.white,
            child: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Neue Folgen',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[0],
                    list1: data.data[1],
                    list2: data.data[2],
                    list3: data.data[3]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Neue Sendungen',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[4],
                    list1: data.data[5],
                    list2: data.data[6],
                    list3: data.data[7]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Charts',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[8],
                    list1: data.data[9],
                    list2: data.data[10],
                    list3: data.data[11]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Aktuelles',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[12],
                    list1: data.data[13],
                    list2: data.data[14],
                    list3: data.data[15]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Sendugen',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[16],
                    list1: data.data[17],
                    list2: data.data[18],
                    list3: data.data[19]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'kakadu',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[20],
                    list1: data.data[21],
                    list2: data.data[22],
                    list3: data.data[23]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'kakadu update',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[24],
                    list1: data.data[25],
                    list2: data.data[26],
                    list3: data.data[27]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Mikadu: Radio fur kinder',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[28],
                    list1: data.data[29],
                    list2: data.data[30],
                    list3: data.data[31]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Spannung',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                  list: data.data[32],
                  list1: data.data[33],
                  list2: data.data[34],
                  list3: data.data[35],
                ),
                // SizedBox(
                //     height: 150,
                //     child: Image.network(
                //       'https://static.ahrefs.com/static/assets/static/ahrefs-logo-8b1ac30fdccbb84b3da69d159b5914ca.jpg',
                //       width: MediaQuery.of(context).size.width,
                //       fit: BoxFit.fitWidth,
                //     )),
                // const SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //     height: 150,
                //     child: Image.network(
                //       'https://animals.sandiegozoo.org/sites/default/files/2016-08/animals_hero_bald_eagle.jpg',
                //       fit: BoxFit.fill,
                //       width: MediaQuery.of(context).size.width,
                //     )),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Horpiele PREMIUM',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // CircularMainPageListView(
                //     list: data.data[36],
                //     list1: data.data[37],
                //     list2: data.data[38],
                //     list3: data.data[39]),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Horbucher PREMIUM',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // CircularMainPageListView(
                //     list: data.data[40],
                //     list1: data.data[41],
                //     list2: data.data[42],
                //     list3: data.data[43]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Ostern',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[44],
                    list1: data.data[45],
                    list2: data.data[46],
                    list3: data.data[47]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Wissen',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[48],
                    list1: data.data[49],
                    list2: data.data[50],
                    list3: data.data[51]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Leseecke',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[52],
                    list1: data.data[53],
                    list2: data.data[54],
                    list3: data.data[55]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Familie & Co',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[56],
                    list1: data.data[57],
                    list2: data.data[58],
                    list3: data.data[59]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Marchen',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[60],
                    list1: data.data[61],
                    list2: data.data[62],
                    list3: data.data[63]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Dinosaurier',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[64],
                    list1: data.data[65],
                    list2: data.data[66],
                    list3: data.data[67]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Tierisches Wissen',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[68],
                    list1: data.data[69],
                    list2: data.data[70],
                    list3: data.data[71]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Interviews',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[72],
                    list1: data.data[73],
                    list2: data.data[74],
                    list3: data.data[75]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Tiere',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[76],
                    list1: data.data[77],
                    list2: data.data[78],
                    list3: data.data[79]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Schule & Lerner',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[80],
                    list1: data.data[81],
                    list2: data.data[82],
                    list3: data.data[83]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Einschlafen',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                MainPageListView(
                    list: data.data[84],
                    list1: data.data[85],
                    list2: data.data[86],
                    list3: data.data[87]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Ab 3 jahre',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[88],
                    list1: data.data[89],
                    list2: data.data[90],
                    list3: data.data[91]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Ab 6 jahre',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[92],
                    list1: data.data[93],
                    list2: data.data[94],
                    list3: data.data[95]),
                const SizedBox(height: 10),
                const TitleRow(
                  title: 'Ab 9 jahre',
                  imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                ),
                const SizedBox(height: 10),
                CircularMainPageListView(
                    list: data.data[96],
                    list1: data.data[97],
                    list2: data.data[98],
                    list3: data.data[99]),
                const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Plauderei',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // const CircularMainPageListView(),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Geschichten',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // const CircularMainPageListView(),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Horspab auf Englisch',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // const CircularMainPageListView(),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Horspab auf franzosisch',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // const CircularMainPageListView(),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Entspannung',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // const CircularMainPageListView(),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Bewengung',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // const CircularMainPageListView(),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Unsere Empfehlungeg',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // MainPageListView(
                //   list: data[11],
                // ),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Buchtipps',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // const CircularMainPageListView(),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Sport',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // MainPageListView(
                //   list: data[12],
                // ),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'Gott und die welt',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // const CircularMainPageListView(),
                // const SizedBox(height: 10),
                // const TitleRow(
                //   title: 'reportagen',
                //   imageUrl: 'https://img.icons8.com/fluency/344/new--v2.png',
                // ),
                // const SizedBox(height: 10),
                // MainPageListView(
                //   list: data[13],
                // ),
                // const SizedBox(height: 10)
              ],
            )),
          );
        }),
      ),
    );
  }
}
