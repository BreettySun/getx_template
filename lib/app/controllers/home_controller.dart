import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

/// 首页控制器 - 管理首页数据和业务逻辑
class HomeController extends GetxController {
  // 服务依赖
  final ApiService _apiService = Get.find<ApiService>();

  // 响应式状态
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // 加载产品列表
    fetchProducts();
  }

  /// 获取产品列表
  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;

      final productList = await _apiService.getProducts();
      products.value = productList;
    } catch (e) {
      Get.snackbar('错误', '加载产品列表失败: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 刷新产品列表
  Future<void> refreshProducts() async {
    await fetchProducts();
  }

  /// 选择产品
  void selectProduct(int index) {
    selectedIndex.value = index;
  }

  /// 获取产品详情
  Future<void> viewProductDetail(String productId) async {
    try {
      final product = await _apiService.getProductDetail(productId);
      if (product != null) {
        Get.snackbar(
          product.name,
          product.description,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar('错误', '加载产品详情失败: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  /// 增加计数器（示例功能）
  final RxInt counter = 0.obs;

  void increment() {
    counter.value++;
  }

  void decrement() {
    if (counter.value > 0) {
      counter.value--;
    }
  }

  void resetCounter() {
    counter.value = 0;
  }
}
