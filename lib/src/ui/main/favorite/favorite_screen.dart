import 'package:flutter/material.dart';
import 'package:kutuku/src/model/product/product_card_model.dart';
import 'package:kutuku/src/widget/product_card_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String selectedFilter = 'All';
  final TextEditingController _searchController = TextEditingController();

  final List<ProductModel> favoriteProducts = [
    ProductModel(
      name: 'Box Headphone 234',
      price: '\$66.00',
      imageUrl:
      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300',
    ),
    ProductModel(
      name: 'Box Bag 892',
      price: '\$152.00',
      imageUrl:
      'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=300',
    ),
    ProductModel(
      name: 'Box Bag 234',
      price: '\$85.00',
      imageUrl:
      'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=300',
    ),
    ProductModel(
      name: 'Box Headphone 992',
      price: '\$142.00',
      imageUrl:
      'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=300',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Favorite',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: IconButton(
                  icon: const Icon(Icons.notifications_outlined,
                      size: 22, color: Colors.black),
                  onPressed: () {},
                ),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search,
                            color: Colors.grey[400], size: 22),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search something...',
                              hintStyle: TextStyle(
                                  color: Colors.grey[400], fontSize: 14),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.tune, color: Colors.black, size: 22),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Filter Tabs
          Container(
            color: Colors.white,
            padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            child: Row(
              children: [
                _buildFilterChip('All', selectedFilter == 'All'),
                const SizedBox(width: 8),
                _buildFilterChip('Latest', selectedFilter == 'Latest'),
                const SizedBox(width: 8),
                _buildFilterChip('Most Popular',
                    selectedFilter == 'Most Popular'),
                const SizedBox(width: 8),
                _buildFilterChip('Cheapest', selectedFilter == 'Cheapest'),
              ],
            ),
          ),

          // Product Grid using ProductCard widget
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return ProductCard(product: favoriteProducts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return GestureDetector( onTap: () { setState(() { selectedFilter = label; }); },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration( color: isSelected ? const Color(0xFF6C63FF) : Colors.white,
          borderRadius: BorderRadius.circular(20), border: Border.all( color: isSelected ? const Color(0xFF6C63FF) : Colors.grey[300]!, ), ),
        child: Text( label, style: TextStyle( color: isSelected ? Colors.white : Colors.grey[700],
          fontSize: 13, fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal, ), ), ), ); }
}
