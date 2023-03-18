import 'package:flutter/material.dart';

class DealsPage extends StatefulWidget {
  final String searchText;
  const DealsPage(this.searchText, {super.key});

  @override
  State<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  List<Deal> currentDeals = List.from(deals);

  Widget generateListTile(BuildContext context, int index) {
    var deal = currentDeals[index];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        tileColor: Colors.blueGrey[100],
        title: Text(deal.title),
        subtitle: Text(deal.description),
        leading: Text(deal.id.toString()),
        onTap: () {},
        trailing: const Icon(
          Icons.arrow_right,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    currentDeals = deals
        .where((x) => x.title.toLowerCase().contains(widget.searchText))
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) => generateListTile(context, index),
      itemCount: currentDeals.length,
    );
  }
}

class Deal {
  final int id;
  final String title;
  final String description;

  Deal(this.id, this.title, this.description);
}

List<Deal> deals = [
  Deal(1, 'Сходить в магазин', 'Купить молоко, хлеб и сыр'),
  Deal(2, 'Работа', 'Работайте братья'),
  Deal(3, 'Спать', 'Спите братья'),
];
