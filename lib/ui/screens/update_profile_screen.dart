import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widgets/screen_background.dart';
import 'package:task_manager_app/ui/widgets/tm_app_bar.dart';

import '../widgets/photo_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  static const String name = '/update-profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(fromUpdateProfile: true),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              const SizedBox(height: 36),
              Text(
                'Update Profile',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              GestureDetector(onTap: () {}, child: PhotoPicker()),
              TextFormField(decoration: InputDecoration(hintText: 'Email')),
              TextFormField(
                decoration: InputDecoration(hintText: 'First name'),
              ),
              TextFormField(decoration: InputDecoration(hintText: 'Last name')),
              TextFormField(decoration: InputDecoration(hintText: 'Mobile')),
              TextFormField(decoration: InputDecoration(hintText: 'Password')),
              const SizedBox(height: 8),
              FilledButton(
                onPressed: _onTapUpdateButton,
                child: Icon(Icons.arrow_circle_right_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapUpdateButton() {}
}
