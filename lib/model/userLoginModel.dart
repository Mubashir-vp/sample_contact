// To parse this JSON data, do
//
//     final userloginData = userloginDataFromJson(jsonString);

import 'dart:convert';

UserloginData userloginDataFromJson(String str) => UserloginData.fromJson(json.decode(str));

String userloginDataToJson(UserloginData data) => json.encode(data.toJson());

class UserloginData {
    UserloginData({
        this.status,
        this.message,
        this.data,
    });

    bool? status;
    String? message;
    Data? data;

    factory UserloginData.fromJson(Map<String, dynamic> json) => UserloginData(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.userId,
        this.name,
        this.email,
        this.positionid,
        this.token,
        this.levelId,
    });

    String? userId;
    String? name;
    String? email;
    String? positionid;
    String? token;
    String? levelId;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        positionid: json["positionid"],
        token: json["token"],
        levelId: json["levelId"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "email": email,
        "positionid": positionid,
        "token": token,
        "levelId": levelId,
    };
}
