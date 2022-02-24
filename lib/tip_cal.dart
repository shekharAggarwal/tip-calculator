import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TipCal extends StatefulWidget {
  const TipCal({Key? key}) : super(key: key);

  @override
  _TipCalState createState() => _TipCalState();
}

class _TipCalState extends State<TipCal> {
  String price = "0.0";
  double person = 1.0;
  TextEditingController _controllerAmount = TextEditingController();
  TextEditingController _controllerPercent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Tip Calculator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(50.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Per head",
                      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\$ $price",
                      style: TextStyle(fontSize: 45, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerAmount,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  label: Text("Enter Amount"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controllerPercent,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  label: Text("Enter % of tip"),
                ),
              ),
            ),
            Slider(
              value: person,
              min: 1,
              divisions: 10,
              max: 11,
              onChanged: (valu) {
                setState(() {
                  person = valu;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_controllerAmount.text.isNotEmpty &&
                      _controllerPercent.text.isNotEmpty) {
                    tip_cal_fun();
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check amount or percent")));
                  }
                },
                child: Text("cal"))
          ],
        ),
      ),
    );
  }

  void tip_cal_fun() {
    print(person);
    double am = double.parse(_controllerAmount.text);
    double tp = double.parse(_controllerPercent.text);
    setState(() {
      price = ((am+(am*(tp/100)))/person).toStringAsFixed(2);
    });
  }
}
