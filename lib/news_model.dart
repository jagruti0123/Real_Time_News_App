import 'package:flutter/material.dart';

class NewsData{
  String? title;
  String? content;
  String? urlToImage;
  String? date;
  String? author;

  NewsData(
      this.title,
      this.author,
      this.content,
      this.date,
      this.urlToImage
      );
  static List<NewsData> todays_News_Data = [
    NewsData('NETFLIX caught in the cross hairs over take down requests in India, Malaysia','Author', 'content', 'date', 'https://tse3.mm.bing.net/th?id=OIP.NxYauFbvf6Vjo6Pd2xDMagHaEY&pid=Api&P=0&h=180'),
    NewsData('Mamata Banerjee refuses to discuss Bengal seat sharing with Congress a head of lok Sabha polls', 'author', 'content', 'date', 'https://www.livemint.com/lm-img/img/2024/01/12/600x338/PTI01-11-2024-000190A-0_1705036499646_1705036680234.jpg'),
    NewsData('Atal Setu Inauguration: All You Need To Know About The Mumbai Trans Harbour Link', 'author', 'content', 'date', 'https://im.indiatimes.in/content/2024/Jan/584A42FC-832F-4C20-AAA4-63C177278D47_65a0bf8ecd5ae.jpg'),
    NewsData('Ayodhya Ram Mandir Inauguration: Date, time, passes, all you need to know', 'author', 'content', 'date', 'https://tse1.mm.bing.net/th?id=OIF.RdhGd0%2fEnoOdYvyQTT59QQ&pid=Api&P=0&h=180')
  ];
}