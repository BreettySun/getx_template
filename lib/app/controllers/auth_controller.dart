import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';
import '../routes/app_routes.dart';

/// 认证控制器 - 管理用户登录、注册、登出等功能
class AuthController extends GetxController {
  // 服务依赖
  final ApiService _apiService = Get.put(ApiService());
  final StorageService _storageService = Get.put(StorageService());

  // 响应式状态
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;
  final RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    // 检查是否有已保存的登录状态
    _checkLoginStatus();
  }

  /// 检查登录状态
  void _checkLoginStatus() {
    final userInfo = _storageService.getUserInfo();
    if (userInfo != null) {
      currentUser.value = UserModel.fromJson(userInfo);
      isLoggedIn.value = true;
    }
  }

  /// 用户登录
  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      // 调用 API 登录
      final user = await _apiService.login(email, password);

      if (user != null) {
        // 保存用户信息
        currentUser.value = user;
        isLoggedIn.value = true;
        await _storageService.saveUserInfo(user.toJson());
        await _storageService.saveToken('mock_token_${user.id}');

        // 显示成功消息
        Get.snackbar(
          '登录成功',
          '欢迎回来，${user.name}！',
          snackPosition: SnackPosition.BOTTOM,
        );

        // 跳转到首页
        Get.offAllNamed(AppRoutes.home);
      } else {
        // 登录失败
        Get.snackbar(
          '登录失败',
          '邮箱或密码错误，请重试',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar('错误', '登录时发生错误: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 用户登出
  Future<void> logout() async {
    try {
      // 清除本地存储
      await _storageService.removeToken();
      await _storageService.removeUserInfo();

      // 重置状态
      currentUser.value = null;
      isLoggedIn.value = false;

      // 显示消息
      Get.snackbar('已登出', '您已成功登出', snackPosition: SnackPosition.BOTTOM);

      // 跳转到登录页
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      Get.snackbar('错误', '登出时发生错误: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  /// 检查是否已登录
  bool get isAuthenticated => isLoggedIn.value;

  /// 获取当前用户名
  String get userName => currentUser.value?.name ?? '游客';

  /// 获取当前用户邮箱
  String get userEmail => currentUser.value?.email ?? '';
}
