import 'package:flutter/material.dart';
import 'package:inspira_vm/model/food.dart';
import 'package:inspira_vm/services/state_tab.dart';
import 'package:inspira_vm/utilities/theme_colors.dart';
import 'package:inspira_vm/widgets/list_card_vendings.dart';
import 'package:provider/provider.dart';

class Vendings extends StatelessWidget {
  Vendings({Key? key}) : super(key: key);
  final List<Food> foods = [
    Food(name: "Biskuit", price: 6000, imageAssetLink: 'assets/foods/biskuit.jpg'),
    Food(name: "Chips", price: 8000, imageAssetLink: 'assets/foods/chips.jpg'),
    Food(name: "Oreo", price: 10000, imageAssetLink: 'assets/foods/oreo.jpg'),
    Food(name: "Tango", price: 12000, imageAssetLink: 'assets/foods/tango.jpg'),
    Food(name: "Coklat", price: 15000, imageAssetLink: 'assets/foods/coklat.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);
    final isDisable = provider.transaction.isEmpty;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          height: MediaQuery.of(context).size.height * 0.52,
          child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return ListCardVendings(food: foods[index]);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: MediaQuery.of(context).size.height * 0.05,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: isDisable ? ThemeColors.lightGrey : ThemeColors.lightBlue, shape: const StadiumBorder()),
            onPressed: () {
              isDisable ? null : provider.onOrder();
            },
            child: const Text("Order"),
          ),
        )
      ],
    );
  }
}
