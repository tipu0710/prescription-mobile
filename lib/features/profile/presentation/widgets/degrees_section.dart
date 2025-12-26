import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/degrees_provider.dart';

class DegreesSection extends ConsumerWidget {
  const DegreesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final degreesAsync = ref.watch(degreesProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add degree logic
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Add Degree feature pending")),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: degreesAsync.when(
        data: (degrees) {
          if (degrees.isEmpty) {
            return const Center(child: Text("No degrees added yet."));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: degrees.length,
            separatorBuilder: (c, i) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final degree = degrees[index];
              return Card(
                child: ListTile(
                  title: Text(degree.degreeName),
                  subtitle: Text(
                    "${degree.institution}\n${degree.fieldOfStudy}",
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // TODO: Edit logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Edit Degree feature pending"),
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
