/// 表单验证工具类
class Validators {
  // 防止实例化
  Validators._();

  /// 验证邮箱
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入邮箱';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return '请输入有效的邮箱地址';
    }
    return null;
  }

  /// 验证密码
  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return '请输入密码';
    }
    if (value.length < minLength) {
      return '密码长度至少为 $minLength 位';
    }
    return null;
  }

  /// 验证手机号
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入手机号';
    }
    final phoneRegex = RegExp(r'^1[3-9]\d{9}$');
    if (!phoneRegex.hasMatch(value)) {
      return '请输入有效的手机号';
    }
    return null;
  }

  /// 验证必填项
  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '请输入${fieldName ?? '内容'}';
    }
    return null;
  }

  /// 验证最小长度
  static String? minLength(String? value, int length, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '请输入${fieldName ?? '内容'}';
    }
    if (value.length < length) {
      return '${fieldName ?? '内容'}长度至少为 $length 位';
    }
    return null;
  }

  /// 验证最大长度
  static String? maxLength(String? value, int length, {String? fieldName}) {
    if (value != null && value.length > length) {
      return '${fieldName ?? '内容'}长度不能超过 $length 位';
    }
    return null;
  }

  /// 验证数字
  static String? number(String? value) {
    if (value == null || value.isEmpty) {
      return '请输入数字';
    }
    if (double.tryParse(value) == null) {
      return '请输入有效的数字';
    }
    return null;
  }

  /// 验证确认密码
  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return '请再次输入密码';
    }
    if (value != password) {
      return '两次输入的密码不一致';
    }
    return null;
  }
}
