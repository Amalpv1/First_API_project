// ListView.builder(
//                 physics: ScrollPhysics(parent: null),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return Container(
//                       child: Container(
//                     color:index.isEven? Colors.lightBlue : Color.fromARGB(255, 171, 207, 203),
//                     child: ListTile(
//                       leading: CircleAvatar(),
//                       title: Text('title'),
//                       subtitle: Text('subtitle'),
//                       trailing:
//                           SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
//                                 IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
//                               ],
//                             ),
//                           ),
//                     ),
//                   ));
//                 },
//                 itemCount: number,
//               ),