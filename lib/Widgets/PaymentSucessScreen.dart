import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Widgets/ProfileTile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentSuccessScreen extends StatefulWidget {
  @override
  PaymentSucessScreenState createState() {
    return new PaymentSucessScreenState();
  }
}

class PaymentSucessScreenState extends State<PaymentSuccessScreen> {
  bool isDataAvailable = true;

  Widget bodyData() => Center(
        child: isDataAvailable
            ? RaisedButton(
                shape: StadiumBorder(),
                onPressed: () => showSuccessDialog(),
                color: Colors.amber,
                child: Text("Process Payment"),
              )
            : CircularProgressIndicator(),
      );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: bodyData(),
    );
  }

  void showSuccessDialog() {
    setState(() {
      isDataAvailable = false;
      Future.delayed(Duration(seconds: 3)).then((_) => goToDialog());
    });
  }

  goToDialog() {
    setState(() {
      isDataAvailable = true;
    });
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    successTicket(),
                    SizedBox(
                      height: 10.0,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ));
  }

  successTicket() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Material(
          elevation: 2.0,
          borderRadius: BorderRadius.circular(4.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ProfileTile(
                  title: "Thank You!",
                  textColor: Colors.purple,
                  subtitle: "Your transaction was successful",
                ),
                ListTile(
                  title: Text("Date"),
                  subtitle: Text("4 Nov 2018"),
                  trailing: Text("11:00 AM"),
                ),
                ListTile(
                  title: Text("Victor Tong"),
                  subtitle: Text("essdfds@gmail.com"),
                  trailing: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: new AssetImage(AppImage.food_christ),
                  ),
                ),
                ListTile(
                  title: Text("Amount"),
                  subtitle: Text("\$100"),
                  trailing: Text("Completed"),
                ),
                Card(
                  elevation: 0.0,
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.ccAmex,
                      color: Colors.blue,
                    ),
                    title: Text("Credit/Debit Card"),
                    subtitle: Text("Amex Card ending ***6"),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
