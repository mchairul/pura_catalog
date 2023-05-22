import 'package:flutter/material.dart';
import 'package:pura_catalog/list_product.dart';


class HalamanProducts extends StatelessWidget {

  //List untuk data daftarProduct (yang akan ditampilkan)
  List<DaftarProduct>  daftarProduct = [
    DaftarProduct(id: "1", name: "SMART TECHNOLOGY"),
    DaftarProduct(id: "2", name: "PAPER MILL"),
    DaftarProduct(id: "3", name: "ROTOGRAVURE PRINTED PACKAGING"),
    DaftarProduct(id: "4", name: "FLEXOGRAPHIC PRINTING"),
    DaftarProduct(id: "5", name: "PRINTING INK"),
  ];


  @override
  Widget build(BuildContext context){
    return Column(
      //parse List DaftarProduct
      children: daftarProduct.map((product) { //loop daftarProduct
        return   Card(
          color: Colors.cyan,
          child: ListTile(
            title: Text(product.name),
            trailing: IconButton(
              icon: Icon(Icons.remove_red_eye),
              onPressed: () => {
                //ketika tombol icon mata diklik
                debugPrint('icon eye clicked'),
                Navigator.push(context, MaterialPageRoute(builder: (_){
                  return ListProduct(id:product.id, name: product.name,);
                }))
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DaftarProduct {
  String id;
  String name;
  DaftarProduct({required this.id, required this.name});
}
