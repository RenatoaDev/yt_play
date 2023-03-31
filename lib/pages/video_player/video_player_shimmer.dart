import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VideoPlayerShimmer extends StatelessWidget {
  const VideoPlayerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerWidth = double.maxFinite;
    double containerHeight = 30.0;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: containerHeight / 2,
              width: containerWidth,
              color: Colors.grey.shade200,
            ),
            const SizedBox(height: 6.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: containerHeight,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: containerHeight,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: containerHeight,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: containerHeight,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: containerHeight,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
