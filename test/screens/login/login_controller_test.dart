import 'package:example_flutter1/enums/language.dart';
import 'package:example_flutter1/models/user_model.dart';
import 'package:example_flutter1/screens/login/login_controller.dart';
import 'package:example_flutter1/services/user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_controller_test.mocks.dart';

@GenerateMocks([UserService])
main() {
  group("getImagePathLanguage", () {
    var controller = LoginController(MockUserService(), MockLoginView());
    test("should return flag th", () {
      var actual = controller.getImagePathLanguage(Language.th);
      expect(actual, "assets/thai-flag.png");
    });

    test("should return flag en", () {
      var actual = controller.getImagePathLanguage(Language.en);
      expect(actual, "assets/eng-flag.png");
    });
  });

  group("setLanguageSelected", () {
    test("should language selected as th", () {
      var controller = LoginController(MockUserService(), MockLoginView());
      controller.setLanguageSelected(Language.th);
      expect(controller.languageSelected.value, Language.th);
    });

    test("should language selected as en", () {
      var controller = LoginController(MockUserService(), MockLoginView());
      controller.setLanguageSelected(Language.en);
      expect(controller.languageSelected.value, Language.en);
    });
  });

  test("onSubmit", () async {
    var mockUserService = MockUserService();
    var mockView = MockLoginView();
    var controller = LoginController(mockUserService, mockView);
    var userInfo = {
      "id": 1,
      "name": "Leanne Graham",
      "username": "Bret",
      "email": "Sincere@april.biz",
      "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {"lat": "-37.3159", "lng": "81.1496"}
      },
      "phone": "1-770-736-8031 x56442",
      "website": "hildegard.org",
      "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
      }
    };

    var userModel = UserModel.fromJson(userInfo);
    when(mockUserService.getUser()).thenAnswer((_) => Future.value(userModel));
    await controller.onSubmit();
    verify(mockView.gotoHome(userModel));
  });
}

class MockLoginView extends Mock implements LoginView {}
