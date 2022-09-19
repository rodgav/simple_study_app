import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_group/ui/activities.dart';
import 'package:study_group/ui/contents.dart';
import 'package:study_group/ui/courses.dart';
import 'package:study_group/ui/login.dart';
import 'package:study_group/ui/materials.dart';
import 'package:study_group/ui/pdf.dart';
import 'package:study_group/ui/themes.dart';
import 'package:study_group/ui/trimesters.dart';
import 'package:study_group/ui/videos.dart';
import 'package:study_group/data/model/course.dart' as c;
import 'package:study_group/ui/youtube.dart';

class Routes {
  static const String loginRoute = '/';
  static const String coursesRoute = '/courses';
  static const String trimestersRoute = '/trimesters';
  static const String themesRoute = '/themes';
  static const String contentsRoute = '/contents';
  static const String videosRoute = '/videos';
  static const String materialsRoute = '/materials';
  static const String activitiesRoute = '/activities';
  static const String pdfRoute = '/pdf';
  static const String youtubeRoute = '/youtube';
}

class RouteGenerator {
  static final router = GoRouter(
      routerNeglect: true,
      routes: [
        GoRoute(
            path: Routes.loginRoute,
            builder: (context, state) {
              return const LoginView();
            }),
        GoRoute(
            path: Routes.coursesRoute,
            builder: (context, state) {
              return const CoursesView();
            }),
        GoRoute(
            path: '${Routes.trimestersRoute}/:cn',
            builder: (context, state) {
              return TrimestersView(
                  course: state.params['cn'] ?? 'null',
                  trimestres: state.extra as List<c.Trimestre>);
            }),
        GoRoute(
            path: '${Routes.themesRoute}/:cn',
            builder: (context, state) {
              return ThemesView(
                  course: state.params['cn'] ?? 'null',
                  themes: state.extra as List<c.Theme>);
            }),
        GoRoute(
            path: '${Routes.contentsRoute}/:cn',
            builder: (context, state) {
              return ContentsView(
                  course: state.params['cn'] ?? 'null',
                  theme: state.extra as c.Theme);
            }),
        GoRoute(
            path: '${Routes.videosRoute}/:tn',
            builder: (context, state) {
              return VideosView(
                  theme: state.params['tn'] ?? 'null',
                  videos: state.extra as List<String>);
            }),
        GoRoute(
            path: '${Routes.materialsRoute}/:tn',
            builder: (context, state) {
              return MaterialsView(
                  theme: state.params['tn'] ?? 'null',
                  materials: state.extra as List<String>);
            }),
        GoRoute(
            path: '${Routes.activitiesRoute}/:tn',
            builder: (context, state) {
              return ActivitiesView(
                  theme: state.params['tn'] ?? 'null',
                  activities: state.extra as List<String>);
            }),
        GoRoute(
            path: Routes.youtubeRoute,
            builder: (context, state) {
              print('state.extra ${state.extra}');
              return YoutubeView(videoId: state.extra as String);
            }),
        GoRoute(
            path: Routes.pdfRoute,
            builder: (context, state) {
              return PdfView(pdf: state.extra as String);
            }),
      ],
      errorBuilder: (context, state) => unDefinedRoute(context),
      initialLocation: Routes.loginRoute,
      debugLogDiagnostics: true);

  static unDefinedRoute(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Ocurrio un error')),
    );
  }
}
