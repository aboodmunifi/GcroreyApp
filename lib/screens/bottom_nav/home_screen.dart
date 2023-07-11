import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/get/products_getx_controller.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/screens/product/product_details_screen.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/app_screens.dart';
import '../../get/address_getx_controller.dart';
import '../../widget/home_section.dart';
import '../../widget/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageViewController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put<AddressGetController>(AddressGetController());
    Get.put<ProductsGetController>(ProductsGetController());
    _pageViewController = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 33.h,
      ),
      children: [
        Container(
          height: 180.h,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Container(
            height: 180.w,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: PageView(
              controller: _pageViewController,
              children: [],
            ),
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        HomeSection(
          leading: "Popular Bundles",
          onPressed: () =>
              Navigator.pushNamed(context, AppScreens.popularBundlesScreen),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 205.h, maxWidth: 184.w),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 205 / 184,
              mainAxisSpacing: 14,
            ),
            itemBuilder: (context, index) {
              return ProductItem(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      product: Product(),
                    ),
                  ),
                ),
                img: '',
                title: 'title',
                subTitle: 'subTitle',
                currentPrice: 'currentPrice',
                oldPrice: 30,
              );
            },
          ),
        ),
        SizedBox(
          height: 25.h,
        ),
        HomeSection(
          leading: "Our New Item",
          onPressed: () =>
              Navigator.pushNamed(context, AppScreens.newProductsScreen),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 184 / 205,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ProductItem(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    product: Product(),
                  ),
                ),
              ),
              img: '',
              title: 'title',
              subTitle: 'subTitle',
              currentPrice: 'currentPrice',
              oldPrice: 30,
            );
          },
        ),
      ],
    );
  }
}
