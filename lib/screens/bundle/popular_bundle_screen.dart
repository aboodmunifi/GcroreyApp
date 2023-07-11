import 'package:flutter/material.dart';
import 'package:grocery_app/utils/app_colors.dart';

class PopularBundlesScreen extends StatelessWidget {
  const PopularBundlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Popular Items"),
      ),
      body: const Text(""),
      // body: BlocBuilder<ProductBlock, CrudState>(
      //   // buildWhen: (previous, current) => current is LoadingState || (current is ProcessState<Home> && current.processType == ProcessType.readHome),
      //   buildWhen: (previous, current) => current is LoadingState || current is ReadHomeState,
      //   builder: (context, state){
      //     if(state is LoadingState){
      //       return const Center(child: CircularProgressIndicator(color: AppColors.primary,),);
      //     }else{
      //       state as ReadHomeState;
      //       var home = state.data;
      //       if(home != null){
      //         return GridView.custom(
      //           padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 25.h),
      //           gridDelegate: SliverWovenGridDelegate.count(
      //             crossAxisCount: 2,
      //             crossAxisSpacing: 8,
      //             pattern: const [
      //               WovenGridTile(184/190,alignment: AlignmentDirectional.center),
      //               WovenGridTile(184/220,alignment: AlignmentDirectional.center),
      //             ],
      //           ),
      //           childrenDelegate: SliverChildBuilderDelegate(
      //             childCount: home.famousProducts.length, (context, index){
      //               return ProductItem(
      //                 onPressed: () => Navigator.pushNamed(context, AppScreens.productDetailsScreen),
      //                 img: home.famousProducts[index].imageUrl,
      //                 title: home.famousProducts[index].nameEn,
      //                 subTitle: home.famousProducts[index].infoEn,
      //                 currentPrice: home.famousProducts[index].price,
      //               );
      //             },
      //           ),
      //         );
      //       }else{
      //         return Center(child: Text("No Data",style: GoogleFonts.nunitoSans(fontSize: 24.sp,color: AppColors.black,),),);
      //       }
      //     }
      //   },
      // ),
    );
  }
}
