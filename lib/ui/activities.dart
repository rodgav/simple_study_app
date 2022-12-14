import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:random_color/random_color.dart';
import 'package:study_group/util/routes.dart';

class ActivitiesView extends StatefulWidget {
  final String theme;
  final List<String> activities;

  const ActivitiesView(
      {required this.theme, required this.activities, Key? key})
      : super(key: key);

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.theme} - Actividades'),
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
              (context, index) {final activity = widget.activities[index];
              return GestureDetector(
                onTap: () => context.push(Routes.pdfRoute, extra: activity),
                child: Container(
                  decoration: BoxDecoration(
                      color: RandomColor().randomColor(
                          colorSaturation: ColorSaturation.mediumSaturation),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Icon(
                    Icons.picture_as_pdf,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              );
              },
              childCount:  widget.activities.length),
        ));
  }
}
