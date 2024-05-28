class NotificationModel {
  final String? title;
  final String? body;
  final Map<String, dynamic>? data;

  NotificationModel({this.title, this.body, this.data});

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'],
      body: map['body'],
      data: map['data'],
    );
  }
}
