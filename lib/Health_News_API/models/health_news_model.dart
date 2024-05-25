class HealthNewsModel {
  int? totalArticles;
  String? error;
  List<Articles>? articles;

  HealthNewsModel({this.totalArticles, this.articles});

  HealthNewsModel.fromJson(Map<String, dynamic> json) {
    totalArticles = json['totalArticles'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  HealthNewsModel.withError(String errorMessage) {
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



// class HealthNewsModel {
//   String? status;
//   String? error;
//   int? totalResults;
//   List<Articles>? articles;
//
//   HealthNewsModel({this.status, this.totalResults, this.articles});
//
//   HealthNewsModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     totalResults = json['totalResults'];
//     if (json['articles'] != null) {
//       articles = <Articles>[];
//       json['articles'].forEach((v) {
//         articles!.add(new Articles.fromJson(v));
//       });
//     }
//   }
//
//   HealthNewsModel.withError(String errorMessage) {
//     error = errorMessage;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['totalResults'] = this.totalResults;
//     if (this.articles != null) {
//       data['articles'] = this.articles!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Articles {
//   Source? source;
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? urlToImage;
//   String? publishedAt;
//   String? content;
//
//   Articles(
//       {this.source,
//         this.author,
//         this.title,
//         this.description,
//         this.url,
//         this.urlToImage,
//         this.publishedAt,
//         this.content});
//
//   Articles.fromJson(Map<String, dynamic> json) {
//     source =
//     json['source'] != null ? new Source.fromJson(json['source']) : null;
//     author = json['author'];
//     title = json['title'];
//     description = json['description'];
//     url = json['url'];
//     urlToImage = json['urlToImage'];
//     publishedAt = json['publishedAt'];
//     content = json['content'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.source != null) {
//       data['source'] = this.source!.toJson();
//     }
//     data['author'] = this.author;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['url'] = this.url;
//     data['urlToImage'] = this.urlToImage;
//     data['publishedAt'] = this.publishedAt;
//     data['content'] = this.content;
//     return data;
//   }
// }
//
// class Source {
//   String? id;
//   String? name;
//
//   Source({this.id, this.name});
//
//   Source.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }
