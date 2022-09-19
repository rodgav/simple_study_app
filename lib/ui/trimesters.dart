import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      body: ListView.separated(
          itemBuilder: (_, index) {
            final trimestre = widget.trimestres[index];
            return ListTile(
              title: Text(trimestre.name),
              onTap: () => context.push(
                  '${Routes.themesRoute}/${widget.course}',
                  extra: trimestre.themes),
            );
          },
          separatorBuilder: (_, index) => const Divider(),
          itemCount: widget.trimestres.length),
    );
  }
}
