import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:random_color/random_color.dart';
import 'package:study_group/data/model/course.dart' as c;
import 'package:study_group/util/routes.dart';

class ThemesView extends StatefulWidget {
  final String course;
  final List<c.Theme> themes;

  const ThemesView({required this.course, required this.themes, Key? key})
      : super(key: key);

  @override
  State<ThemesView> createState() => _ThemesViewState();
}

class _ThemesViewState extends State<ThemesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.course} - Videos'),
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
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            final theme = widget.themes[index];
            return GestureDetector(
              onTap: () => context
                  .push('${Routes.contentsRoute}/${widget.course}', extra: theme),
              child: Container(
                decoration: BoxDecoration(
                    color: RandomColor().randomColor(
                        colorSaturation: ColorSaturation.mediumSaturation),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(theme.name,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            );
          }, childCount: widget.themes.length),
        ));
  }
}
