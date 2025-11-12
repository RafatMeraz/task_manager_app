import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/screens/update_profile_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({super.key, this.fromUpdateProfile = false});

  final bool fromUpdateProfile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if (fromUpdateProfile) {
            return;
          }

          Navigator.pushNamed(context, UpdateProfileScreen.name);
        },
        child: Row(
          spacing: 12,
          children: [
            CircleAvatar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rahim Hasan',
                  style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                ),
                Text(
                  'rahim@gmail.com',
                  style: textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
