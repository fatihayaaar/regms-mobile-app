import 'package:flutter/material.dart';

import '../../../../my_app.dart';
import '../../../../product/navigation/navigation.dart';
import '../../../../product/network/auth/models/register_model/register_model.dart';
import '../../../../product/extensions/context_extension.dart';
import '../../../../core/models/base/base_view_model.dart';
import '../../../../product/network/auth/models/register_model/register_response_model/register_response_model.dart';
import '../../../../product/network/base/base_service.dart';
import '../../../../root.dart';
import '../services/register_service.dart';

class RegisterViewModel extends BaseViewModel<RegisterService> {
  late PageController _controller;
  late int _slideIndex;
  late DateTime _selectedDateTime;
  late String _selectedGender;

  RegisterViewModel() {
    init();
  }

  void init() {
    _controller = PageController();
    _slideIndex = 0;
    _selectedDateTime = DateTime.now();
    _selectedGender = "Gender";
  }

  get controller => _controller;

  set controller(controller) {
    _controller = controller;
    notifyListeners();
  }

  get slideIndex => _slideIndex;

  set slideIndex(slideIndex) {
    _slideIndex = slideIndex;
    notifyListeners();
  }

  get selectedDateTime => _selectedDateTime;

  set selectedDateTime(selectedDateTime) {
    _selectedDateTime = selectedDateTime;
    notifyListeners();
  }

  get selectedGender => _selectedGender;

  set selectedGender(selectedGender) {
    _selectedGender = selectedGender;
    notifyListeners();
  }

  @override
  void setContext(BuildContext? context) => this.context = context;

  @override
  void setService(BaseService? service) {
    service = RegisterService(
      networkManager: context!.networkManager,
    );
  }

  void nextButtonStep1OnClick() {
    controller.animateToPage(
      slideIndex + 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );

    slideIndex = slideIndex + 1;
  }

  Future<RegisterResponseModel?> register({required RegisterModel registerModel}) async {
    return await service!.register(
      registerModel: registerModel,
      onResponse: (response) {
        saveUser(response);
        navigateToProfile();
      },
      onError: (message) {},
    );
  }

  void registerButtonOnClick() async {
    final registerModel = RegisterModel();
    if (service != null) {
      register(registerModel: registerModel).then((value) {});
    }
  }

  void saveUser(responseModel) {
    appService.providerPersistHelper.saveToken(responseModel.token!);
    // Root.instance.myUser =
  }

  void navigateToProfile() {
    appService.providerNavigationHelper.navigateToReplacementPage(
      path: Navigation.PROFILE_PAGE,
      object: {
        "user": Root.instance.myUser,
        "isMyProfile": true,
      },
    );
  }
}
