class VideoDetails {
  String? id;
  String? title;
  String? thumbnail;
  String? author;

  VideoDetails({this.id, this.title, this.thumbnail, this.author});

  VideoDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['author'] = author;
    return data;
  }
}
