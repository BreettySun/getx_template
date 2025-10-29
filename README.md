# GetX Flutter 模板项目

一个完整的、可运行的 Flutter GetX 模板项目，包含了现代化的架构设计和最佳实践。

## ✨ 项目特性

- ✅ **GetX 状态管理** - 使用 GetX 进行高效的状态管理
- ✅ **路由导航** - 完整的路由配置和页面导航
- ✅ **依赖注入** - 基于 GetX 的依赖注入系统
- ✅ **响应式编程** - 使用 Rx 实现响应式数据流
- ✅ **模块化架构** - 清晰的代码组织和分层架构
- ✅ **自定义组件** - 可复用的 UI 组件库
- ✅ **主题配置** - 支持亮色/暗色主题切换
- ✅ **表单验证** - 完善的表单验证工具

## 📁 项目结构

```
lib/
├── app/                          # 应用层
│   ├── controllers/              # 控制器（业务逻辑）
│   │   ├── auth_controller.dart  # 认证控制器
│   │   └── home_controller.dart  # 首页控制器
│   ├── models/                   # 数据模型
│   │   ├── user_model.dart       # 用户模型
│   │   └── product_model.dart    # 产品模型
│   ├── routes/                   # 路由配置
│   │   ├── app_pages.dart        # 页面路由配置
│   │   └── app_routes.dart       # 路由常量
│   ├── services/                 # 服务层
│   │   ├── api_service.dart      # API 服务
│   │   └── storage_service.dart  # 存储服务
│   └── views/                    # 视图层
│       ├── pages/                # 页面
│       │   ├── home_page.dart    # 首页
│       │   └── login_page.dart   # 登录页
│       └── widgets/              # 自定义组件
│           ├── custom_button.dart # 自定义按钮
│           └── custom_input.dart  # 自定义输入框
├── core/                         # 核心层
│   ├── constants/                # 常量配置
│   │   └── app_constants.dart    # 应用常量
│   ├── themes/                   # 主题配置
│   │   └── app_theme.dart        # 应用主题
│   └── utils/                    # 工具类
│       └── validators.dart       # 表单验证器
└── main.dart                     # 应用入口
```

## 🚀 快速开始

### 环境要求

- Flutter SDK: ^3.9.2
- Dart SDK: ^3.9.2

### 安装依赖

```bash
flutter pub get
```

### 运行项目

```bash
flutter run
```

## 📱 功能演示

### 1. 登录页面

- 邮箱和密码表单验证
- 自定义输入框组件
- 加载状态处理
- 演示账户：
  - 邮箱：任意有效邮箱
  - 密码：至少 6 位字符

### 2. 首页

- 用户信息展示
- 计数器演示（GetX 响应式状态）
- 产品列表展示
- 下拉刷新功能
- 退出登录

## 🎯 核心功能说明

### 状态管理

使用 GetX 的响应式状态管理：

```dart
// 定义响应式变量
final RxInt counter = 0.obs;

// 更新状态
counter.value++;

// 监听状态变化
Obx(() => Text('${counter.value}'))
```

### 路由导航

```dart
// 跳转到指定路由
Get.toNamed(AppRoutes.home);

// 替换当前路由
Get.offNamed(AppRoutes.login);

// 清空路由栈并跳转
Get.offAllNamed(AppRoutes.home);
```

### 依赖注入

```dart
// 注入依赖
Get.put<HomeController>(HomeController());

// 延迟注入
Get.lazyPut<HomeController>(() => HomeController());

// 获取依赖
final controller = Get.find<HomeController>();
```

### API 服务

```dart
// 调用 API
final ApiService api = Get.find<ApiService>();
final user = await api.login(email, password);
```

### 本地存储

```dart
// 保存数据
await storage.write('key', 'value');

// 读取数据
final value = storage.read<String>('key');

// 删除数据
await storage.remove('key');
```

## 🛠 自定义配置

### 修改主题颜色

编辑 `lib/core/themes/app_theme.dart`：

```dart
static const Color primaryColor = Color(0xFF2196F3); // 修改主色调
```

### 修改 API 基础 URL

编辑 `lib/core/constants/app_constants.dart`：

```dart
static const String apiBaseUrl = 'https://your-api.com';
```

### 添加新路由

1. 在 `app_routes.dart` 中定义路由常量
2. 在 `app_pages.dart` 中配置路由页面
3. 创建对应的页面和控制器

## 📚 主要依赖

- [get](https://pub.dev/packages/get) ^4.7.2 - 状态管理、路由、依赖注入

## 🔧 开发建议

1. **控制器**: 所有业务逻辑都应该在控制器中处理
2. **模型**: 使用 `fromJson` 和 `toJson` 方法处理数据转换
3. **服务**: API 调用和存储操作应该在服务层实现
4. **组件**: 创建可复用的自定义组件，提高代码复用性
5. **验证**: 使用 `Validators` 工具类进行表单验证

## 📝 注意事项

- 本项目使用模拟数据，实际开发中需要对接真实 API
- 存储服务当前使用内存存储，生产环境建议使用 `shared_preferences` 或 `hive`
- 建议根据实际需求调整和扩展项目结构

## 🎓 学习资源

- [GetX 官方文档](https://github.com/jonataslaw/getx)
- [Flutter 官方文档](https://flutter.dev/docs)
- [Dart 官方文档](https://dart.dev/guides)

## 📄 License

MIT License
