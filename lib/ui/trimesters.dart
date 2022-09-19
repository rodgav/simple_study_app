import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:random_color/random_color.dart';
import 'package:study_group/data/model/course.dart' as c;
import 'package:study_group/util/routes.dart';

class TrimestersView extends StatefulWidget {
  final String course;
  final List<c.Trimestre> trimestres;

  const TrimestersView(
      {required this.course, required this.trimestres, Key? key})
      : super(key: key);

  @override
  State<TrimestersView> createState() => _TrimestersViewState();
}

class _TrimestersViewState extends State<TrimestersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.course} - Trimestres'),
        ),
        body: GridView.custom(
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            pattern: [
              const WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerStart,
              ),
              const WovenGridTile(1),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate((context, index) {
            final trimestre = widget.trimestres[index];
            return GestureDetector(
              onTap: () => context.push(
                  '${Routes.themesRoute}/${widget.course}',
                  extra: trimestre.themes),
              child: Container(
                decoration: BoxDecoration(
                    color: RandomColor().randomColor(
                        colorSaturation: ColorSaturation.mediumSaturation),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    trimestre.name,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }, childCount: widget.trimestres.length),
        ));
  }
}
