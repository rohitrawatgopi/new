import 'package:flutter/material.dart';

Future<dynamic> navigateTo({
  required BuildContext context,
  required Widget to,
}) async {
  var res = await Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return to;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ),
  );
  return res;
}

navigateRemoveUntil({required BuildContext context, required Widget to}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return to;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ),
    (route) => false,
  );
}

navigateReplaceMent({required BuildContext context, required Widget to}) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return to;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ),
  );
}
