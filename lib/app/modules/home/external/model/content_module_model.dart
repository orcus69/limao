
class ContentModuleModel {
  int? id;
  int? idModule;
  Map<String, dynamic>? category;
  String? title;
  DateTime? date;
  List<ContentListModel>? content;
  String? reference;


  ContentModuleModel({
    this.id,
    this.idModule,
    this.title,
    this.content,
  });

  factory ContentModuleModel.fromMap(Map<String, dynamic> map) {
    return ContentModuleModel(
      id: map['id'] as int,
      idModule: map['module_id'] as int,
      title: map['title'] as String,
      content: List<ContentListModel>.from(
        map['content']?.map((x) => ContentListModel.fromMap(x)),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'module_id': idModule,
      'title': title,
      'content': content?.map((x) => x.toMap()).toList(),
    };
  }
}

class ContentListModel {
  String? src;
  String? type;
  String? title;
  String? description;

  ContentListModel({
    this.src,
    this.type,
    this.title,
    this.description,
  });

  factory ContentListModel.fromMap(Map<String, dynamic> map) {
    return ContentListModel(
      src: map['src'] as String,
      type: map['type'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'src': src,
      'type': type,
      'title': title,
      'description': description,
    };
  }
}
