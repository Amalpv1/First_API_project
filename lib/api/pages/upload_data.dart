import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class uploadData extends StatelessWidget {
   uploadData({Key? key}) : super(key: key);
  TextEditingController titlecntrlr = TextEditingController();
  TextEditingController categorycntrlr = TextEditingController();
  TextEditingController imagecntrlr = TextEditingController();
  TextEditingController descriptioncntrlr = TextEditingController();
  TextEditingController pricecntrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api upload'),
      ),
      body: Column(
        children: [
          TextField(
            controller:titlecntrlr ,
            decoration: InputDecoration(
              label: Text('title')
            ),
          ),
          TextField(
            controller: pricecntrlr,
            decoration: InputDecoration(
              label: Text('price')
            ),
          ),TextField(
            controller: descriptioncntrlr,
            decoration: InputDecoration(
              label: Text('description')
            ),
          ),TextField(
            controller: imagecntrlr,
            decoration: InputDecoration(
              label: Text('image')
            ),
          ),TextField(
            controller: categorycntrlr,
            decoration: InputDecoration(
              label: Text('catogery')
            ),
          ),
          ElevatedButton(onPressed: () async{
            var url = Uri.parse('https://fakestoreapi.com/products');
            print( double.parse(pricecntrlr.text));
            var response = await http.post(url, body:  {
                    'title': titlecntrlr.text,
                    'price': pricecntrlr.text,
                    'description': descriptioncntrlr.text,
                    'image': 'https://i.pravatar.cc',
                    'category': categorycntrlr.text
                });
                print('Response body: ${response.body}');


          }, child: Text('click here'))
        ],
      ),
    );
  }
}