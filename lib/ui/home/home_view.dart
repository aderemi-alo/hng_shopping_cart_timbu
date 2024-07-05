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
        title: const Text('Shop'),
      ),
      body: viewModel.isLoaded
          ? viewModel.items != null && viewModel.items!.isNotEmpty
              ? ListView.builder(
                  itemCount: viewModel.items!.length,
                  itemBuilder: (context, index) {
                    final item = viewModel.items![index];
                    if (item.photos.isNotEmpty) {
                      print(item.photos[0].url);
                    }
                    return Container(
                      child: Row(
                        children: [
                          Column(
                            children: [Text(item.name)],
                          ),
                          Image.network(
                              "https://api.timbu.cloud/images/${item.photos}?auto=compress&cs=tinysrgb&dpr=1&w=200")
                        ],
                      ),
                    );
                    // ListTile(
                    //   title: Text(item.name),
                    //   subtitle: item.description != null
                    //       ? Text(item.description as String)
                    //       : null,
                    //   trailing: item.photos.isNotEmpty
                    //       ? Image.network(
                    //           "https://api.timbu.cloud/images/${item.photos}?auto=compress&cs=tinysrgb&dpr=1&w=200")
                    //       : null,
                    // );
                  },
                )
              : const Center(child: Text('No items available'))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
