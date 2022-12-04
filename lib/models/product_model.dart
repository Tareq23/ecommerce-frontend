

class ProductModel
{
  int? id;
  String? title; // product name
  String? description;
  String? imageUrl;
  int? quantity;
  dynamic? price;
  dynamic? regularPrice;
  dynamic? discountPrice;
  // dynamic? rating;
  // ProductModel({this.id,this.title,this.quantity,this.description,this.imageUrl,this.price});
  ProductModel(this.id,this.title,this.imageUrl,this.regularPrice,this.discountPrice,this.description);

  ProductModel.orderedProduct({required this.id,required this.title, required this.imageUrl,required this.quantity});


  // {
  // "id": 93,
  // "name": "Portable Foldable Home Laptop/Notebook",
  // "regularPrice": 0.0,
  // "discountPrice": 0.0,
  // "imageUrl": "http://localhost:8080/images/1668369798661.jpg",
  // "quantity": 0,
  // "description": "<div class=\"html-content pdp-product-highlights\" style=\"margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;\"><ul class=\"\" style=\"margin: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px;\"><li class=\"\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.2a9dcNQncNQnWY\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Condition: 100% brand new</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Material: Environmental protection composite board</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Color: Black, Blue, Green, Brown</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Desktop size: (length x width x height): 60 * 40 * 28cm</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; box-sizing: border-box; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">Package weight: 1.8</li></ul></div><div class=\"html-content detail-content\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.2a9dcNQncNQnWY\" style=\"margin: 16px 0px 0px; padding: 0px 0px 16px; word-break: break-word; position: relative; height: auto; line-height: 19px; overflow-y: hidden; border-bottom: 1px solid rgb(239, 240, 245); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif; font-size: 12px;\"><br><span style=\"margin: 0px; padding: 0px;\"></span></div><div class=\"pdp-mod-specification\" style=\"margin: 16px 0px 0px; padding: 0px 0px 10px; border-bottom: 1px solid rgb(239, 240, 245); font-size: 14px; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif;\"><h2 class=\"pdp-mod-section-title \" style=\"margin: 0px; padding: 0px; font-weight: 500; font-family: Roboto-Medium; font-size: 16px; line-height: 19px; color: rgb(33, 33, 33); letter-spacing: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;\">Specifications of Portable Foldable Home Laptop/Note Stand Desk/Table for Study</h2><div class=\"pdp-general-features\" style=\"margin: 0px; padding: 0px;\"><ul class=\"specification-keys\" style=\"margin: 16px -15px 0px; padding: 0px; list-style: none; height: auto; box-sizing: border-box;\"><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; box-sizing: border-box; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Brand</span><div class=\"html-content key-value\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.2a9dcNQncNQnWY\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">No Brand</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; box-sizing: border-box; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">SKU</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">268173595_BD-1240283234</div></li><li class=\"key-li\" style=\"margin: 0px 0px 8px; padding: 0px 15px; display: inline-block; box-sizing: border-box; width: 490px; vertical-align: top; line-height: 18px;\"><span class=\"key-title\" style=\"margin: 0px 18px 0px 0px; padding: 0px; display: inline-block; width: 140px; vertical-align: top; color: rgb(117, 117, 117); word-break: break-word;\">Model</span><div class=\"html-content key-value\" style=\"margin: 0px; padding: 0px; word-break: break-word; display: inline-block; width: 306px;\">Adjustable</div></li></ul></div><div class=\"box-content\" style=\"margin: 28px 0px 0px; padding: 0px;\"><span class=\"key-title\" style=\"margin: 0px; padding: 0px; display: table-cell; width: 140px; color: rgb(117, 117, 117); word-break: break-word;\">What’s in the box</span><div class=\"html-content box-content-html\" style=\"margin: 0px; padding: 0px 0px 0px 18px; word-break: break-word; display: table-cell;\">পোর্টেবল ভাঁজযোগ্য হোম ল্যাপটপ/নোটবুক স্ট্যান্ড ডেস্ক/স্টাডির জন্য টেবিল</div></div></div>",
  // "categoryId": 8,
  // "brandId": 1,
  // "categoryName": "Health & Beauty",
  // "brandName": "Brand-name-One"
  // },

  ProductModel.parseJsonForCategory(Map<String,dynamic> json){
    id = json['id'];
    title  = json['name'];
    regularPrice = json['regularPrice'];
    discountPrice = json['discountPrice'];
    imageUrl = json['imageUrl'];
    description = json['description'];
  }



  ProductModel.parseOrder(Map<String,dynamic>product){
    id = product['productId'];
    title = product['productName'];
    imageUrl = product['imageUrl'];
  }

}

// List<ProductModel> productList = [
//   ProductModel(id: 1,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 85,rating: 100),
//   ProductModel(id: 2,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 50,rating: 100),
//   ProductModel(id: 3,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 232,rating: 100),
//   ProductModel(id: 4,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 333,rating: 100),
//   ProductModel(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
//   // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
//   // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
//   // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
//   // Product(id: 5,title: 'Product name title',description: 'Product Description',imageUrl: 'https://cdn.pixabay.com/photo/2019/01/09/14/13/leaves-3923413__340.jpg',price: 4334,rating: 100),
// ];