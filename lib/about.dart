import 'package:flutter/material.dart';

class ContentAbout extends StatelessWidget {
  const ContentAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: const Text("Welcome to PURA GROUP",
              style: TextStyle(
                  color: Colors.deepPurple,fontSize: 28
              ),
            ),
          ),
          const Text("YOUR HI-TECH INDUSTRIAL PARTNER",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: const Text("PURA started as early as 1908 when the company was still a letterpress printing shop. Then in 1970, the third generation initiated a steady movement to develop the company into the renowned Pura Group, a modern corporation as we see today. PURA has been living the philosophy of producing special innovative products as import substitute for local market and export commodity for international market. After more than four decades, PURA now has become an expansive industrial group with 30 integrated production divisions built on over 120-hectare area, accommodating 15,000 workforces, exporting products to more than 100 countries."),
          ),
          SizedBox(
            height: 100,
            child: Image.asset("assets/about.jpg"),
          ),
          const Text("We are private-owned company with the most patents in Indonesia. PURA has registered many of its innovations into more than 200 patents and more coming in the future."),

        ],
      ),
    );
  }
}