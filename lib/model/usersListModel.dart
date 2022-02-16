// To parse this JSON data, do
//
//     final usersList = usersListFromJson(jsonString);

import 'dart:convert';

UsersList usersListFromJson(String str) => UsersList.fromJson(json.decode(str));

String usersListToJson(UsersList data) => json.encode(data.toJson());

class UsersList {
    UsersList({
        this.status,
        this.message,
        this.data,
    });

    int? status;
    String? message;
    List<Datum>? data;

    factory UsersList.fromJson(Map<String, dynamic> json) => UsersList(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.name,
        this.empId,
        this.roleId,
        this.levelId,
        this.rigId,
        this.email,
        this.password,
        this.work,
        this.mobNum,
        this.profilePic,
        this.status,
    });

    String? id;
    String? name;
    String? empId;
    String? roleId;
    String? levelId;
    String? rigId;
    String? email;
    String? password;
    String? work;
    String? mobNum;
    String? profilePic;
    String? status;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        empId: json["empId"],
        roleId: json["roleId"],
        levelId: json["levelId"],
        rigId: json["rigId"],
        email: json["email"],
        password: json["password"],
        work: json["work"],
        mobNum: json["mob_num"],
        profilePic: json["profile_pic"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "empId": empId,
        "roleId": roleId,
        "levelId": levelId,
        "rigId": rigId,
        "email": email,
        "password": password,
        "work": work,
        "mob_num": mobNum,
        "profile_pic": profilePic,
        "status": status,
    };
}
