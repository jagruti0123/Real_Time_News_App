class SportsNewsModel {
  int? totalArticles;
  String? error;
  List<Articles>? articles;

  SportsNewsModel({this.totalArticles, this.articles});

  SportsNewsModel.fromJson(Map<String, dynamic> json) {
    totalArticles = json['totalArticles'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  SportsNewsModel.withError(String errorMessage) {
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


// class SportsNewsModel {
//   Pagination? pagination;
//   List<Data>? data;
//   String? error;
//
//   SportsNewsModel({this.pagination, this.data});
//
//   SportsNewsModel.fromJson(Map<String, dynamic> json) {
//     pagination = json['pagination'] != null
//         ? new Pagination.fromJson(json['pagination'])
//         : null;
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   SportsNewsModel.withError(String errorMessage) {
//      error = errorMessage;
//    }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.pagination != null) {
//       data['pagination'] = this.pagination!.toJson();
//     }
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Pagination {
//   int? limit;
//   int? offset;
//   int? count;
//   int? total;
//
//   Pagination({this.limit, this.offset, this.count, this.total});
//
//   Pagination.fromJson(Map<String, dynamic> json) {
//     limit = json['limit'];
//     offset = json['offset'];
//     count = json['count'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['limit'] = this.limit;
//     data['offset'] = this.offset;
//     data['count'] = this.count;
//     data['total'] = this.total;
//     return data;
//   }
// }
//
// class Data {
//   String? author;
//   String? title;
//   String? description;
//   String? url;
//   String? source;
//   String? image;
//   String? category;
//   String? language;
//   String? country;
//   String? publishedAt;
//
//   Data(
//       {this.author,
//         this.title,
//         this.description,
//         this.url,
//         this.source,
//         this.image,
//         this.category,
//         this.language,
//         this.country,
//         this.publishedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     author = json['author'];
//     title = json['title'];
//     description = json['description'];
//     url = json['url'];
//     source = json['source'];
//     image = json['image'];
//     category = json['category'];
//     language = json['language'];
//     country = json['country'];
//     publishedAt = json['published_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['author'] = this.author;
//     data['title'] = this.title;
//     data['description'] = this.description;
//     data['url'] = this.url;
//     data['source'] = this.source;
//     data['image'] = this.image;
//     data['category'] = this.category;
//     data['language'] = this.language;
//     data['country'] = this.country;
//     data['published_at'] = this.publishedAt;
//     return data;
//   }
// }