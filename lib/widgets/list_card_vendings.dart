// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inspira_vm/model/food.dart';
import 'package:inspira_vm/services/state_tab.dart';
import 'package:inspira_vm/utilities/theme_colors.dart';
import 'package:inspira_vm/utilities/theme_styles.dart';
import 'package:provider/provider.dart';

class ListCardVendings extends StatelessWidget {
  final Food food;
  const ListCardVendings({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);
    final trx = Provider.of<AppState>(context).transaction;
    // debugPrint(trx.toString());
    // inspect(trx);
    final _id = trx.isNotEmpty ? trx.indexWhere((e) => e.food.name == food.name) : -1;
    final _total = _id > -1 ? trx[_id].total.toString() : "0";
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: SizedBox(
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 64.0,
                      width: 64.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: ThemeColors.lightGrey,
                      ),
                      child: Image.asset(
                        food.imageAssetLink,
                        height: 48.0,
                        width: 48.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                      child: SizedBox(
                        height: 48.0,
                        width: 97.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              food.name,
                              style: ThemeStyles.listTitleTextStyle,
                            ),
                            Text(
                              "Rp " + food.price.toString(),
                              style: ThemeStyles.listSubTitleTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.redAccent,
                      ),
                      tooltip: 'decrease food by 1',
                      onPressed: () {
                        provider.reduceItem(food);
                      },
                    ),
                    const SizedBox(width: 2.0),
                    Text(
                      _total,
                      style: ThemeStyles.listTitleTextStyle,
                    ),
                    const SizedBox(width: 2.0),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.greenAccent,
                      ),
                      tooltip: 'increase food by 1',
                      onPressed: () {
                        provider.addItem(food);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
