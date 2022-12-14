import 'package:flutter/material.dart';

class ReviewModel{

  int? id;
  double? rating;
  String? customerName;
  String? commentText;
  List<String>? imageList;

  ReviewModel({this.id,this.rating,this.customerName,this.commentText,this.imageList});

  ReviewModel.parseJson(Map<String,dynamic> json){
    id = json['id'];
    rating = json['ratingNumber'];
    commentText = json['details'];
    var images = json['reviewImage'] as List;
    imageList = images.map((e) => e['url'].toString()).toList();
    customerName = json['customerName']??'';
  }

}

List<ReviewModel> reviewList = [
  // ReviewModel(5, 'piash', 'nice product', ['review-image-url','review-image-url']),
  // ReviewModel(2, 'piash', 'nice product', ['review-image-url','review-image-url','review-image-url']),
  // ReviewModel(3, 'piash', 'nice product', ['review-image-url']),
];