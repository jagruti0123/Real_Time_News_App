class EduNewsModel {
  int? totalArticles;
  String? error;
  List<Articles>? articles;

  EduNewsModel({this.totalArticles, this.articles});

  EduNewsModel.fromJson(Map<String, dynamic> json) {
    totalArticles = json['totalArticles'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  EduNewsModel.withError(String errorMessage) {
    error = errorMessage;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalArticles'] = this.totalArticles;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? title;
  String? description;
  String? content;
  String? url;
  String? image;
  String? publishedAt;
  Source? source;

  Articles(
      {this.title,
        this.description,
        this.content,
        this.url,
        this.image,
        this.publishedAt,
        this.source});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    content = json['content'];
    url = json['url'];
    image = json['image'];
    publishedAt = json['publishedAt'];
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['content'] = this.content;
    data['url'] = this.url;
    data['image'] = this.image;
    data['publishedAt'] = this.publishedAt;
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    return data;
  }
}

class Source {
  String? name;
  String? url;

  Source({this.name, this.url});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}


// class EduNewsModel {
//   String? status;
//   String? error;
//   int? totalResults;
//   List<Results>? results;
//   Null? nextPage;
//
//   EduNewsModel({this.status, this.totalResults, this.results, this.nextPage});
//
//   EduNewsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     totalResults = json['totalResults'];
//     if (json['results'] != null) {
//       results = <Results>[];
//       json['results'].forEach((v) {
//         results!.add(new Results.fromJson(v));
//       });
//     }
//     nextPage = json['nextPage'];
//   }
//
//   EduNewsModel.withError(String errorMessage) {
//     error = errorMessage;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['totalResults'] = this.totalResults;
//     if (this.results != null) {
//       data['results'] = this.results!.map((v) => v.toJson()).toList();
//     }
//     data['nextPage'] = this.nextPage;
//     return data;
//   }
// }
//
// class Results {
//   String? articleId;
//   String? title;
//   String? link;
//   Null? keywords;
//   List<String>? creator;
//   Null? videoUrl;
//   String? description;
//   String? content;
//   String? pubDate;
//   String? imageUrl;
//   String? sourceId;
//   String? sourceUrl;
//   int? sourcePriority;
//   List<String>? country;
//   List<String>? category;
//   String? language;
//   String? aiTag;
//   String? sentiment;
//   String? sentimentStats;
//   String? aiRegion;
//
//   Results(
//       {this.articleId,
//         this.title,
//         this.link,
//         this.keywords,
//         this.creator,
//         this.videoUrl,
//         this.description,
//         this.content,
//         this.pubDate,
//         this.imageUrl,
//         this.sourceId,
//         this.sourceUrl,
//         this.sourcePriority,
//         this.country,
//         this.category,
//         this.language,
//         this.aiTag,
//         this.sentiment,
//         this.sentimentStats,
//         this.aiRegion});
//
//   Results.fromJson(Map<String, dynamic> json) {
//     articleId = json['article_id'];
//     title = json['title'];
//     link = json['link'];
//     keywords = json['keywords'];
//     creator = json['creator'].cast<String>();
//     videoUrl = json['video_url'];
//     description = json['description'];
//     content = json['content'];
//     pubDate = json['pubDate'];
//     imageUrl = json['image_url'];
//     sourceId = json['source_id'];
//     sourceUrl = json['source_url'];
//     sourcePriority = json['source_priority'];
//     country = json['country'].cast<String>();
//     category = json['category'].cast<String>();
//     language = json['language'];
//     aiTag = json['ai_tag'];
//     sentiment = json['sentiment'];
//     sentimentStats = json['sentiment_stats'];
//     aiRegion = json['ai_region'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['article_id'] = this.articleId;
//     data['title'] = this.title;
//     data['link'] = this.link;
//     data['keywords'] = this.keywords;
//     data['creator'] = this.creator;
//     data['video_url'] = this.videoUrl;
//     data['description'] = this.description;
//     data['content'] = this.content;
//     data['pubDate'] = this.pubDate;
//     data['image_url'] = this.imageUrl;
//     data['source_id'] = this.sourceId;
//     data['source_url'] = this.sourceUrl;
//     data['source_priority'] = this.sourcePriority;
//     data['country'] = this.country;
//     data['category'] = this.category;
//     data['language'] = this.language;
//     data['ai_tag'] = this.aiTag;
//     data['sentiment'] = this.sentiment;
//     data['sentiment_stats'] = this.sentimentStats;
//     data['ai_region'] = this.aiRegion;
//     return data;
//   }
// }
