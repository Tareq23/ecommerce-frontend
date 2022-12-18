

class API
{
  static const String BASE_URL = "http://localhost:8080";
  static const String CHECK_ROLE = '$BASE_URL/check-role';
  static const String LOGIN_URL = '$BASE_URL/login';
  static const String REGISTER_URL = '$BASE_URL/register';

  // ADMIN CATEGORY
  static const String CATEGORY_URL = '$BASE_URL/visitor-or-customer/only-category';
  static const String ADMIN_SHOW_ONLY_CATEGORY_URL = '$BASE_URL/admin/category/show-only-category';
  static const String ADD_CATEGORY_URL = '$BASE_URL/admin/category/add';
  static const String DELETE_CATEGORY_URL = '$BASE_URL/admin/category/delete';
  static const String UPDATE_CATEGORY_URL = '$BASE_URL/admin/category/update';
  static const String UPDATE_CATEGORY_WITH_IMAGE_URL = '$BASE_URL/admin/category/update-with-image';
  static const String FETCH_CATEGORY_BY_ID_URL = '$BASE_URL/admin/category/show/';

  // ADMIN PRODUCT

  static const String ADMIN_SHOW_ALL_PRODUCT = '$BASE_URL/admin/product/view/all';
  static const String ADMIN_ADD_PRODUCT = '$BASE_URL/admin/product/add';
  static const String ADMIN_PRODUCT_DETAILS_BY_ID = '$BASE_URL/admin/product/view/details/';
  static const String ADMIN_PRODUCT_UPDATE_WITHOUT_IMAGE = '$BASE_URL/admin/product/update';
  static const String ADMIN_PRODUCT_DELETE= '$BASE_URL/admin/product/delete';
  static const String ADMIN_PRODUCT_UPDATE_WITH_IMAGE = '$BASE_URL/admin/product/update-with-image';


  // ADMIN BRAND

  static const String ADMIN_SHOW_ALL_BRAND = '$BASE_URL/admin/brand/all';
  static const String ADMIN_SHOW_BRAND_BY_ID = '$BASE_URL/admin/brand/details/';
  static const String ADMIN_ADD_BRAND = '$BASE_URL/admin/brand/add';
  static const String ADMIN_UPDATE_BRAND = '$BASE_URL/admin/brand/update';
  static const String ADMIN_DELETE_BRAND = '$BASE_URL/admin/brand/delete';

  //   ADMIN ORDER
  static const String AMDIN_ORDER_ALL = '$BASE_URL/admin/order/all';
  static String AMDIN_ORDER_BY_ORDER_STATUS = '$BASE_URL/admin/order/';
  static String AMDIN_ORDER_BY_ORDER_ID = '$BASE_URL/admin/order/details/';
  static String AMDIN_ORDER_BY_PAYMENT_STATUS = '$BASE_URL/admin/order/payment/';
  static String AMDIN_ORDER_STATUS_UPDATE = '$BASE_URL/admin/order/update/order-status';


  // VISITOR OR CUSTOMER
  static const String VISITOR_OR_CUSTOMER_ALL_CATEGORY_WITH_PRODUCT = '$BASE_URL/visitor-or-customer/products';
  static String VISITOR_OR_CUSTOMER_PRODUCT_DETAILS_BY_ID = '$BASE_URL/visitor-or-customer/product/';
  static String VISITOR_OR_CUSTOMER_PRODUCT_SEARCH_BY_NAME = '$BASE_URL/visitor-or-customer/product/search-by-name/';
  static String VISITOR_OR_CUSTOMER_PRODUCT_FIND_BY_CATEGORY = '$BASE_URL/visitor-or-customer/product/find-by-category';
  static String VISITOR_OR_CUSTOMER_PRODUCT_FIND_BY_CATEGORY_WITH_PRICE_RANGE = '$BASE_URL/visitor-or-customer/product/find-by-category/';




  // customer cart
  static String CUSTOMER_CART_ADD = '$BASE_URL/customer/cart/add';
  static String CUSTOMER_CART_ALL = '$BASE_URL/customer/cart/all';
  static String CUSTOMER_CART_DELETE = '$BASE_URL/customer/cart/delete';


  // customer order
  static String CUSTOMER_ORDER_ADD = '$BASE_URL/customer/order/add';
  static String CUSTOMER_ORDER_ALL = '$BASE_URL/customer/order/all';


  // customer address
  static String CUSTOMER_ADDRESS_ADD = '$BASE_URL/customer/address/add';
  static String CUSTOMER_ADDRESS_All = '$BASE_URL/customer/address/all';
  static String CUSTOMER_DEFAULT_ADDRESS_UPDATE = '$BASE_URL/customer/address/update/default-address/';


  // CUSTOMER INFO
  static const String CUSTOMER_INFO = '$BASE_URL/customer/info';
  static const String CUSTOMER_INFO_UPDATE = '$BASE_URL/customer/info/update';

  // CUSTOMER REVIEW
  static const String CUSTOMER_REIVEW_ALL = '$BASE_URL/customer/review/all';


}