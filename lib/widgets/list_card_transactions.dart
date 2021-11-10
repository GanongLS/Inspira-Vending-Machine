import 'package:flutter/material.dart';
import 'package:inspira_vm/services/state_tab.dart';
import 'package:inspira_vm/utilities/theme_colors.dart';
import 'package:inspira_vm/utilities/theme_styles.dart';
import 'package:intl/intl.dart';

class ListCardTransaction extends StatelessWidget {
  final Transaction transaction;
  const ListCardTransaction({Key? key, required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Menu> listMenu = transaction.transaction.isNotEmpty ? transaction.transaction : [];
    String image = listMenu.isNotEmpty ? listMenu.first.food.imageAssetLink : 'assets/foods/coklat.jpg';
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(transaction.date);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: 64.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 32.0,
                  width: 32.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: ThemeColors.lightGrey,
                  ),
                  child: Image.asset(
                    image,
                    height: 25.0,
                    width: 25.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(transaction.title, style: ThemeStyles.listTitleTextStyle),
                        Text(formattedDate, style: ThemeStyles.listSubTitleTextStyle)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                transaction.type == TransactionType.addBalance || transaction.type == TransactionType.openAccount
                    ? const Text(
                        '+',
                        style: TextStyle(color: Color(0xFF4CD964), fontSize: 20.0),
                      )
                    : const Text(
                        '-',
                        style: TextStyle(color: Color(0xFFFF3B30), fontSize: 20.0),
                      ),
                const Text("Rp "),
                transaction.type == TransactionType.addBalance || transaction.type == TransactionType.openAccount
                    ? Text(transaction.balanceAddition.toString(), style: ThemeStyles.listTitleTextStyle)
                    : Text(transaction.totalPrice.toString(), style: ThemeStyles.listTitleTextStyle),
                Text(',00', style: ThemeStyles.listTitleTextStyle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
