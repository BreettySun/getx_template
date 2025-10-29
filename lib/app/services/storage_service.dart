import 'package:get/get.dart';
import 'package:flutter/material.dart';

/// 本地存储服务 - 处理本地数据持久化
class StorageService extends GetxService {
  // 模拟内存存储
  final Map<String, dynamic> _storage = {};

  /// 保存数据
  Future<bool> write(String key, dynamic value) async {
    try {
      _storage[key] = value;
      return true;
    } catch (e) {
      debugPrint('保存数据失败: $e');
      return false;
    }
  }

  /// 读取数据
  T? read<T>(String key) {
    try {
      return _storage[key] as T?;
    } catch (e) {
      debugPrint('读取数据失败: $e');
      return null;
    }
  }

  /// 删除数据
  Future<bool> remove(String key) async {
    try {
      _storage.remove(key);
      return true;
    } catch (e) {
      debugPrint('删除数据失败: $e');
      return false;
    }
  }

  /// 清空所有数据
  Future<bool> clear() async {
    try {
      _storage.clear();
      return true;
    } catch (e) {
      debugPrint('清空数据失败: $e');
      return false;
    }
  }

  /// 检查键是否存在
  bool hasKey(String key) {
    return _storage.containsKey(key);
  }

  /// 保存用户令牌
  Future<bool> saveToken(String token) async {
    return await write('token', token);
  }

  /// 获取用户令牌
  String? getToken() {
    return read<String>('token');
  }

  /// 删除用户令牌
  Future<bool> removeToken() async {
    return await remove('token');
  }

  /// 保存用户信息
  Future<bool> saveUserInfo(Map<String, dynamic> userInfo) async {
    return await write('user_info', userInfo);
  }

  /// 获取用户信息
  Map<String, dynamic>? getUserInfo() {
    return read<Map<String, dynamic>>('user_info');
  }

  /// 删除用户信息
  Future<bool> removeUserInfo() async {
    return await remove('user_info');
  }
}
