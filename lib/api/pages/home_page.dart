import 'dart:convert';

import 'package:first_api_project/api/model/model_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var number = 1;
  Future getdata()async{
    var res = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var jsonresponse =jsonDecode(res.body);
    List<product>products = [];
    for(var data in jsonresponse){
      product prod = product(title: data["title"], price: data["price"], category: data["category"], description: data["description"], image: data["image"]);
      products.add(prod);
    }
    return products;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('API')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.add), Text('add list')],
              ),
            ),
            Card(
              child:FutureBuilder(
                future: getdata(),
                builder: (context,AsyncSnapshot snapshot ){
                if(snapshot.data!=null){
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                physics: ScrollPhysics(parent: null),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  
                  return Container(
                      child: Container(
                    color:index.isEven? Colors.lightBlue : Color.fromARGB(255, 171, 207, 203),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 35,
                        child: Image.network(snapshot.data[index].image)
                      ),
                      title: Text(snapshot.data[index].title),
                      subtitle: Column(
                        children: [
                          Text(snapshot.data[index].category),
                          Text(snapshot.data[index].description),
                          Text('${snapshot.data[index].price}')
                        ],
                      ),
                      trailing:
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                IconButton(onPressed: (){
                                  print('edit');
                                }, icon: Icon(Icons.edit)),
                                IconButton(onPressed: () {
                                  print('delete');
                                }, icon: Icon(Icons.delete)),
                              ],
                            ),
                          ),
                    ),
                  ));
                },
                
              );
                }else{
                  return const Center(child: Text('Loading.......................'),);
                }
              })
            ),
          ],
        ),
      ),
    );
  }
}
