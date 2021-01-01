import 'package:crypto_wallet/net/flutterfire.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  TextEditingController _amountController = new TextEditingController();

  List<String> coins = [
    "bitcoin",
    "tether",
    "ethereum",
  ];

  String dropDownValue = "bitcoin";

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: this.dropDownValue,
            onChanged: (String value) {
              setState(() {
                this.dropDownValue = value;
              });
            },
            items: coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _amountController,
              decoration: InputDecoration(
                labelText: "Coin Amount",
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          Container(
            width: MediaQuery.of(context).size.width / 1.4,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.red[700],
            ),
            child: MaterialButton(
              onPressed: () async {
                await addCoin(this.dropDownValue, this._amountController.text);
                Navigator.of(context).pop();
              },
              child: Text(
                "Add Coin",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
