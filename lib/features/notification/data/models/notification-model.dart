class NotificationModel {
  String title;
  String subTitle;

  NotificationModel({
    this.title,
    this.subTitle,
  });
  NotificationModel copyWith({title, subTitle}) {
    return NotificationModel(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
    );
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      subTitle: json['subTitle'],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
      };
}
