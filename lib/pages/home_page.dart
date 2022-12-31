import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie2_app/widgets/nowplay.dart';
import 'package:movie2_app/widgets/popular.dart';
import 'package:movie2_app/widgets/toprated.dart';
import 'package:movie2_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movie2_app/widgets/trending.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingMovies=[];
  List topRatedMovies=[];
  List popularMovies=[];
  List nowPlaying=[];

  final String api_key='b653e773640c6b298aacdac3d009a197';
  final String accesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjUzZTc3MzY0MGM2YjI5OGFhY2RhYzNkMDA5YTE5NyIsInN1YiI6IjYzYWIwZWZkMWY3NDhiMDA3ZGEwMDAwMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.plw9Nb5bp4v9GU2CYkMu_wtj_QDYXvDUpSU5EUP3hd8';

  @override
  void initState(){
    loadMovies();
    super.initState();
  }

  //function to load trending movies
  loadMovies() async{
    //initialse TMDB object
    TMDB tmdb=TMDB(ApiKeys(api_key,accesstoken),
    logConfig:ConfigLogger(
      showErrorLogs:true,
      showLogs: true 
      )
      );
      Map trendingRes=await tmdb.v3.trending.getTrending();
      Map topRatedRes=await tmdb.v3.movies.getTopRated();
      Map popularRes=await tmdb.v3.movies.getPopular();
      Map nowPlayingRes=await tmdb.v3.movies.getNowPlaying();

      setState(() {
        trendingMovies=trendingRes['results'];
        topRatedMovies=topRatedRes['results'];
        popularMovies=popularRes['results'];
        nowPlaying=nowPlayingRes['results'];
      });
      print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title:Text('Welcome!'),
        actions:<Widget> [
         IconButton(
          onPressed:()=>{
          FirebaseAuth.instance.signOut(),
          }, 
          icon:Icon(Icons.logout_outlined)
          )
        ],
      ),
      backgroundColor: Colors.brown[100],
     body:ListView(
      children:[
        TrendingM(trending: trendingMovies),
        PopularM(popMov: popularMovies),
        TopRate(toprated: topRatedMovies),
        NowPlay(nowplay:nowPlaying),
        ],
       ),
      );
  }
}