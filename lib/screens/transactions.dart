import 'package:flutter/material.dart';
import 'package:inspira_vm/services/state_tab.dart';
import 'package:inspira_vm/widgets/list_card_transactions.dart';
import 'package:provider/provider.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppState>(context);
    List<Transaction> history = provider.transactionHistory;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: MediaQuery.of(context).size.height * 0.52,
      child: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) => ListCardTransaction(transaction: history[index]),
      ),
    );
  }
}
