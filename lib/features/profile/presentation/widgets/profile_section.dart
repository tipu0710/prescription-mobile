import 'package:babosthapotro/core/utils/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../../theme/theme_extensions.dart';
import '../../../../presentation/widgets/toast_widget.dart';
import '../../../auth/presentation/providers/user_provider.dart';
import '../../../auth/data/models/user_profile.dart';
import '../../data/models/update_profile_request.dart';
import '../providers/profile_controller.dart';

class ProfileSection extends ConsumerStatefulWidget {
  const ProfileSection({super.key});

  @override
  ConsumerState<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends ConsumerState<ProfileSection> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _bmdcController;
  late TextEditingController _fullNameController;
  late TextEditingController _fullNameLocalController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _phoneNumberLocalController;
  late TextEditingController _designationController;
  late TextEditingController _designationLocalController;
  late TextEditingController _expertiseController;
  late TextEditingController _expertiseLocalController;
  late TextEditingController _workingPlaceController;
  late TextEditingController _workingPlaceLocalController;
  String? _gender;
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _bmdcController = TextEditingController();
    _fullNameController = TextEditingController();
    _fullNameLocalController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _phoneNumberLocalController = TextEditingController();
    _designationController = TextEditingController();
    _designationLocalController = TextEditingController();
    _expertiseController = TextEditingController();
    _expertiseLocalController = TextEditingController();
    _workingPlaceController = TextEditingController();
    _workingPlaceLocalController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _bmdcController.dispose();
    _fullNameController.dispose();
    _fullNameLocalController.dispose();
    _phoneNumberController.dispose();
    _phoneNumberLocalController.dispose();
    _designationController.dispose();
    _designationLocalController.dispose();
    _expertiseController.dispose();
    _expertiseLocalController.dispose();
    _workingPlaceController.dispose();
    _workingPlaceLocalController.dispose();
    super.dispose();
  }

  void _initializeControllers(UserProfile profile) {
    if (_emailController.text.isEmpty) _emailController.text = profile.email;
    if (_bmdcController.text.isEmpty) _bmdcController.text = profile.bmdcNumber;

    if (_fullNameController.text.isEmpty) {
      _fullNameController.text = profile.fullName ?? '';
    }
    if (_fullNameLocalController.text.isEmpty) {
      _fullNameLocalController.text = profile.fullNameLocal ?? '';
    }

    if (_phoneNumberController.text.isEmpty) {
      _phoneNumberController.text = profile.phoneNumber ?? '';
    }
    if (_phoneNumberLocalController.text.isEmpty) {
      _phoneNumberLocalController.text = profile.phoneNumberLocal ?? '';
    }

    if (_designationController.text.isEmpty) {
      _designationController.text = profile.designation ?? '';
    }
    if (_designationLocalController.text.isEmpty) {
      _designationLocalController.text = profile.designationLocal ?? '';
    }

    if (_expertiseController.text.isEmpty) {
      _expertiseController.text = profile.expertise ?? '';
    }
    if (_expertiseLocalController.text.isEmpty) {
      _expertiseLocalController.text = profile.expertiseLocal ?? '';
    }

    if (_workingPlaceController.text.isEmpty) {
      _workingPlaceController.text = profile.workingPlace ?? '';
    }
    if (_workingPlaceLocalController.text.isEmpty) {
      _workingPlaceLocalController.text = profile.workingPlaceLocal ?? '';

      if (_gender == null && profile.gender != null) {
        final genderStr = profile.gender.toString();
        if (['MALE', 'FEMALE', 'OTHER'].contains(genderStr)) {
          _gender = genderStr;
        }
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      final data = UpdateProfileRequest(
        fullName: _fullNameController.text,
        fullNameLocal: _fullNameLocalController.text,
        phoneNumber: _phoneNumberController.text,
        phoneNumberLocal: _phoneNumberLocalController.text,
        designation: _designationController.text,
        designationLocal: _designationLocalController.text,
        expertise: _expertiseController.text,
        expertiseLocal: _expertiseLocalController.text,
        workingPlace: _workingPlaceController.text,
        workingPlaceLocal: _workingPlaceLocalController.text,
        gender: _gender,
      );

      await ref
          .read(profileControllerProvider.notifier)
          .updateProfile(data, profilePicture: _pickedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userProvider);
    final profileState = ref.watch(profileControllerProvider);
    final colors = context.appColor;

    ref.listen(profileControllerProvider, (previous, next) {
      if (next.hasError) {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(16),
            child: ToastWidget(
              message: next.error.toString(),
              type: ToastType.error,
              onClose: () => Navigator.of(context).pop(),
            ),
          ),
        );
      } else if (!next.isLoading &&
          !next.hasError &&
          previous?.isLoading == true) {
        ToastService.showSuccess(
          context,
          message: 'Profile Updated Successfully',
        );
      }
    });

    return userAsync.when(
      data: (profile) {
        _initializeControllers(profile);
        final profileImage = _pickedImage != null
            ? FileImage(_pickedImage!)
            : (profile.profilePicture != null
                      ? NetworkImage(profile.profilePicture!)
                      : null)
                  as ImageProvider?;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: colors.muted,
                        backgroundImage: profileImage,
                        child: profileImage == null
                            ? Icon(
                                Icons.person,
                                size: 50,
                                color: colors.mutedForeground,
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colors.surface,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: colors.onPrimary,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(24),

                // 1. Email (Unmodifiable)
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  enabled: false,
                ),
                const Gap(16),

                // 2. BM&DC Number (Unmodifiable)
                TextFormField(
                  controller: _bmdcController,
                  decoration: const InputDecoration(
                    labelText: 'BM&DC Number',
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  enabled: false,
                ),
                const Gap(16),

                // 3. Full Name
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => v?.isNotEmpty == true ? null : 'Required',
                ),
                const Gap(16),

                // 4. Full Name (Local)
                TextFormField(
                  controller: _fullNameLocalController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name (Local)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Gap(16),

                // 5. Phone Number
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => v?.isNotEmpty == true ? null : 'Required',
                ),
                const Gap(16),

                // 6. Phone Number (Local)
                TextFormField(
                  controller: _phoneNumberLocalController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number (Local)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Gap(16),

                // 7. Gender
                DropdownButtonFormField<String>(
                  initialValue: _gender,
                  decoration: const InputDecoration(
                    labelText: 'Gender *',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'MALE', child: Text('Male')),
                    DropdownMenuItem(value: 'FEMALE', child: Text('Female')),
                    DropdownMenuItem(value: 'OTHER', child: Text('Other')),
                  ],
                  onChanged: (v) => setState(() => _gender = v),
                  validator: (v) => v != null ? null : 'Required',
                ),
                const Gap(16),

                // 8. Designation
                TextFormField(
                  controller: _designationController,
                  decoration: const InputDecoration(
                    labelText: 'Designation *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => v?.isNotEmpty == true ? null : 'Required',
                ),
                const Gap(16),

                // 9. Designation (Local)
                TextFormField(
                  controller: _designationLocalController,
                  decoration: const InputDecoration(
                    labelText: 'Designation (Local)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Gap(16),

                // 10. Expertise
                TextFormField(
                  controller: _expertiseController,
                  decoration: const InputDecoration(
                    labelText: 'Expertise',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Gap(16),

                // 11. Expertise (Local)
                TextFormField(
                  controller: _expertiseLocalController,
                  decoration: const InputDecoration(
                    labelText: 'Expertise (Local)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Gap(16),

                // 12. Working Place
                TextFormField(
                  controller: _workingPlaceController,
                  decoration: const InputDecoration(
                    labelText: 'Working Place',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Gap(16),

                // 13. Working Place (Local)
                TextFormField(
                  controller: _workingPlaceLocalController,
                  decoration: const InputDecoration(
                    labelText: 'Working Place (Local)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const Gap(24),

                FilledButton(
                  onPressed: profileState.isLoading ? null : _saveProfile,
                  child: profileState.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text("Save Changes"),
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
