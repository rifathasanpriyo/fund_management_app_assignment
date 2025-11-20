// import 'package:flutter/material.dart';

// import 'route/app_router.dart';
// import 'route/app_routes.dart';
// import 'theme/light_theme.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<SplashBloc>(create: (context) => SplashBloc()),
//         //!-------for teacher--------
//         BlocProvider<TeacherAuthBloc>(create: (context) => TeacherAuthBloc()),
//         BlocProvider<TeacherProfileBloc>(
//           create: (context) => TeacherProfileBloc(),
//         ),
//         BlocProvider<TeacherAttendanceBloc>(
//           create: (context) => TeacherAttendanceBloc(),
//         ),
//         BlocProvider<SubjectBloc>(create: (context) => SubjectBloc()),
//         BlocProvider<BranchBloc>(create: (context) => BranchBloc()),
//         BlocProvider<ChangePasswordTeacherBloc>(
//           create: (context) => ChangePasswordTeacherBloc(),
//         ),

//         //!-------for student--------
//         BlocProvider<StudentAuthBloc>(create: (context) => StudentAuthBloc()),
//         BlocProvider<StudentProfileBloc>(
//           create: (context) => StudentProfileBloc(),
//         ),
//         BlocProvider<ChangePasswordStudentBloc>(
//           create: (context) => ChangePasswordStudentBloc(),
//         ),


//         BlocProvider<AttendanceBloc>(create: (context) => AttendanceBloc()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Polytech',
//         theme: lightTheme,
//         //  initialRoute: AppRoutes.splashPage,
//         initialRoute: AppRoutes.splashPage,
//         onGenerateRoute: AppRouter.generateRoute,
//       ),
//     );
//   }
// }
