import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

/// 登录页面
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                // 欢迎标题
                const Text(
                  '欢迎回来',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '登录以继续使用',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 48),

                // 邮箱输入框
                CustomInput(
                  label: '邮箱',
                  hint: '请输入您的邮箱',
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入邮箱';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return '请输入有效的邮箱地址';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // 密码输入框
                CustomInput(
                  label: '密码',
                  hint: '请输入您的密码',
                  controller: passwordController,
                  obscureText: true,
                  prefixIcon: const Icon(Icons.lock_outline),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入密码';
                    }
                    if (value.length < 6) {
                      return '密码长度至少为 6 位';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),

                // 忘记密码
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.snackbar(
                        '提示',
                        '忘记密码功能即将推出',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    },
                    child: const Text('忘记密码?'),
                  ),
                ),
                const SizedBox(height: 24),

                // 登录按钮
                Obx(
                  () => CustomButton(
                    text: '登录',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        authController.login(
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                    isLoading: authController.isLoading.value,
                    icon: Icons.login,
                  ),
                ),
                const SizedBox(height: 24),

                // 分隔线
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300])),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '或',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[300])),
                  ],
                ),
                const SizedBox(height: 24),

                // 注册提示
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('还没有账户?', style: TextStyle(color: Colors.grey[600])),
                    TextButton(
                      onPressed: () {
                        Get.snackbar(
                          '提示',
                          '注册功能即将推出',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      child: const Text('立即注册'),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // 演示提示
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue[700]),
                          const SizedBox(width: 8),
                          Text(
                            '演示账户',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '邮箱: 任意邮箱\n密码: 至少6位字符',
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
