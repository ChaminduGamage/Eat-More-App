import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eat_more/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                Image.asset(
                  "images/SeafoodCheeseKottu.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Seafood ",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                        Text(
                          "Cheese Kottu",
                          style: AppWidget.boldTextFieldStyle(),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (a > 1) {
                          --a;
                        }

                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(a.toString(),
                        style: AppWidget.semiBoldTextFieldStyle()),
                    SizedBox(width: 20.0),
                    GestureDetector(
                      onTap: () {
                        ++a;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  maxLines: 4,
                  style: AppWidget.LightTextFieldStyle(),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      "Delivery Time",
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                    SizedBox(width: 25.0),
                    Icon(Icons.alarm, color: Colors.black54),
                    SizedBox(width: 5.0),
                    Text("30 min", style: AppWidget.semiBoldTextFieldStyle()),
                  ],
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Price",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                        Text(
                          "Rs.2340.00",
                          style: AppWidget.HeadlineTextFieldStyle(),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Add to Cart",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: 30.0,
                          ),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
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
  }
}
