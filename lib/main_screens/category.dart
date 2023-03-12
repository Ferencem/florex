import 'package:flutter/material.dart';
import 'package:multi_store_app/categories/fuszernoveny_categ.dart';
import 'package:multi_store_app/categories/futo_categ.dart';
import 'package:multi_store_app/categories/kerti_virag_categ.dart';
import 'package:multi_store_app/widgets/fake_search.dart';
import 'package:multi_store_app/categories/vizparti_categ.dart';
import 'package:multi_store_app/categories/fa_categ.dart';
import 'package:multi_store_app/categories/gyumolcstermo_categ.dart';
import 'package:multi_store_app/categories/kulteri_categ.dart';
import 'package:multi_store_app/categories/orokzold_categ.dart';
import 'package:multi_store_app/categories/belteri_categ.dart';
import 'package:multi_store_app/categories/bonsai_categ.dart';

List<ItemsData> items = [
  ItemsData(label: 'Beltéri'),
  ItemsData(label: 'Bonsai'),
  ItemsData(label: 'Vizparti'),
  ItemsData(label: 'Cserje'),
  ItemsData(label: ' Futó-növény'),
  ItemsData(label: ' Gyü-mölcs-termő'),
  ItemsData(label: 'Kerti'),
  ItemsData(label: 'Kültéri'),
  ItemsData(label: ' Örök-zöld'),
  ItemsData(label: ' Fűszer-növény'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    setState(() {
      for (var element in items) {
        element.isSelected = false;
      }
      items[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
          Positioned(bottom: 0, right: 0, child: categView(size))
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceIn);
              },
              child: Container(
                color: items[index].isSelected == true
                    ? Colors.white
                    : Colors.grey.shade300,
                height: 100,
                child: Center(
                  child: Text(items[index].label),
                ),
              ),
            );
          }),
    );
  }

  Widget categView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            for (var element in items) {
              element.isSelected = false;
            }
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          BelteriCategory(),
          BonsaiCategory(),
          VizpartiCategory(),
          FaCategory(),
          FutoCategory(),
          GyumolcstermoCategory(),
          KertiviragCategory(),
          KulteriCategory(),
          OrokzoldCategory(),
          FuszernovenyCategory(),
        ],
      ),
    );
  }
}

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false});
}
