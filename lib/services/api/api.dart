

class API
{
  static const String BASE_URL = "http://localhost:8080";
  static const String CHECK_ROLE = '$BASE_URL/check-role';
  static const String LOGIN_URL = '$BASE_URL/login';
  static const String REGISTER_URL = '$BASE_URL/register';

  static const String CATEGORY_URL = '$BASE_URL/visitor-or-customer/only-category';
  static const String ADD_CATEGORY_URL = '$BASE_URL/admin/category/add';
  static const String DELETE_CATEGORY_URL = '$BASE_URL/admin/category/delete';
  static const String UPDATE_CATEGORY_URL = '$BASE_URL/admin/category/update';
  static const String FETCH_CATEGORY_BY_ID_URL = '$BASE_URL/admin/category/show/';

}