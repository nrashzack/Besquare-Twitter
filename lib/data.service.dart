class PostData {
  int? id;
  String? title;
  String? description;
  String? image;
  String? date;
  String? author;

  PostData(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.date,
      this.author});

  PostData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['first_name'];
    description = json['last_name'];
    image = json['username'];
    date = json['last_seen_time'];
    author = json['avatar'];
  }
}
