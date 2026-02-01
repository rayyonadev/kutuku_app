import 'package:flutter/material.dart';
import 'package:kutuku/src/model/category/category_model.dart';
import 'package:kutuku/src/model/product/product_card_model.dart';
import 'package:kutuku/src/ui/detail/product/product_detail_screen.dart';
import 'package:kutuku/src/ui/main/home/search/search_screen.dart';
import 'package:kutuku/src/widget/category_item_widget.dart';
import 'package:kutuku/src/widget/product_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<ProductModel> newArrivals = [
    ProductModel(
      name: "The Milton Jar",
      price: "\$120.00",
      imageUrl:
      "https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=400&h=400&fit=crop",
    ),
    ProductModel(
      name: "Martian Killer",
      price: "\$74.52",
      imageUrl:
      "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=400&h=400&fit=crop",
    ),
    ProductModel(
      name: "Leather Bag",
      price: "\$95.00",
      imageUrl:
      "https://images.unsplash.com/photo-1564422170194-896b89110ef8?w=400&h=400&fit=crop",
    ),
    ProductModel(
      name: "Mini Backpack",
      price: "\$68.00",
      imageUrl:
      "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=400&fit=crop",
    ),
  ];

  // ===== CATEGORIES (MODEL) =====
  final List<CategoryModel> categories = [
    CategoryModel(
      title: "Bags",
      count: "140 Product",
      imageUrl:
      "https://images.unsplash.com/photo-1590874103328-eac38a683ce7?w=100&h=100&fit=crop",
    ),
    CategoryModel(
      title: "Clothes",
      count: "358 Product",
      imageUrl:
      "https://images.unsplash.com/photo-1523381210434-271e8be1f52b?w=100&h=100&fit=crop",
    ),
    CategoryModel(
      title: "Electronics",
      count: "230 Product",
      imageUrl:
      "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=100&h=100&fit=crop",
    ),
    CategoryModel(
      title: "Shoes",
      count: "280 Product",
      imageUrl:
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=100&h=100&fit=crop",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xff6C63FF),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: "Home"),
                Tab(text: "Category"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildHomeTab(),
                  _buildCategoryTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== TOP BAR =====
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=12"),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SearchScreen()),
                );
              },
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Search product",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
    );
  }
  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "New Arrivals 🔥",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newArrivals.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(),
                    ),
                  );
                },
                child: ProductCard(
                  product: newArrivals[index],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ===== CATEGORY TAB =====
  Widget _buildCategoryTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          category: categories[index],
        );
      },
    );
  }
}
