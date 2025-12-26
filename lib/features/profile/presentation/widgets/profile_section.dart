import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/presentation/providers/user_provider.dart';
import '../../../auth/data/models/user_profile.dart';

class ProfileSection extends ConsumerStatefulWidget {
  const ProfileSection({super.key});

  @override
  ConsumerState<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends ConsumerState<ProfileSection> {
  // We will add form controllers later. For now, let's just show the data.
  // Actually, let's make it a form from the start.

  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _designationController;
  late TextEditingController _workingPlaceController;
  late TextEditingController _bmdcController; // Read-only usually?
  String? _gender;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _designationController = TextEditingController();
    _workingPlaceController = TextEditingController();
    _bmdcController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _designationController.dispose();
    _workingPlaceController.dispose();
    _bmdcController.dispose();
    super.dispose();
  }

  void _initializeControllers(UserProfile profile) {
    if (_nameController.text.isEmpty && profile.fullName != null) {
      _nameController.text = profile.fullName!;
    }
    if (_phoneController.text.isEmpty && profile.phoneNumber != null) {
      _phoneController.text = profile.phoneNumber!;
    }
    if (_designationController.text.isEmpty && profile.designation != null) {
      _designationController.text = profile.designation!;
    }
    if (_workingPlaceController.text.isEmpty && profile.workingPlace != null) {
      _workingPlaceController.text = profile.workingPlace!;
    }
    if (_bmdcController.text.isEmpty) {
      _bmdcController.text = profile.bmdcNumber;
    }
    if (_gender == null && profile.gender != null) {
      final genderStr = profile.gender.toString();
      if (['MALE', 'FEMALE', 'OTHER'].contains(genderStr)) {
        _gender = genderStr;
      } else {
        _gender = null; // or default to 'OTHER' or leave as null
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userProvider);

    return userAsync.when(
      data: (profile) {
        _initializeControllers(profile);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _bmdcController,
                  decoration: const InputDecoration(labelText: 'BMDC Number'),
                  readOnly: true, // Assuming BMDC is not editable
                  enabled: false,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Full Name *'),
                  validator: (v) => v?.isNotEmpty == true ? null : 'Required',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number *',
                    prefixText: '+880 ',
                  ),
                  validator: (v) => v?.isNotEmpty == true ? null : 'Required',
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: _gender,
                  decoration: const InputDecoration(labelText: 'Gender *'),
                  items: const [
                    DropdownMenuItem(value: 'MALE', child: Text('Male')),
                    DropdownMenuItem(value: 'FEMALE', child: Text('Female')),
                    DropdownMenuItem(value: 'OTHER', child: Text('Other')),
                  ],
                  onChanged: (v) {
                    setState(() => _gender = v);
                  },
                  validator: (v) => v != null ? null : 'Required',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _designationController,
                  decoration: const InputDecoration(labelText: 'Designation *'),
                  validator: (v) => v?.isNotEmpty == true ? null : 'Required',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _workingPlaceController,
                  decoration: const InputDecoration(
                    labelText: 'Working Place *',
                  ),
                  validator: (v) => v?.isNotEmpty == true ? null : 'Required',
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () {
                    // TODO: Implement update logic
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Saving... (Implementation Pending)"),
                        ),
                      );
                    }
                  },
                  child: const Text("Save Changes"),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }
}
