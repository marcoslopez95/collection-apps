import 'package:access_maketicket/src/Model/Model.dart';

class Article extends BaseModel {
  final int id;
  final ArticleAttributes attributes;

  Article({required this.id, required this.attributes})
      : super(id: id, attributes: attributes);

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        id: json['id'],
        attributes: ArticleAttributes.fromJson(json['attributes'])
    );
  }
}

class ArticleAttributes extends Attributes {
  final String name;
  final String description;
  final int amount;
  final int event_id;
  final int type_articles_id;
  final int article_status_id;
  final int price;
  final int worth;
  final int presale_id;

  ArticleAttributes({
    required this.name,
    required this.description,
    required this.amount,
    required this.event_id,
    required this.type_articles_id,
    required this.article_status_id,
    required this.price,
    required this.worth,
    required this.presale_id,
  });

  factory ArticleAttributes.fromJson(Map<String, dynamic> json) {
    return ArticleAttributes(
        name: json['name'],
        description: json['description'],
        amount: json['amount'],
        event_id: json['event_id'],
        type_articles_id: json['type_articles_id'],
        article_status_id: json['article_status_id'],
        price: json['price'],
        worth: json['worth'],
        presale_id: json['presale_id']);
  }
}
