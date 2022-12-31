import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Description extends StatelessWidget {
  final String description,
  banner,
  poster,
  rating,
  release_date;
  final String? name;
  
  const Description(
    {Key? key,
    this.name,
    required this.description,
    required this.banner,
    required this.poster,
    required this.rating,
    required this.release_date})
    :super(key :key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body:Container(
        child:ListView(
          children: [
            Container(
              height:250,
              child:Stack(
                children: [
                  Positioned(child: Container(
                    height:250,
                    width:MediaQuery.of(context).size.width,
                    child: Image.network(banner,fit:BoxFit.cover),
                    )),
                    Positioned(
                      bottom: 10,
                      child:Text(
                        ' ⭐ Average Rating  '+rating,
                        style:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          backgroundColor: Colors.black,
                          color: Colors.white)
                          ),
                      ),
                ]
                )
            ),
            SizedBox(height:15),
            Container(
              padding: EdgeInsets.all(10),
              child:Text(name ?? 'Not Loaded',
              style:TextStyle(
                color:Color.fromARGB(255, 47, 29, 26),
                fontWeight: FontWeight.bold,
                fontSize: 25 )
              )
            ),
            Container(
              padding: EdgeInsets.only(left:10),
              child:Text('Releasing On : ' + release_date,
              style:TextStyle(fontWeight: FontWeight.w500)
              )
            ),
            Row(
              children: [
                Container(
                padding: EdgeInsets.only(left:5),
                height: 200,
                width: 100,
                child: Image.network(poster),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(description,
                    style:TextStyle(
                    color: Color.fromARGB(255, 40, 26, 23),
                    fontWeight: FontWeight.w700
                     ))
                    ),
                )

              ],)
          ],
          )
        ,)
    );
  }
}