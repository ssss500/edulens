// import 'package:edu_lens/helper/app_constants.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
//
// class CustomRefresher extends StatelessWidget {
//   CustomRefresher({super.key, required this.child, required this.onRefresh});
//
//   final RefreshController _refreshController =
//       RefreshController(initialRefresh: false);
//
//   void _onRefresh() async {
//     // monitor network fetch
//     await Future.delayed(Duration(milliseconds: 1000));
//     await onRefresh();
//     // if failed,use refreshFailed()
//     _refreshController.refreshCompleted();
//   }
//
//   Widget child;
//   Function onRefresh;
//
//   @override
//   Widget build(BuildContext context) {
//     return SmartRefresher(
//         enablePullDown: true,
//         enablePullUp: false,
//         header: const WaterDropHeader(
//           waterDropColor: AppConstants.lightPrimaryColor,
//         ),
//         footer: CustomFooter(
//           builder: (BuildContext? context, LoadStatus? mode) {
//             Widget body;
//             if (mode == LoadStatus.idle) {
//               body = const Text("pull up load");
//             } else if (mode == LoadStatus.loading) {
//               body = const CupertinoActivityIndicator(
//                 color: AppConstants.lightPrimaryColor,
//               );
//             } else if (mode == LoadStatus.failed) {
//               body = const Text("Load Failed!Click retry!");
//             } else if (mode == LoadStatus.canLoading) {
//               body = const Text("release to load more");
//             } else {
//               body = const Text("No more Data");
//             }
//             return SizedBox(
//               height: 55.0,
//               child: Center(child: body),
//             );
//           },
//         ),
//
//         controller: _refreshController,
//         onRefresh: () => onRefresh,
//         child: child);
//   }
// }
