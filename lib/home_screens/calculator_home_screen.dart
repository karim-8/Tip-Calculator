import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertipcalculator/app_colors/app_colors.dart';

class TipCalculatorScreen extends StatefulWidget {
  @override
  _TipCalculatorAppState createState() => _TipCalculatorAppState();
}

class _TipCalculatorAppState extends State<TipCalculatorScreen> {
  bool isCalculatePressed = false;
  int people = 1;
  double tipPerPerson = 0;
  double tipTotalPerPerson = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController billTextEditingController = TextEditingController();
  TextEditingController tipTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _pageHeaderView(),
              SizedBox(
                height: 10.0,
              ),
              _buildTipBillAmount(),
              SizedBox(
                height: 20.0,
              ),
              _buildNumberOfPeoples(),
              SizedBox(
                height: 20.0,
              ),
              _buildCalculateButton(),
              SizedBox(
                height: 20.0,
              ),
              _buildInvoiceWidgets(),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      )),
      backgroundColor: Colors.white30,
    );
  }

  Widget _pageHeaderView() {
    return Container(
        margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
        child: Container(
          child: Column(
            children: [
              Text(
                "Tip Calculator",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Container(
                  height: 100,
                  width: 100,
                  child: Image(image: AssetImage('images/dollars.png'))),
            ],
          ),
        ));
  }

  Widget _buildInvoiceWidgets() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20.0, right: 10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 10.0,
                color: Colors.grey,
                padding: EdgeInsets.all(10.0),
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Text(
                      "Tip",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      tipPerPerson.toString(),
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 20.0),
              child: RaisedButton(
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 10.0,
                padding: EdgeInsets.all(10.0),
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      tipTotalPerPerson.toString(),
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculateButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20.0, right: 10.0),
      child: RaisedButton(
        color: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 10.0,
        padding: EdgeInsets.all(10.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _calculateTip();
            people = 1;
          }
        },
        child: Center(
          child: Text(
            "Calculate",
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberOfPeoples() {
    return Container(
      width: 250,
      margin: EdgeInsets.only(left: 20.0, right: 10.0),
      child: RaisedButton(
//        color: lightText,
        color: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 10.0,
        padding: EdgeInsets.all(10.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _calculateTip();
          }
          print("what ?");
        },
        child: Column(
          children: <Widget>[
            Text(
              "No. Of People",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [gradientStartColor2, gradientEndColor2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.4, 1.0]),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 25.0,
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (people != 1) {
                        setState(() {
                          isCalculatePressed = false;
                          people--;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  people.toString(),
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(width: 10.0),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [gradientStartColor2, gradientEndColor2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.4, 1.0]),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 25.0,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isCalculatePressed = false;
                        people++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipBillAmount() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              controller: billTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: "Bill Amount",
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
              // ignore: missing_return
              validator: (String billAmount) {
                if (billAmount.isEmpty) {
                  return "Tip amount is required";
                }
              },
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: TextFormField(
              controller: tipTextEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: "Bill Tip (%)",
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              keyboardType: TextInputType.number,
              // ignore: missing_return
              validator: (String billTip) {
                if (billTip.isEmpty) {
                  return "Tip amount is required";
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _calculateTip() {
    FocusScope.of(context).requestFocus(FocusNode());

    if (people > 1) {
      isCalculatePressed = true;
    } else {
      isCalculatePressed = false;
    }

    tipPerPerson = (double.parse(billTextEditingController.text) /
        (int.parse(tipTextEditingController.text) * people));
    print("tipPerPerson ${tipPerPerson}");

    tipTotalPerPerson =
        (double.parse(billTextEditingController.text) / people) + tipPerPerson;
    print("tipTotalPerPerson ${tipTotalPerPerson}");

    billTextEditingController.clear();
    tipTextEditingController.clear();
    setState(() {});
  }
}
