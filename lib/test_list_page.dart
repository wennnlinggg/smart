import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class TestListPage extends StatelessWidget {
  const TestListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref('test');

    return Scaffold(
      appBar: AppBar(title: const Text('Realtime Test Data')),
      body: StreamBuilder<DatabaseEvent>(
        stream: ref.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasError) return Center(child: Text('Error: ${snapshot.error}'));
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final snap = snapshot.data!.snapshot;
          if (snap.value == null) return const Center(child: Text('No data'));

          final raw = snap.value;
          // try to convert to Map
          Map<String, dynamic> map;
          try {
            map = Map<String, dynamic>.from(raw as Map);
          } catch (_) {
            return Center(child: Text('Unexpected data: ${raw.toString()}'));
          }

          final entries = map.entries.toList();

          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, i) {
              final e = entries[i];
              return ListTile(
                title: Text(e.key),
                subtitle: Text(e.value.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
