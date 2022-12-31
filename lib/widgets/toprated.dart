import 'package:flutter/material.dart';

//ui part

class TopRate extends StatelessWidget {
  final List toprated;
  const TopRate({Key? key,required this.toprated}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(left:10,right:10,top:10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text('Top Rated Movies',
          style:TextStyle(fontSize: 27,fontWeight: FontWeight.w800,color: Colors.brown[800])),
          SizedBox(height:10),
          Container(height:270,
          child:ListView.builder(
            itemCount: toprated.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return InkWell(
               onTap: () {
                 
               },
               child:Container(
                width: 137,
                child:Column(
                  children: [
                    Container(
                      height:200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        image:DecorationImage(
                        image:NetworkImage(
                          'http://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
                        )
                      )
                    ),
                    ),
                   SizedBox(height: 5),
                    Container(
                      child:Text(
                        toprated[index]['title'] != null ?  toprated[index]['title']: 'Loading',
                        style: TextStyle(color: Colors.brown[800],fontWeight: FontWeight.w500),
                        )
                    )
                  ],
                  )
               )
              );
            }
          )
      )
      ]
      )
    );
  }
}