// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'app_routes.dart';

// class AppRouter {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//           case AppRoutes.splashPage:
//         return CupertinoPageRoute(builder: (_) => const SplashPage());
//       case '/':
//         return CupertinoPageRoute(builder: (_) => const Placeholder());
//       //! Root


// //!for teacher
//       case AppRoutes.teacherRootPage:
//         return CupertinoPageRoute(builder: (_) => const TeacherRootPage());

//       case AppRoutes.teacherLoginPage:
//         return CupertinoPageRoute(builder: (_) => const TeacherLoginPage());

//       case AppRoutes.teacherDashboardPage:
//         return CupertinoPageRoute(builder: (_) => const TeacherDashboardPage());

//               case AppRoutes.roleSelectionPage:
//         return CupertinoPageRoute(builder: (_) => const RoleSelectionPage());
//                       case AppRoutes.attendanceTeacherPage:
//         return CupertinoPageRoute(builder: (_) =>  AttendanceTeacherPage( 
//           attendanceModel: settings.arguments as AttendanceModel,
//         ));
//          case AppRoutes.newAttendanceCreatePage:
//         return CupertinoPageRoute(builder: (_) => const NewAttendanceCreatePage());
//           case AppRoutes.teacherProfilePage:
//         return CupertinoPageRoute(builder: (_) => const TeacherProfilePage());
//           case AppRoutes.teacherProfileUpdatePage:
//         return CupertinoPageRoute(builder: (_) => const TeacherProfileUpdatePage());
//          case AppRoutes.teacherChangePasswordPage:
//         return CupertinoPageRoute(builder: (_) => const TeacherChangePasswordPage());
        
// //!------------------end for teacher------------------


// //!for student
// case AppRoutes.studentRootPage:
//         return CupertinoPageRoute(builder: (_) => const StudentRootPage());
//    case AppRoutes.studentLoginPage:
//         return CupertinoPageRoute(builder: (_) => const StudentLoginPage());
//           case AppRoutes.studentChangePasswordPage:
//         return CupertinoPageRoute(builder: (_) => const StudentChangePasswordPage());
//    case AppRoutes.studentCurrentSemester:
//         return CupertinoPageRoute(builder: (_) => const StudentCurrentSemester());
//       default:
//         return CupertinoPageRoute(
//           builder: (_) =>
//               const Scaffold(body: Center(child: Text('Route not found'))),
//         );
//     }
//   }
// }
