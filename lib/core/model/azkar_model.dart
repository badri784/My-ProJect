class AllAzkar {
  String? id;
  String? title;
  String? content;
  int? repeat;
  String? referance;
  String? note;

  AllAzkar({
    this.id,
    this.title,
    this.content,
    this.repeat,
    this.referance,
    this.note,
  });

  AllAzkar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    repeat = json['repeat'];
    referance = json['referance'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['repeat'] = repeat;
    data['referance'] = referance;
    data['note'] = note;
    return data;
  }
}
