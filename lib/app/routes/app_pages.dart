import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../views/pages/home_page.dart';
import '../views/pages/login_page.dart';
import 'app_routes.dart';

/// 应用页面路由配置
class AppPages {
  // 防止实例化
  AppPages._();

  /// 所有路由页面配置
  static final routes = [
    // 首页路由
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    // 登录页路由
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
      }),
    ),
  ];
}

/// 初始绑定 - 用于注入全局依赖
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // 在应用启动时注入全局控制器
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
