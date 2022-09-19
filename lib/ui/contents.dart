import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_color/random_color.dart';
import 'package:study_group/data/model/course.dart' as c;
import 'package:study_group/util/routes.dart';

class ContentsView extends StatefulWidget {
  final String course;
  final c.Theme theme;

  const ContentsView({required this.course, required this.theme, Key? key})
      : super(key: key);

  @override
  State<ContentsView> createState() => _ContentsViewState();
}

class _ContentsViewState extends State<ContentsView> {
  final _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    final name = widget.theme.name.replaceAll(' ', '');
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.course} - Contenidos'),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => context.push('${Routes.videosRoute}/$name',
                      extra: widget.theme.videos),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: _randomColor.randomColor(
                          colorSaturation: ColorSaturation.mediumSaturation),
                      radius: 100,
                      child: const Text(
                        'Videos',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.push('${Routes.materialsRoute}/$name',
                        extra: widget.theme.materials);
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      backgroundColor: _randomColor.randomColor(
                          colorSaturation: ColorSaturation.mediumSaturation),
                      radius: 100,
                      child: const Text(
                        'Materiales',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.push('${Routes.activitiesRoute}/$name',
                      extra: widget.theme.activities),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: _randomColor.randomColor(
                          colorSaturation: ColorSaturation.mediumSaturation),
                      radius: 100,
                      child: const Text(
                        'Actividades',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
