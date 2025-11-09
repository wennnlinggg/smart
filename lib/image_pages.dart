import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LayoutMock(title: 'Home');
  }
}

class EnergyPage extends StatelessWidget {
  const EnergyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LayoutMock(title: 'Energy');
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LayoutMock(title: 'Profile');
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LayoutMock(title: 'Settings');
  }
}

class _LayoutMock extends StatelessWidget {
  final String title;
  const _LayoutMock({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 320,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
              ),
              padding: const EdgeInsets.all(12),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(4, (i) => _PlaceholderCard(index: i + 1)),
              ),
            ),
            const SizedBox(height: 16),
            Text('Layout-only mockup — images not loaded', style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderCard extends StatelessWidget {
  final int index;
  const _PlaceholderCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(child: Text('Screenshot $index', style: const TextStyle(fontSize: 12))),
    );
  }
}
