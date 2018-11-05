import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_sandbox/Bloc/CreditCardBloc.dart';
import 'package:flutter_sandbox/Fonts/UIData.dart';
import 'package:flutter_sandbox/Screen/EatIdecideScreen.dart';
import 'package:flutter_sandbox/Styles/AppImage.dart';
import 'package:flutter_sandbox/Widgets/PaymentSucessScreen.dart';
import 'package:flutter_sandbox/Widgets/ProfileTile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path/path.dart';

class PaymentScreen extends StatelessWidget {
  BuildContext _context;
  CreditCardBloc cardBloc;
  MaskedTextController ccMask =
      MaskedTextController(mask: "0000 0000 0000 0000");
  MaskedTextController expMask = MaskedTextController(mask: "00/00");

  var _redeemCoupon = new TextEditingController();

  var _asiamileController = new TextEditingController();

  Widget bodyData() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            creditCardWidget(),
            fillEntries(),
            buildAsianMile(),
            buildRedeemCoupon(),
            SizedBox(height: 60.0),
          ],
        ),
      );

  Widget creditCardWidget() {
    var deviceSize = MediaQuery.of(_context).size;
    return Container(
      height: deviceSize.height * 0.3,
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 3.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: UIData.kitGradients)),
              ),
              Opacity(
                opacity: 0.1,
                child: Image.asset(
                  AppImage.uikit_map,
                  fit: BoxFit.cover,
                ),
              ),
              MediaQuery.of(_context).orientation == Orientation.portrait
                  ? cardEntries()
                  : FittedBox(
                      child: cardEntries(),
                    ),
              Positioned(
                right: 10.0,
                top: 10.0,
                child: Icon(
                  FontAwesomeIcons.ccVisa,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: 10.0,
                bottom: 10.0,
                child: StreamBuilder<String>(
                  stream: cardBloc.nameOutputStream,
                  initialData: "Name",
                  builder: (context, snapshot) => Text(
                        snapshot.data.length > 0 ? snapshot.data : "Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: UIData.ralewayFont,
                            fontSize: 20.0),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardEntries() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StreamBuilder<String>(
                stream: cardBloc.ccOutputStream,
                initialData: "**** **** **** ****",
                builder: (context, snapshot) {
                  snapshot.data.length > 0
                      ? ccMask.updateText(snapshot.data)
                      : null;
                  return Text(
                    snapshot.data.length > 0
                        ? snapshot.data
                        : "**** **** **** ****",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                StreamBuilder<String>(
                    stream: cardBloc.expOutputStream,
                    initialData: "MM/YY",
                    builder: (context, snapshot) {
                      snapshot.data.length > 0
                          ? expMask.updateText(snapshot.data)
                          : null;
                      return ProfileTile(
                        textColor: Colors.white,
                        title: "Expiry",
                        subtitle:
                            snapshot.data.length > 0 ? snapshot.data : "MM/YY",
                      );
                    }),
                SizedBox(
                  width: 30.0,
                ),
                StreamBuilder<String>(
                    stream: cardBloc.cvvOutputStream,
                    initialData: "***",
                    builder: (context, snapshot) => ProfileTile(
                          textColor: Colors.white,
                          title: "CVV",
                          subtitle:
                              snapshot.data.length > 0 ? snapshot.data : "***",
                        )),
              ],
            ),
          ],
        ),
      );

  Widget fillEntries() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: ccMask,
                keyboardType: TextInputType.number,
                maxLength: 19,
                style: TextStyle(
                    fontFamily: UIData.ralewayFont, color: Colors.black),
                onChanged: (out) => cardBloc.ccInputSink.add(ccMask.text),
                decoration: InputDecoration(
                  labelText: "Credit Card Number",
                  labelStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                      fontSize: 14.0),
                ),
              ),
              TextField(
                controller: expMask,
                keyboardType: TextInputType.number,
                maxLength: 5,
                style: TextStyle(
                    fontFamily: UIData.ralewayFont, color: Colors.black),
                onChanged: (out) => cardBloc.expInputSink.add(expMask.text),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                      fontSize: 14.0),
                  labelText: "MM/YY",
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                style: TextStyle(
                    fontFamily: UIData.ralewayFont, color: Colors.black),
                onChanged: (out) => cardBloc.cvvInputSink.add(out),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                      fontSize: 14.0),
                  labelText: "CVV",
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                maxLength: 20,
                style: TextStyle(
                    fontFamily: UIData.ralewayFont, color: Colors.black),
                onChanged: (out) => cardBloc.nameInputSink.add(out),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                      fontSize: 14.0),
                  labelText: "Name on card",
                ),
              ),
            ],
          ),
        ),
      );

  Widget floatingBar() => Ink(
        decoration: ShapeDecoration(
            shape: StadiumBorder(),
            gradient: LinearGradient(colors: UIData.kitGradients)),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(_context).push(
                MaterialPageRoute(builder: (context) => showSuccessDialog()));
          },
          backgroundColor: Colors.transparent,
          icon: Icon(
            FontAwesomeIcons.amazonPay,
            color: Colors.white,
          ),
          label: Text(
            " \$100 ",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    _context = context;
    cardBloc = CreditCardBloc();
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: bodyData(),
      floatingActionButton: floatingBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  buildAsianMile() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: <Widget>[
              new Image.asset(AppImage.payment_asmiamiles,
                  width: 30.0, height: 30.0, fit: BoxFit.cover),
              new Text(' Asia Miles',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                      fontSize: 16.0)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: _asiamileController,
            keyboardType: TextInputType.number,
            maxLength: 19,
            style:
                TextStyle(fontFamily: UIData.ralewayFont, color: Colors.black),
            decoration: InputDecoration(
              labelStyle: TextStyle(
                  fontFamily: 'Quicksand', color: Colors.grey, fontSize: 14.0),
            ),
          ),
        ),
      ],
    );
  }

  buildRedeemCoupon() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: <Widget>[
              new Text(' Redeem Coupon',
                  style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                      fontSize: 16.0)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: TextField(
            controller: _redeemCoupon,
            keyboardType: TextInputType.number,
            maxLength: 19,
            style:
                TextStyle(fontFamily: UIData.ralewayFont, color: Colors.black),
            decoration: InputDecoration(
              labelStyle: TextStyle(
                  fontFamily: 'Quicksand', color: Colors.grey, fontSize: 14.0),
            ),
          ),
        ),
      ],
    );
  }

  showSuccessDialog() {
    Future.delayed(Duration(seconds: 1)).then((_) => goToDialog());
  }

  goToDialog() {
    showDialog(
        context: _context,
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => new EatIdecideScreen()));;
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
                    subtitle: "Your transaction was successful \n                  ETA 15 mins \n       Please wait for the Ring",
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

