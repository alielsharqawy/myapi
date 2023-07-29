import 'dart:convert';

List<UserToDos> userToDosFromJson(String str) => List<UserToDos>.from(json.decode(str).map((x) => UserToDos.fromJson(x)));

String userToDosToJson(List<UserToDos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserToDos {
    int? userId;
    int? id;
    String? title;
    bool? completed;

    UserToDos({
        this.userId,
        this.id,
        this.title,
        this.completed,
    });

    factory UserToDos.fromJson(Map<String, dynamic> json) => UserToDos(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
