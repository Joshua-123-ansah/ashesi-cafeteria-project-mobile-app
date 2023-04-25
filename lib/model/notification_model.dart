class NotificationModel {
  late String title;
  late String image;
  late String description;

  NotificationModel(
      {required this.title, required this.image, required this.description});

  static NotificationModel fromJson(Map<String, dynamic> json) =>
      NotificationModel(
          title: json['title'],
          image: json['image'],
          description: json['description']);
}
