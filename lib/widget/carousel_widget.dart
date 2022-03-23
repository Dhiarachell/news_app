import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/articles.dart';
import 'package:news_app/screen/detail_page.dart';
import 'package:news_app/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList ;
  CarouselWidget(this.articleList);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  //fungfi late itu sama kaya string
  late List<Widget> imageSlider ;

  @override
  void initState() {
    imageSlider =  widget.articleList.map((article) =>
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(article)));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(article.urlToImage.toString())
              )
            ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.1, 0.9],
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.white.withOpacity(0.1),
                          ]
                      ),
                  ),
                ),
                Positioned(
                    bottom: 30,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article.title.toString(), style: titleArticleHeadline.copyWith(
                              fontSize: 12
                          ),
                          ),
                          SizedBox(height: 10,),
                          Text(article.author.toString(), style: authorDateArticle.copyWith(
                            fontSize: 10,

                          ),)
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
    )
    ).toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: imageSlider,
        options: CarouselOptions(
          autoPlay: true,
            viewportFraction: 1
        ),

      ),
    );
  }
}
