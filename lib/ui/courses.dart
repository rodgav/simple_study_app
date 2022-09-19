import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:random_color/random_color.dart';
import 'package:study_group/data/model/course.dart';
import 'package:study_group/util/routes.dart';

class CoursesView extends StatefulWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  State<CoursesView> createState() => _CoursesViewState();
}

class _CoursesViewState extends State<CoursesView> {
  late final Future<List<Course>> _myFuture;

  @override
  void initState() {
    _myFuture = _loadAsset();
    super.initState();
  }

  Future<List<Course>> _loadAsset() async {
    print('_loadAsset');
    final data = await rootBundle.loadString('assets/jsons/data.json');
    final courses = coursesFromJson(data);
    return courses.courses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cursos'),
        ),
        body: FutureBuilder<List<Course>>(
            future: _myFuture,
            builder: (_, snapshot) {
              final courses = snapshot.data;
              return courses != null && courses.isNotEmpty
                  ? GridView.custom(
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
                      childrenDelegate:
                          SliverChildBuilderDelegate((context, index) {
                        final course = courses[index];
                        return GestureDetector(
                          onTap: () => context.push(
                              '${Routes.trimestersRoute}/${course.name}',
                              extra: course.trimestres),
                          child: Container(
                            decoration: BoxDecoration(
                                color: RandomColor().randomColor(
                                    colorSaturation:
                                        ColorSaturation.mediumSaturation),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(course.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        );
                      }, childCount: courses.length),
                    )
                  : const Center(
                      child: Text('Cursos no encontrados'),
                    );
            }));
  }
}
