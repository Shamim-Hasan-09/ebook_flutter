import 'dart:ui';
import 'package:ebook_flutter/colorScheme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:ebook_flutter/BookInfo.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(
        fontFamily: 'avenir',

      ),
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
      routes: {
        '/book_info':(context)=>BookInfo(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          child: Row(
            children: <Widget>[
              Text("BO", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900
              ),),
              Column(
                children: <Widget>[
                  Text("O",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900
                  ),),
                  Container(
                    height: 3,
                    width: 15,
                    color: Colors.white,
                  )
                ],
              ),
              Text("KLY", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900
              ),),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: <Widget>[Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                   child: CarouselSlider(
                      options: CarouselOptions(
                        height: 230,
                        viewportFraction: 0.44,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                      ),
                      items: imageSliders,
                    ),
                ),
                SizedBox(height: 20,),

                Text("Best Seller", style: TextStyle(
                    fontFamily: 'montserrat',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Container (
                      height: 450,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          bestSellerWidget('book1.png', 'Harry Potter \nand the Goblet of Fire', 'J.K. Rowling', '1.68', '2.8', '369'),
                          bestSellerWidget('book2.png', 'The Jungle Book', 'Rudyard Kipling', '8.34', '2.8', '2369'),
                          bestSellerWidget('book3.png', 'Star Wars \nReturn of the Jedi', 'George Lucas', '7.89', '2.9', '269'),
                          bestSellerWidget('book4.png', 'The Dark Knight Rises', 'Christopher Nolan', '6.49', '3.9', '239'),
                          bestSellerWidget('book5.jpg', 'Crying in H Mart', 'Book by Michelle Zauner', '6.49', '3.9', '239'),
                          bestSellerWidget('book6.jpg', 'Lolita', 'Christopher Nolan', '6.49', '3.9', '239'),
                          bestSellerWidget('book7.jpg', 'The Lincoln Highway: A Novel', 'Novel by Amor Towles', '6.49', '3.9', '239'),
                          bestSellerWidget('book8.jpg', 'Lolita', 'Novel by Vladimir Nabokov', '6.49', '3.9', '239'),

                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,

              child: ClipRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 200,
                      height: 50,

                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.grey.shade200.withOpacity(0.3)
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                                CupertinoIcons.book_solid,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.tag_solid,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.collections_solid,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
  static List<String> imgList = [
    'assets/images/bookcover/book1.png',
    'assets/images/bookcover/book2.png',
    'assets/images/bookcover/book3.png',
    'assets/images/bookcover/book1.png',
    'assets/images/bookcover/book2.png',
    'assets/images/bookcover/book3.png',
    'assets/images/bookcover/book4.jpg',
    'assets/images/bookcover/book1.png',
    'assets/images/bookcover/book2.png',
    'assets/images/bookcover/book3.png',
  ];
  final List<Widget> imageSliders = imgList.map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 230,
            width: 155,
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage(item),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX:10, sigmaY: 10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.grey.shade200.withOpacity(0.5),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )


        ],
      ),
    ),
  )).toList();

  Container bestSellerWidget(String img, String bookName, String author, String price, String rating, String totalRatings)
  {
    return Container(
      child: InkWell(
        onTap: openBookPreview,
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: '$img',
                child: Container(
                  width: 70,
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/best_seller/$img'),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 260,
                    padding: EdgeInsets.all(5),
                    child: Text("$bookName",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text("$author", style: TextStyle(
                      fontFamily: 'montserrat',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 5,),
                  Container(
                    width: 215,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("\$$price", style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900
                        ),),
                        Row(
                          children: <Widget>[
                            Text("$rating", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),),
                            Text("($totalRatings)", style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300
                            ),),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
void openBookPreview()
{
  Navigator.pushNamed(context, '/book_info');
}
}