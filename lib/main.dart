import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX 模板应用',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      // 定义初始路由
      initialRoute: AppRoutes.login,
      // 配置路由管理
      getPages: AppPages.routes,
      // 设置依赖注入
      initialBinding: InitialBinding(),
      // 根据不同环境配置日志
      enableLog: kDebugMode,
      // 设置默认过渡动画
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 250),
      // 去除调试标签
      debugShowCheckedModeBanner: false,
    );
  }
}
