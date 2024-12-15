import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/presentation/widgets/avatar_selection.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/button/app_primary_solid_button.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/custom_drawer.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_input_with_label.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email address is required';
    } else if (!Constants.emailAddress.hasMatch(value)) {
      return 'enter a valid email address';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone number is required';
    } else if (!Constants.phoneNumber.hasMatch(value)) {
      return 'enter a valid phone number';
    }
    return null;
  }

  void editProfile() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 35,
            color: Colors.white,
          ),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20).copyWith(bottom: 60),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Edit Your Account",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AvatarSelection(),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: AppInputWithLabel(
                      controller: firstNameController,
                      hintText: "First Name",
                      label: "First Name",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppInputWithLabel(
                      controller: lastNameController,
                      hintText: "Last Name",
                      label: "Last Name",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AppInputWithLabel(
                controller: emailController,
                hintText: "example@email.com",
                label: "Email Address",
                validator: _validateEmail,
              ),
              const SizedBox(height: 20),
              AppInputWithLabel(
                controller: phoneNumberController,
                hintText: "Phone Number",
                label: "Phone Number",
                validator: _validatePhoneNumber,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: AppPrimarySoidButton(
                      onPressed: () {},
                      buttonText: "Cancel",
                      width: 0.5,
                      backgroundColor: Colors.white,
                      textColor: Colors.red[900]!,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: AppPrimarySoidButton(
                      onPressed: () {
                        editProfile();
                      },
                      buttonText: "Done",
                      width: 0.4,
                      backgroundColor: Colors.yellow[800]!,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
