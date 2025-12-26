import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/chambers_provider.dart';

class ChambersSection extends ConsumerWidget {
  const ChambersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chambersAsync = ref.watch(chambersProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add chamber logic
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Add Chamber feature pending")),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: chambersAsync.when(
        data: (chambers) {
          if (chambers.isEmpty) {
            return const Center(child: Text("No chambers added yet."));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: chambers.length,
            separatorBuilder: (c, i) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final chamber = chambers[index];
              return Card(
                child: ListTile(
                  title: Text(chamber.chamberName),
                  subtitle: Text(chamber.address),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // TODO: Edit logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Edit Chamber feature pending"),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
