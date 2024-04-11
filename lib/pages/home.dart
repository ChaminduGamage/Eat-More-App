import 'package:eat_more/pages/order.dart';
import 'package:eat_more/services/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:eat_more/pages/details.dart';
import 'package:eat_more/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? profile, name, email;
  bool icecream = false, pizza = false, salad = false, burger = false;

  getthesharedpref() async {
    profile = await SharedPreferenceHelper().getUserProfile();
    name = await SharedPreferenceHelper().getUserName();
    email = await SharedPreferenceHelper().getUserEmail();
    setState(() {});
  }

  onthisload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    onthisload();
    super.initState();
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
                            builder: (context) => const Order(),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Details()));
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
                                Image.asset(
                                  "images/SeafoodCheeseKottu.png",
                                  width: 150.0,
                                  height: 150.0,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "Seafood Cheese",
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  "Free and Healthy",
                                  style: AppWidget.LightTextFieldStyle(),
                                ),
                                Text(
                                  "Rs.2340",
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/EggCheeseKottu.png",
                                width: 150.0,
                                height: 150.0,
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Egg Cheese Kottu",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "Spicy with cheese",
                                style: AppWidget.LightTextFieldStyle(),
                              ),
                              Text(
                                "Rs.1680",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/EggRiceKottu.png",
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20.0),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Egg Rice Kottu-   SMALL -",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Sipicy Kottu with rice",
                                style: AppWidget.LightTextFieldStyle(),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Rs.1430",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/CuttlefishKottu.png",
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20.0),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Cuttle Fish Kottu-   SMALL -",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Better than ever",
                                style: AppWidget.LightTextFieldStyle(),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Rs.2800",
                                style: AppWidget.semiBoldTextFieldStyle(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
          onTap: () {
            setState(() {
              icecream = true;
              pizza = false;
              salad = false;
              burger = false;
              setState(() {});
            });
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
          onTap: () {
            setState(() {
              icecream = false;
              pizza = true;
              salad = false;
              burger = false;
              setState(() {});
            });
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
          onTap: () {
            setState(() {
              icecream = false;
              pizza = false;
              salad = true;
              burger = false;
              setState(() {});
            });
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
          onTap: () {
            setState(() {
              icecream = false;
              pizza = false;
              salad = false;
              burger = true;
              setState(() {});
            });
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
