import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  static final storage = const FlutterSecureStorage();

  logout() async {
    await storage.delete(key: 'login');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logout();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(8, 8))
          ],
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
        ),
        height: 50,
        width: 50,
        child: Text('LOGOUT',
            style: GoogleFonts.notoSansKannada(
              fontSize: 10,
              color: Theme.of(context).colorScheme.outline,
            )),
      ),
    );
  }
}
