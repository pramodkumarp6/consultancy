import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api/app_url.dart';
import 'model/Post_Model.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
   List<PostModel> postList = [];
  Future<List<PostModel>> getUserApi ()async{
    final response = await http.get(Uri.parse(AppUrl.baseurl));
  var data = jsonDecode(response.body.toString());
  if(response.statusCode == 200){
      for(Map i in data){
        postList.add(PostModel.fromJson(i));
     print(data.toString());
      }
      return postList;
  }else{
      return postList;
  }


  }




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ApiModel"),
      ),
      body: Column(
        children: [


        Expanded(
          child: FutureBuilder(
          future: getUserApi()
            ,  builder: (context, snapshot){
            if(!snapshot.hasData){
                return Text("Loding");
            }else{
              return ListView.builder(itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tilte',style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),),
                        Text('Description',style: TextStyle(fontSize: 25,color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                        Text('',style: TextStyle(fontSize: 25,color: Colors.deepPurple, fontWeight: FontWeight.bold),),


                        Text('Title\n'+postList[index].title.toString(),style: TextStyle(fontSize: 20,color: Colors.red)),
                        Text('Description\n'+postList[index].body.toString(),style: TextStyle(fontSize: 20,color: Colors.deepPurple))

                      ],
                  ),
                ) ;
              });


            }

          },
          ),
        )

      ],),
    );
  }
}
