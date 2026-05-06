enum AhkamCategory {
  fasting,
  prayer,
  zakat,
  hajj,
  marriage,
  divorce,
  inheritance,
}

class AhkamModel {
  final String? id;
  final String? title;
  final String? content;
  final String? image;
  final String? reference;
  final String? url;
  final AhkamCategory? category;

  AhkamModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      content = json['content'],
      image = json['image'],
      reference = json['reference'],
      url = json['url'],
      category = json['category'];

  AhkamModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.reference,
    this.url,
    this.category,
  });
}
