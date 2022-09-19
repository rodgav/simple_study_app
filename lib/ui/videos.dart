import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:random_color/random_color.dart';

class VideosView extends StatefulWidget {
  final String theme;
  final List<String> videos;

  const VideosView({required this.theme, required this.videos, Key? key})
      : super(key: key);

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.theme} - Videos'),
        ),
        body: GridView.custom(
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            pattern: [
              const WovenGridTile(1),
              const WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                    decoration: BoxDecoration(
                        color: RandomColor().randomColor(
                            colorSaturation: ColorSaturation.mediumSaturation),
                        borderRadius: BorderRadius.circular(20)),
                  ),
              childCount: 100),
        ));
  }
}
