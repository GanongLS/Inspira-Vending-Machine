import 'package:flutter/material.dart';
import 'package:inspira_vm/model/food.dart';

enum WidgetMarker { vendings, transactions }
enum TransactionType { openAccount, order, addBalance }

class AppState extends ChangeNotifier {
  WidgetMarker selectedWidgetMarker = WidgetMarker.vendings;
  bool isSelectedTransactions = false;
  bool isSelectedVendings = true;
  List<Menu> transaction = [];
  List<Transaction> transactionHistory = [];
  int balance = 150000;
  AppState() {
    onOrder();
  }

  void changeToTransactions() {
    selectedWidgetMarker = WidgetMarker.transactions;
    isSelectedTransactions = true;
    isSelectedVendings = false;
    notifyListeners();
  }

  void changeToVendings() {
    selectedWidgetMarker = WidgetMarker.vendings;
    isSelectedTransactions = false;
    isSelectedVendings = true;
    notifyListeners();
  }

  void addItem(Food food) {
    int index = transaction.indexWhere((e) => e.food.name == food.name);

    if (index > -1) {
      transaction[index].increaseTotal();
    } else {
      transaction.add(Menu(food: food, total: 1));
    }
    notifyListeners();
  }

  void reduceItem(Food food) {
    int index = transaction.indexWhere((e) => e.food.name == food.name);
    if (index > -1) {
      if (transaction[index].total > 1) {
        transaction[index].decreaseTotal();
      } else {
        transaction.remove(transaction[index]);
      }
    }
    notifyListeners();
  }

  void openAccount() {
    transactionHistory.add(Transaction(
        transaction: transaction,
        lastBalance: balance,
        currentbalance: balance,
        totalPrice: 0,
        balanceAddition: 0,
        type: TransactionType.openAccount, date: DateTime.now()));

    transaction.clear();
    notifyListeners();
  }

  void onOrder() {
    int totalHarga = 0;
    for (var menu in transaction) {
      int harga = menu.food.price * menu.total;
      totalHarga = totalHarga + harga;
    }
    transactionHistory.add(Transaction(
        transaction: transaction,
        lastBalance: balance,
        currentbalance: balance - totalHarga,
        totalPrice: totalHarga,
        balanceAddition: 0,
        type: TransactionType.order, date: DateTime.now()));
    balance = balance - totalHarga;
    transaction.clear();
    notifyListeners();
  }

  void addBalance({required int addition}) {
    balance = balance + addition;
    
    transactionHistory.add(Transaction(
        transaction: transaction,
        lastBalance: balance,
        currentbalance: balance + addition,
        totalPrice: 0,
        balanceAddition: addition,
        type: TransactionType.addBalance, date: DateTime.now()));
    notifyListeners();
  }
}

class Menu with ChangeNotifier {
  Menu({
    required this.food,
    required this.total,
  });

  final Food food;
  int total;

  void increaseTotal() {
    total++;
    notifyListeners();
  }

  void decreaseTotal() {
    total--;
    notifyListeners();
  }
}

class Transaction with ChangeNotifier {
  final TransactionType type;
  final List<Menu> transaction;
  final int lastBalance;
  final int currentbalance;
  final int totalPrice;
  final int balanceAddition;
  final DateTime date;

  Transaction({
    required this.type,
    required this.transaction,
    required this.lastBalance,
    required this.currentbalance,
    required this.totalPrice,
    required this.balanceAddition,
    required this.date,
  });

  String get title {
    if (type == TransactionType.openAccount) {
      return "Open Account";
    } else if (type == TransactionType.addBalance) {
      return "recharge";
    } else {
      return "purchase order";
    }
  }
}
