import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:muslim_app_2/core/utils/styles.dart';

class SunnahCard extends StatelessWidget {
  final Map map;
  final int indexi;

  const SunnahCard({super.key, required this.map, required this.indexi});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ExpansionTileCard(
          trailing: Text(
            map.keys.elementAt(indexi),
            style: Styles.textStyle20Ar,
          ),
          title: const Row(
            children: [
              Icon(Icons.arrow_drop_down_outlined),
            ],
          ),
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (int j = 0;
                        // ignore: avoid_dynamic_calls
                        j < map[map.keys.elementAt(indexi)].length;
                        j++)
                      Column(
                        children: [
                          Text(
                            // ignore: avoid_dynamic_calls
                            map[map.keys.elementAt(indexi)][j],
                            textAlign: TextAlign.end,
                            style: Styles.textStyle20Ar,
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      )
                  ],
                ))
          ]),
    );
  }
}
