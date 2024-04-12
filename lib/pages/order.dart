import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_more/services/database.dart';
import 'package:eat_more/services/shared_pref.dart';
import 'package:eat_more/widget/widget_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Stream? foodStream;
  String? id;
  int total = 0;

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      setState(() {});
    });
  }

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    foodStream = await DatabaseMethods().getFoodCart(id!);
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    startTimer();
    super.initState();
  }

  Widget foodCart() {
    return StreamBuilder(
        stream: foodStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    int productTotal =
                        int.parse(ds["Total"]) * int.parse(ds["Quantity"]);
                    total = total + productTotal;
                    return Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0)),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 70.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(child: Text(ds["Quantity"])),
                              ),
                              SizedBox(width: 20.0),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60.0),
                                child: Image.network(ds["Image"],
                                    width: 70.0,
                                    height: 70.0,
                                    fit: BoxFit.cover),
                              ),
                              SizedBox(width: 40.0),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(ds["Name"],
                                        style:
                                            AppWidget.semiBoldTextFieldStyle()),
                                    Text("\Rs." + ds["Total"],
                                        style:
                                            AppWidget.semiBoldTextFieldStyle())
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text("Food Cart",
                      style: AppWidget.HeadlineTextFieldStyle()),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                child: foodCart()),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Text(
                    "Rs." + total.toString(),
                    style: AppWidget.semiBoldTextFieldStyle(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Center(
                    child: Text("CheckOut",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)))),
          ],
        ),
      ),
    );
  }
}
