import 'package:eshopping/model/user.dart';
import 'package:eshopping/repositories/product_repositories.dart';
import 'package:eshopping/repositories/user_repository.dart';
import 'package:eshopping/response/get_product_response.dart';
import 'package:eshopping/utils/api_url.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late UserRepository? userRepository;
  late ProductResponse? productResponse;
  late ProductRepository? productRepository;
  setUp(() {
    //For user
    userRepository = UserRepository();
    // For products
    productResponse = ProductResponse();
    productRepository = ProductRepository();
    token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImtpcmFucmFuYTg5NzNAZ21haWwuY29tIiwiaWF0IjoxNjU2MDU4NDc4LCJleHAiOjE2NTYxNDQ4Nzh9.-O1NND2mSRiOCHTk90XTn5JudbA_M5AVFfvlGD-uX-0";
  });

  group('User api test', () {
    test('user registration', () async {
      bool expectedResult = true;
      User user = User(
          email: "kiranrana8973@gmail.com",
          username: "admin",
          password: "admin",
          address: "Talchhikhel",
          country: "Nepal",
          phone: "9812323232");
      bool actualResult = await userRepository!.registerUser(user);
      expect(expectedResult, actualResult);
    });
    test('login user', () async {
      bool expectedResult = true;
      String username = "admin";
      String password = "admin";

      bool actualResult = await userRepository!.login(username, password);
      expect(expectedResult, actualResult);
    });
  });

  group('get products from api', () {
    test('get products from api', () async {
      productResponse = await productRepository!.getProducts();
      bool expectedResult = true;
      bool actualResult = false;

      if (productResponse!.data!.isNotEmpty) {
        actualResult = true;
      }

      expect(expectedResult, actualResult);
    });
  });

  tearDown(() {
    userRepository = null;
    productResponse = null;
    productRepository = null;
    token = null;
  });
}
