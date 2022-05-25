import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home-screeens/saved.dart';
import 'firestoreUtils.dart';
import 'modelsss/post_homeless_model.dart';
class HomelessPostWidget extends StatelessWidget {
  Post_homeless opject;
  HomelessPostWidget(this.opject);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color:  Color.fromARGB(255, 197, 225, 208),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
          ]
      ),
      child: Column(
        children: [
          Row(children: [
            Container(
              // padding: EdgeInsets.symmetric(vertical: 24,horizontal: 24),
                height: 50,
                width: 46,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/images/test.png"),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(20)
                )
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('username',style: TextStyle(fontFamily:'Inter' ,fontWeight: FontWeight.w500,fontSize: 15),),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('10',style: TextStyle(fontFamily: 'Roboto',
                            fontSize: 13,fontWeight: FontWeight.w400,
                            color: Colors.grey[600]),),
                      ),
                      Icon(Icons.public,
                        color: Colors.grey[600],
                        size: 12.0,
                      ),
                    ],)],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      DeleteHomelessPost(opject).then((value){
                        showDialog(
                            context: context,
                            builder: (buildContext) {
                              Future.delayed(Duration(seconds: 3), () {
                                //Navigator.of(context).pop(true);
                              });
                              return AlertDialog(
                                title: Text(
                                  'Deleted successfully',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                              );
                            });

                      }).onError((error, stackTrace) {

                      }).timeout(Duration(seconds: 10),onTimeout: (){

                      });
                    },
                    child: Icon(Icons.delete_outline,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 25.0,
                    ),
                  ),
                ],
              ),
            ),

          ],),
          const SizedBox(height: 3.0,),

          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                        width: 250,

                        child: Text(opject.caption!)),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                child:Image.asset('assets/images/adopt.png',),)
              //Image.asset(item.imageUrl)),
              //Image.asset('assets/images/adopt.png',),
            ],
          ),

          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: ElevatedButton(
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 197, 225, 208),),

                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) => Saved()));

                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: ElevatedButton(
                  child: Text('Message'),
                  style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 197, 225, 208),),
                  onPressed: () {
                    print('Pressed');
                  },
                ),
              ),
            ),
          ],)

        ],
      ),
    ) ;
  }
}