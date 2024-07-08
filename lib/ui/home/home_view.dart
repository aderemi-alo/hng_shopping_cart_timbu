import 'package:flutter/material.dart';
import 'package:hng_shopping_cart_timbu/ui/home/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ShopViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ShopViewModel();
    viewModel.onChanged.listen((_) {
      setState(() {}); // Rebuild the UI when the ViewModel notifies
    });
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: viewModel.isLoaded
          ? viewModel.items != null && viewModel.items!.isNotEmpty
              ? ListView.builder(
                  itemCount: viewModel.items!.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.items![index];
                    return Column(
                      children: [
                        item.photos.isNotEmpty
                            ? Image.network(
                                height: 200,
                                width: 250,
                                "https://api.timbu.cloud/images/${item.photos[0].url}?auto=compress&cs=tinysrgb&dpr=1&w=200")
                            : Container(),
                        Column(
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                                "Price: ₦${item.currentPrice[0].ngn[0].toInt()}"),
                            Text(
                                "In stock: ${item.availableQuantity!.toInt()}"),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    );
                  },
                )
              : const Center(child: Text('No items available'))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
