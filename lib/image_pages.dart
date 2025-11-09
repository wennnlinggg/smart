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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Column(
          children: [
            const SizedBox(height: 8),
            // Top row: notification (left), title (center), add button (right)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  // notification
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const NotificationsPage())),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text('Eco Plug', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.green)),
                    ),
                  ),
                  // add button with popup menu
                  PopupMenuButton<String>(
                    onSelected: (v) {
                      if (v == 'add') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddDevicePage()));
                      }
                    },
                    itemBuilder: (context) => [const PopupMenuItem(value: 'add', child: Text('Add Device'))],
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black12)),
                      child: const Icon(Icons.add, size: 20),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // main content: large centered image (energy icon or placeholder)
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Image.asset(
                    'assets/images/energy.png',
                    width: 240,
                    height: 240,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(Icons.bolt, size: 140, color: Colors.green),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddDevicePage extends StatelessWidget {
  const AddDevicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: const Text('Add Device', style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              child: SizedBox(
                width: double.infinity,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
                        child: const Icon(Icons.qr_code_scanner, size: 28, color: Colors.black54),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text('Scan to add', style: TextStyle(fontSize: 14, color: Colors.black87)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text('Point your camera at the device QR code to add it to your home.'),
          ],
        ),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Sustainable Life!',
        'subtitle': 'Start your day sustainably — switching off now saves energy and supports your Net Zero goals.',
        'time': '12:00 PM'
      },
      {
        'title': 'Monitor, Schedule and Control',
        'subtitle': 'Monitor, Schedule and Control your device to save both energy and the planet.',
        'time': '11:00 AM'
      },
      {
        'title': 'Get Connected Now',
        'subtitle': 'Connect your first device and see how easy it is to start saving energy!',
        'time': '11:00 AM'
      },
      {
        'title': 'Welcome to Eco Plug!',
        'subtitle': 'Your journey toward a smarter, greener home starts here.',
        'time': '10:50 AM'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: const Text('Notifications', style: TextStyle(color: Colors.black)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, i) {
          final it = items[i];
          return ListTile(
            title: Text(it['title']!, style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Text(it['subtitle']!),
            trailing: Text(it['time']!, style: const TextStyle(color: Colors.black54, fontSize: 12)),
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          );
        },
      ),
    );
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
            Text('Layout-only mockup — images not loaded', style: Theme.of(context).textTheme.bodySmall),
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
