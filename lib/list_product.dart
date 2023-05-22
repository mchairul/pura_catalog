import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pura_catalog/appbar.dart';
import 'package:pura_catalog/image_view.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key, required this.id, required this.name});
  final String id;
  final String name;

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct>
{
  // cara awal dengan menggunakan list
  //List imagesSmart = [
  //  "assets/cell2.jpeg",
  //  "assets/emoney.jpeg",
  //];
  //List imagesPapermill = [
  //  "assets/banknote.jpeg",
  //  "assets/securitypaper.jpeg",
  //];
  //late List list;

  List _items = [];

  Future<void> createWidgetFromJson() async {
    //
    late String stringfile;
    if(widget.id == "1") {
      stringfile = 'assets/smart_technology.json';
    } else if(widget.id == "2") {
      stringfile = 'assets/paper_mill.json';
    } else if(widget.id == "3") {
      stringfile = 'assets/rotogravure.json';
    } else if(widget.id == "4") {
      stringfile = 'assets/flexographic.json';
    } else if(widget.id == "5") {
      stringfile = 'assets/printink.json';
    }
    final String response = await rootBundle.loadString(stringfile);
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }


  @override
  void initState() {
    super.initState();
    createWidgetFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body:
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Card(
              child: GestureDetector(
                onTap: () {
                  debugPrint(_items[index]["images"] + " image clicked");
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return ImageView(images: _items[index]["images"],);
                  }));
                },
                child: Image.asset(
                  _items[index]["images"],
                ),
              ),
            );
          },
        )



        //GridView.count(
        //  crossAxisCount: 2,
        //  padding: EdgeInsets.all(25),
        //  children: [
        //  //cara awal diparse dari list
        //  //for(var item in list ) Card(child: Image.asset(item),)
        //  ]
        //),
    );
  }
}
