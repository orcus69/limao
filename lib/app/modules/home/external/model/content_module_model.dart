
class ContentModuleModel {
  int? id;
  Map<String, dynamic>? category;
  String? title;
  DateTime? date;
  List<String>? tags;
  String? reference;

  ContentModuleModel({
    this.id,
    this.category,
    this.title,
    this.date,
    this.tags,
    this.reference,
  });

  factory ContentModuleModel.fromMap(Map<String, dynamic> map) {
    return ContentModuleModel(
      id: map['id'] as int,
      category: map['category'] as Map<String, dynamic>,
      title: map['title'] as String,
      date: map['date'] as DateTime,
      tags: map['tags'] as List<String>,
      reference: map['reference'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id as int,
      'category': category as Map<String, dynamic>,
      'title': title as String,
      'date': date.toString(),
      'tags': tags as List<String>,
      'reference': reference as String,
    };
  }
}
