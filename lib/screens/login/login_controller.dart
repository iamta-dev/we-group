import 'package:example_flutter1/enums/language.dart';
import 'package:example_flutter1/models/user_model.dart';
import 'package:example_flutter1/services/user_service.dart';
import 'package:get/get.dart';

class LoginView {
  gotoHome(UserModel user) {}
}

class LoginController extends GetxController {
  final UserService userService;
  final LoginView view;
  var languageSelected = Rx<Language>(Language.th);

  LoginController(this.userService, this.view);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onSubmit() async {
    try {
      UserModel user = await getUser(); // call service
      this.view.gotoHome(user);
    } catch (error) {
      print("getUser: $error");
    }
  }

  Future<UserModel> getUser() async {
    UserModel user = await userService.getUser();
    return user;
  }

  String getImagePathLanguage(Language language) {
    return language == Language.th
        ? "assets/thai-flag.png"
        : "assets/eng-flag.png";
  }

  setLanguageSelected(Language language) {
    this.languageSelected.value = language;
  }
}
