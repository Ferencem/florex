import 'package:flutter/material.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/categ_widgets.dart';

class FuszernovenyCategory extends StatelessWidget {
  const FuszernovenyCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: size.height * 0.8,
              width: size.width * 0.72,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategHeaderLabel(
                    headerLabel: 'Fűszernövény',
                  ),
                  SizedBox(
                    height: size.height * 0.6,
                    child: GridView.count(
                      mainAxisSpacing: 30,
                      crossAxisCount: 3,
                      children: List.generate(fuszernoveny.length, (index) {
                        return SubcategModel(
                          mainCategName: 'fuszernoveny',
                          subCategName: fuszernoveny[index],
                          assetName: 'images/fuszernoveny/fuszernoveny$index.jpg',
                          assetLabel: fuszernoveny[index],
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: SliderBar(
                size: size,
                sliderLabel: 'Fűszernövény',
              ))
        ],
      ),
    );
  }
}
