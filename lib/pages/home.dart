import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_more/pages/order.dart';
import 'package:eat_more/pages/profile.dart';
import 'package:eat_more/services/database.dart';
import 'package:eat_more/services/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eat_more/pages/details.dart';
import 'package:eat_more/widget/widget_support.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? profile, name, email;
  bool icecream = false, pizza = true, salad = false, burger = false;

  Stream? foodItemStream;

  getthesharedpref() async {
    profile = await SharedPreferenceHelper().getUserProfile();
    name = await SharedPreferenceHelper().getUserName();
    email = await SharedPreferenceHelper().getUserEmail();
    setState(() {});
  }

  onthisload() async {
    await getthesharedpref();
    foodItemStream = await DatabaseMethods().getFoodItems("Pizza");
    setState(() {});
  }

  @override
  void initState() {
    onthisload();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    detail: ds["Detail"],
                                    image: ds["Image"],
                                    name: ds["Name"],
                                    price: ds["Price"])));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  ds["Name"],
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  ds["Detail"],
                                  style: AppWidget.LightTextFieldStyle(),
                                ),
                                Text(
                                  "Rs." + ds["Price"],
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: foodItemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    detail: ds["Detail"],
                                    image: ds["Image"],
                                    name: ds["Name"],
                                    price: ds["Price"])));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20.0, bottom: 20),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    ds["Image"],
                                    width: 120.0,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds["Name"],
                                        style:
                                            AppWidget.semiBoldTextFieldStyle(),
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds["Detail"],
                                        style: AppWidget.LightTextFieldStyle(),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        ds["Price"],
                                        style:
                                            AppWidget.semiBoldTextFieldStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 50.0,
            left: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello ${name ?? ''},",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Profile(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                "Delicious Food",
                style: AppWidget.HeadlineTextFieldStyle(),
              ),
              Text(
                "Discover and Get Great Food",
                style: AppWidget.LightTextFieldStyle(),
              ),
              const SizedBox(height: 20.0),
              Container(
                  margin: const EdgeInsets.only(right: 20), child: showItem()),
              const SizedBox(height: 30.0),
              Container(height: 270, child: allItems()),
              const SizedBox(height: 30.0),
              allItemsVertically(),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;

            foodItemStream = await DatabaseMethods().getFoodItems("Ice-Cream");

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/ice-cream.png",
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                  color: icecream ? Colors.white : Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;

            foodItemStream = await DatabaseMethods().getFoodItems("Pizza");

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/pizza.png",
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                  color: pizza ? Colors.white : Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;

            foodItemStream = await DatabaseMethods().getFoodItems("Salad");

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/salad.png",
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                  color: salad ? Colors.white : Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;

            foodItemStream = await DatabaseMethods().getFoodItems("Burger");

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/burger.png",
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                  color: burger ? Colors.white : Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
