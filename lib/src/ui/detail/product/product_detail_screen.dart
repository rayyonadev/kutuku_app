import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 3;
  int selectedColorIndex = 0;

  final List<Color> productColors = [
    const Color(0xFF8B6B61),
    const Color(0xFF000000),
    const Color(0xFF40C4E4),
    const Color(0xFF00D084),
  ];

  void changeQuantity(int delta) {
    setState(() {
      if (quantity + delta > 0) {
        quantity += delta;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Top section with gradient background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.grey[100]!, Colors.grey[200]!],
                ),
              ),
              child: Column(
                children: [
                  // Top bar with back and cart buttons
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.arrow_back_ios_new, size: 18),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.shopping_cart_outlined, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Product image
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500',
                      height: 280,
                      width: 280,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 280,
                          width: 280,
                          color: Colors.grey[300],
                          child: const Icon(Icons.shopping_bag, size: 100, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Product details section
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product name
                      const Text(
                        'Box Bag Linar 1883',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(height: 12),

                      // Rating and stock status
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4),
                          const Text('4.8', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(width: 4),
                          Text('(320 Review)', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                          const Spacer(),
                          Text('Available in stok', style: TextStyle(color: Colors.green[600], fontWeight: FontWeight.w500, fontSize: 13)),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Color selection
                      const Text('Color', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                      const SizedBox(height: 12),
                      Row(
                        children: List.generate(productColors.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColorIndex = index;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: productColors[index],
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: selectedColorIndex == index ? Colors.grey[400]! : Colors.grey[300]!,
                                    width: selectedColorIndex == index ? 3 : 1,
                                  ),
                                  boxShadow: selectedColorIndex == index ? [
                                    BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8, spreadRadius: 2),
                                  ] : [],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 24),

                      // Description
                      const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5),
                          children: const [
                            TextSpan(text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a '),
                            TextSpan(text: 'Read More', style: TextStyle(color: Color(0xFF6C63FF), fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Quantity and Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => changeQuantity(-1),
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                                    child: const Icon(Icons.remove, size: 16),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text('$quantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                ),
                                GestureDetector(
                                  onTap: () => changeQuantity(1),
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
                                    child: const Icon(Icons.add, size: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text('\$35.25', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87)),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Add to cart button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6C63FF),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            elevation: 8,
                            shadowColor: const Color(0xFF6C63FF).withOpacity(0.4),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart_outlined, size: 22),
                              SizedBox(width: 12),
                              Text('Add to Cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}