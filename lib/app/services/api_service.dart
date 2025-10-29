import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../models/user_model.dart';

/// API 服务类 - 处理所有网络请求
class ApiService extends GetxService {
  // 模拟 API 基础 URL
  static const String baseUrl = 'https://api.example.com';

  /// 用户登录
  Future<UserModel?> login(String email, String password) async {
    try {
      // 模拟网络请求延迟
      await Future.delayed(const Duration(seconds: 2));

      // 模拟登录验证
      if (email.isNotEmpty && password.length >= 6) {
        // 返回模拟用户数据
        return UserModel(
          id: '1',
          name: '测试用户',
          email: email,
          avatar: 'https://via.placeholder.com/150',
        );
      }
      return null;
    } catch (e) {
      debugPrint('登录失败: $e');
      return null;
    }
  }

  /// 获取用户信息
  Future<UserModel?> getUserInfo(String userId) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return UserModel(
        id: userId,
        name: '测试用户',
        email: 'test@example.com',
        avatar: 'https://via.placeholder.com/150',
      );
    } catch (e) {
      debugPrint('获取用户信息失败: $e');
      return null;
    }
  }

  /// 获取产品列表
  Future<List<ProductModel>> getProducts() async {
    try {
      // 模拟网络请求延迟
      await Future.delayed(const Duration(seconds: 1));

      // 返回模拟产品数据
      return [
        ProductModel(
          id: '1',
          name: 'Flutter 开发教程',
          description: '从零开始学习 Flutter 开发',
          price: 99.99,
          imageUrl: 'https://via.placeholder.com/200',
        ),
        ProductModel(
          id: '2',
          name: 'GetX 状态管理',
          description: '掌握 GetX 状态管理的精髓',
          price: 79.99,
          imageUrl: 'https://via.placeholder.com/200',
        ),
        ProductModel(
          id: '3',
          name: 'Dart 编程指南',
          description: '深入理解 Dart 编程语言',
          price: 89.99,
          imageUrl: 'https://via.placeholder.com/200',
        ),
      ];
    } catch (e) {
      debugPrint('获取产品列表失败: $e');
      return [];
    }
  }

  /// 获取产品详情
  Future<ProductModel?> getProductDetail(String productId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      return ProductModel(
        id: productId,
        name: '示例产品',
        description: '这是一个示例产品的详细描述',
        price: 99.99,
        imageUrl: 'https://via.placeholder.com/300',
      );
    } catch (e) {
      debugPrint('获取产品详情失败: $e');
      return null;
    }
  }
}
