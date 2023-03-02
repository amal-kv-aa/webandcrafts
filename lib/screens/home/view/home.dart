import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:webandcraft/screens/detailspage/view/details.dart';
import 'package:webandcraft/screens/home/provider/home_provider.dart';
import 'package:webandcraft/screens/home/view/widget/card_layout/card_layout.dart';
import 'package:webandcraft/screens/home/view/widget/list_tile/listtile.dart';
import 'package:webandcraft/screens/home/view/widget/searchbar/search_bar.dart';
import 'package:webandcraft/widgets/bg_container/bg_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  backgroundColor: const Color.fromARGB(255, 1, 14, 12),
                  floating: true,
                  snap: true,
                  automaticallyImplyLeading: false,
                  actions: [
                    const SearchBar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        context.watch<HomeProvider>().isListview
                            ? IconButton(
                                onPressed: () {
                                  context
                                      .read<HomeProvider>()
                                      .updateView(false);
                                },
                                icon: Icon(
                                  Icons.grid_on_rounded,
                                  size: 28.sp,
                                  color: Colors.white,
                                ))
                            : IconButton(
                                onPressed: () {
                                  context.read<HomeProvider>().updateView(true);
                                },
                                icon: Icon(
                                  Icons.menu,
                                  size: 28.sp,
                                  color: Colors.white,
                                ))
                      ],
                    ),
                  ],
                )
              ],
          body: BgContainer(
            child: SingleChildScrollView(
              child: Consumer<HomeProvider>(builder: (context, value, child) {
                if (value.empoyessModel == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (value.isListview) {
                  return ListView.builder(
                    itemCount: value.empoyessModel!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: (() => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => DetailsPage(
                                      data: value.empoyessModel![index])))),
                          child: CoustomListTile(
                              data: value.empoyessModel![index]));
                    },
                  );
                }
                return GridView.builder(
                  addAutomaticKeepAlives: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.w,
                    mainAxisExtent: 170.h,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 3,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.empoyessModel!.length,
                  itemBuilder: (context, index) {
                    return CardLayout(
                      data: value.empoyessModel![index],
                    );
                  },
                );
              }),
            ),
          )),
    );
  }
}
