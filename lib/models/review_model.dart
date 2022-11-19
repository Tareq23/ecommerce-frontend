class ReviewModel{

  double? rating;
  String? customerName;
  String? commentText;
  List<String>? imageList;

  ReviewModel(this.rating,this.customerName,this.commentText,this.imageList);

}

List<ReviewModel> reviewList = [
  ReviewModel(5, 'piash', 'nice product', ['review-image-url','review-image-url']),
  ReviewModel(2, 'piash', 'nice product', ['review-image-url','review-image-url','review-image-url']),
  ReviewModel(3, 'piash', 'nice product', ['review-image-url']),
];