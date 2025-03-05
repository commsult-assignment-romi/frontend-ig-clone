import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];
  final String baseUrl = 'http://localhost:8080';

  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    final url = Uri.parse('$baseUrl/posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      _posts = data.map((json) => Post.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
