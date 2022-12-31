import 'package:flutter/material.dart';
import 'package:movie2_app/pages/description.dart';

//ui part

class TrendingM extends StatelessWidget {
  final List trending;
  const TrendingM({Key? key,required this.trending}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(left:10,right:10,top:15),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          SizedBox(height: 5),
          Text('Trending Movies',
          style:TextStyle(fontSize: 27,fontWeight: FontWeight.w800,color: Colors.brown[800])),
          SizedBox(height:10),
          Container(height:270,
          child:ListView.builder(
            itemCount: trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder:(context, index) {
              return InkWell(
               onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>Description(
                  name: trending[index]['title'],
                  banner:'https://image.tmdb.org/t/p/w500' +trending[index]['backdrop_path'],
                  poster:'https://image.tmdb.org/t/p/w500' +trending[index]['poster_path'],
                  description: trending[index]['overview'],
                  rating: trending[index]['vote_average'].toString(),
                  release_date: trending[index]['release_date'],
                )));
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
                          'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                        )
                      )
                    ),
                    ),
                    SizedBox(height:5),
                    Container(
                      child:Text(
                        trending[index]['title'] != null ?  trending[index]['title']: 'Loading',
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