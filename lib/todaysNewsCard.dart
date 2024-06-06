import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_api_task/news_model.dart';

class TodaysNewsCard extends StatefulWidget {
  TodaysNewsCard(this.data, {Key? key}) : super(key: key);
  NewsData data;

  @override
  State<TodaysNewsCard> createState() => _TodaysNewsCardState();
}

class _TodaysNewsCardState extends State<TodaysNewsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 250,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.data.urlToImage!)
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(colors: [Colors.transparent,Colors.black87],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
          )
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text(widget.data.title!,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text:widget.data.title!,
                  style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('Clicked on Text');
                      }
                ),
              ]),
            ),
            SizedBox(
              height: 0.8,
            ),
            Text(widget.data.author! ,style: TextStyle(color: Colors.white54,fontSize: 14,fontWeight: FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
