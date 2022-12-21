import 'dart:convert';

import 'package:consultancy/model/Post_Model.dart';
import 'package:consultancy/utils/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<PostModel> postList = [];

  Future<List<PostModel>> getPapa() async {
    final response = await http.get(Uri.parse(AppUrl.baseurl));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));

        print(data.toString());
      }
      return postList;
    } else {
      return postList;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api11Model"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPapa(),
              builder: (BuildContext context, snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loding");
                } else {
                  return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tilte',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('Title\n' + postList[index].title.toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red)),
                              Text(
                                  'Description\n' +
                                      postList[index].body.toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.deepPurple))
                            ],
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
