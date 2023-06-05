// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // import '../../../../../models/slider_model.dart';
// // import '../../../../../utils/constant.dart';

// // class HomePageSlider extends StatelessWidget {
// //   const HomePageSlider({
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Container(
// //         decoration: BoxDecoration(
// //             color: Color.fromARGB(120, 233, 232, 232),
// //             borderRadius: BorderRadius.circular(10)),
// //         height: 300.h,
// //         child: PageView(
// //           children: SlideShow.slideShow().map((slide) {
// //             return Container(
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 50),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Column(
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         myTitle(slide),
// //                         SizedBox(height: 10),
// //                         mySubTitle(slide),
// //                         SizedBox(height: 10),
// //                         myDescription(slide),
// //                       ],
// //                     ),
// //                     Image.asset(
// //                       slide.photo,
// //                       width: 400.h,
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             );
// //           }).toList(),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../../../models/slider_model.dart';
// import '../../../../../utils/constant.dart';

// class HomePageSlider extends StatelessWidget {
//    HomePageSlider({Key? key}) : super(key: key);
// final _controller = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//             color: Color.fromARGB(120, 233, 232, 232),
//             borderRadius: BorderRadius.circular(10)),
//         height: 300.h,
//         child: PageView(
//           controller: _controller,
//           children: SlideShow.slideShow().map((slide) {
//             return Container(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           myTitle(slide),
//                           SizedBox(height: 10),
//                           mySubTitle(slide),
//                           SizedBox(height: 10),
//                           myDescription(slide),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20.w,
//                     ),
//                     Expanded(
//                       child: Image.asset(
//                         slide.photo,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }}
import 'package:flutter/material.dart';

import '../../../../../../core/models/slider_model.dart';
import '../../../../../../core/utils/constant.dart';


class HomePageSlider extends StatefulWidget {
  const HomePageSlider({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageSliderState createState() => _HomePageSliderState();
}

class _HomePageSliderState extends State<HomePageSlider> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(120, 233, 232, 232),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 300,
        child: PageView(
          controller: _controller,
          children: SlideShow.slideShow().map((slide) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myTitle(slide),
                      const SizedBox(height: 10),
                      mySubTitle(slide),
                      const SizedBox(height: 10),
                      myDescription(slide),
                    ],
                  ),
                  Image.asset(
                    slide.photo,
                    width: 400,fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
