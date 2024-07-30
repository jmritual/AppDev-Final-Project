import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
                           backgroundImage: AssetImage('assets/img/10.jpg'),
            ),
            const SizedBox(height: 16),
            
            TextButton.icon(
              onPressed: () {},
              label: const Text('John Doe'),
            ),
            const SizedBox(height: 32),
            ProfileMenuItem(
              icon: Icons.person,
              text: 'My Account',
              press: () {},
            ),
            ProfileMenuItem(
              icon: Icons.notifications,
              text: 'Notifications',
              press: () {},
            ),
            ProfileMenuItem(
              icon: Icons.history,
              text: 'History',
              press: () {},
            ),
            ProfileMenuItem(
              icon: Icons.settings,
              text: 'Settings',
              press: () {},
            ),
            ProfileMenuItem(
              icon: Icons.logout,
              text: 'Log Out',
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback press;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black,
              size: 22,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}