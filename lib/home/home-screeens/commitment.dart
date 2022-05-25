import 'package:flutter/material.dart';
import 'package:petshelt/home/home-screeens/homeless.dart';
import 'package:petshelt/home/home-screeens/shop.dart';
import '../newpostevent/commetimentNewpost.dart';
import '../newpostevent/commitList.dart';
import 'adoption.dart';
import 'knowing.dart';

class Commitment extends StatelessWidget {
  static const String routeName = 'commit';

  get current_user => null;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  Color.fromARGB(255, 118, 189, 178),

          leading: IconButton(
            icon:Icon(Icons.menu),
            hoverColor: Colors.black,
            onPressed: () {
              print('hello');
            },
            color: Colors.white,
          ),
          title : Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text('commitment',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400,fontStyle: FontStyle.normal,fontFamily: 'Inter',color: Color.fromARGB(255,250, 250, 250),),),
            //Pet\$helt
          ),
          bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 197, 225, 208),
            actions: [
              Expanded(child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Adoption()));
              }, icon: Image.asset('assets/images/adopt.png',))),
              Expanded(child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homeless()));
              }, icon: Image.asset('assets/images/catt.png',))),
              Expanded(child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Knowing()));
              }, icon: Image.asset('assets/images/know.png',))),
              Expanded(child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Commitment()));
              }, icon: Image.asset('assets/images/commit.png',))),
              Expanded(child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Shopping()));
              }, icon: Image.asset('assets/images/shop.png',))),
            ],
          ),
        ),
        body: TabBarView(
          children: [CommitPostList()],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 197, 225, 208),
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CommitNewpost()));

          },
        ),
      ),
    );

  }
}