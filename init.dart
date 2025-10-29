// ignore_for_file: avoid_print

import 'dart:io';

// --- 配置变量 ---
// 定义项目要创建的根目录
const String _projectRoot = 'lib';

// 定义所有要创建的目录路径（相对于项目根目录）
final List<String> _directories = [
  'app',
  'app/controllers',
  'app/models',
  'app/views',
  'app/views/pages',
  'app/views/widgets',
  'app/routes',
  'app/services',
  'core',
  'core/constants',
  'core/utils',
  'core/themes',
];

// 定义所有要创建的文件路径（相对于项目根目录）
final List<String> _files = [
  'app/controllers/home_controller.dart',
  'app/models/home_model.dart',
  'app/views/pages/home_page.dart',
  'app/routes/app_pages.dart',
  'app/routes/app_routes.dart',
  'app/services/home_service.dart',
];

// --- 主函数 ---
void main() async {
  print('✨ Starting directory structure initialization...');

  // 获取当前脚本运行的目录
  // 注意：这个脚本假定你在项目的根目录下运行它。
  // 例如：你的项目是 `my_app/`，那么 `init.dart` 应该在 `my_app/init.dart`，
  // 并在 `my_app/` 目录下执行 `dart run init.dart`。
  final currentDirectory = Directory.current.path;
  final baseProjectPath = '$currentDirectory/$_projectRoot';

  print('Base project path: $baseProjectPath');

  // 创建所有目录
  for (final dirPath in _directories) {
    final fullDirPath = '$baseProjectPath/$dirPath';
    await _createDirectory(fullDirPath);
  }

  // 创建所有文件
  for (final filePath in _files) {
    final fullFilePath = '$baseProjectPath/$filePath';
    await _createFile(fullFilePath);
  }

  print('\n✅ Directory structure and files created successfully!');
  print('🚀 Ready for your Flutter project!');
}

// --- 功能函数 ---

/// 创建目录
Future<void> _createDirectory(String path) async {
  final directory = Directory(path);
  if (!await directory.exists()) {
    try {
      await directory.create(recursive: true);

      print('  Created directory: $path');
    } catch (e) {
      print('  Error creating directory $path: $e');
    }
  } else {
    print('  Directory already exists: $path');
  }
}

/// 创建文件
Future<void> _createFile(String path, {String? content}) async {
  final file = File(path);
  if (!await file.exists()) {
    await file.writeAsString(content ?? '');
    print('  Created file: $path');
  } else {
    print('  File already exists: $path');
  }
}
