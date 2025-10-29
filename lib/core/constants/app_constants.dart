/// 应用常量配置
class AppConstants {
  // 防止实例化
  AppConstants._();

  /// 应用名称
  static const String appName = 'GetX 模板';

  /// 应用版本
  static const String appVersion = '1.0.0';

  /// API 基础 URL
  static const String apiBaseUrl = 'https://api.example.com';

  /// 超时时间（秒）
  static const int timeoutDuration = 30;

  /// 每页数据条数
  static const int pageSize = 20;

  /// 存储键
  static const String tokenKey = 'token';
  static const String userKey = 'user_info';
  static const String languageKey = 'language';
  static const String themeKey = 'theme_mode';
}
