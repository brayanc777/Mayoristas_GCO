import 'package:flutter/material.dart';
import 'package:mayoristas/ui/widgets/reception_detail.dart';
import 'package:mayoristas/widgets/bg_image.dart';
import '../../controllers/product_service.dart';
import '../widgets/sid_input.dart';
import 'package:mayoristas/models/product_model.dart';

class ReceptPage extends StatefulWidget {
  const ReceptPage({super.key});

  @override
  State<ReceptPage> createState() => _ReceptPageState();
}

class _ReceptPageState extends State<ReceptPage> {
  final TextEditingController controller = TextEditingController();
  final ProductsProvider _productsProvider = ProductsProvider();
  final int _productId = 1; 

  Future<ProductModel> _fetchProduct() async {
    return await _productsProvider.productById(_productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Positioned(top: 193, left: 50, height: 385, child: BgImage()),
          FutureBuilder<ProductModel>(
            future: _fetchProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final product = snapshot.data!;
                return ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SidInput(controller: controller),
                        const SizedBox(height: 10.0),
                        ReceptionDetail(product: product),
                      ],
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('No product found'));
              }
            },
          ),
        ],
      ),
    );
  }
}
