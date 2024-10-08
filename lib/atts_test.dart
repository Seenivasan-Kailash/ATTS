import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled/api_model.dart';
import 'package:untitled/api_service.dart';

class AttsTest extends StatefulWidget {

  @override
  State<AttsTest> createState() => _AttsTestState();
}

class _AttsTestState extends State<AttsTest> {
  List<Movie> list =[];

  fetchData() async {
    Response response = await ApiService.instance.fetchDataFromApi();
    if(response.statusCode ==200){
      setState(() {
        list = ApiList.fromJson(jsonDecode(response.body)).movieList;

      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState

    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ATTS TEST",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
      ),

      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (cotext,index){
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(
                      children: [
                        TextSpan(text: "Serial No \t",style:  TextStyle(color: Colors.black87,fontSize: 15,fontWeight: FontWeight.w400)),

                        TextSpan(text: "${index+1}",style:  TextStyle(color: Colors.indigo,fontSize: 15,fontWeight: FontWeight.w500))

                      ]
                    )),

                    Text.rich(TextSpan(
                        children: [
                          TextSpan(text: "Name \t",style:  TextStyle(color: Colors.black87,fontSize: 15,fontWeight: FontWeight.w400)),
                          TextSpan(text: list[index].name,style:  TextStyle(color: Colors.indigo,fontSize: 15,fontWeight: FontWeight.w500))

                        ]
                    )),


                  ],
                ),
              ),
            );
          }),
    );
  }
}
