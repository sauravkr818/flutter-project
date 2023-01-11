import 'package:flutter/material.dart';

class Github {
  //final int id;
  final String name;
  final String description;

  const Github({
    //required this.id,
    required this.name,
    required this.description,
  });

  factory Github.fromJson(json) {
    //print(json);
    return Github(
      // id: json['id'] ? json['id'] : 100,
      name: json['name'] ?? "no name",
      description: json['description'] ?? "no description",
    );
  }
}

class Commit {
  //final int id;
  final String name;
  final String email;
  final String date;
  final String message;
  final String htmlUrl;

  const Commit({
    //required this.id,
    required this.name,
    required this.email,
    required this.date,
    required this.message,
    required this.htmlUrl,
  });

  factory Commit.fromJson(json) {
    //print(json);
    return Commit(
      // id: json['id'] ? json['id'] : 100,
      name: json['commit']['author']['name'] ?? "no name",
      email: json['commit']['author']['email'] ?? "no email",
      date: json['commit']['author']['date'] ?? "no date",
      message: json['commit']['message'] ?? "no message",
      htmlUrl: json['html_url'] ?? "no url",
    );
  }
}
