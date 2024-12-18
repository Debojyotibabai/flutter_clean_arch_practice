import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/presentation/bloc/edit_profile/edit_profile_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/presentation/widgets/avatar_selection.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/constants.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/button/app_primary_solid_button.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/custom_drawer.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_input_with_label.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_phone_input_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? avatar;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneCountryCodeController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      avatar = image?.path;
    });

    Navigator.pop(context);
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email address is required';
    } else if (!Constants.regExp["emailAddress"]!.hasMatch(value)) {
      return 'enter a valid email address';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone number is required';
    } else if (!Constants.regExp["phoneNumber"]!.hasMatch(value)) {
      return 'enter a valid phone number';
    }
    return null;
  }

  void editProfile() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  void initState() {
    BlocProvider.of<EditProfileBloc>(context).add(
      GetEditProfileDataEvent(),
    );

    super.initState();
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
        child: BlocConsumer<EditProfileBloc, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileSuccess) {
              avatar = state.editProfileData.user!.profileImageUrl;
              firstNameController.text = state.editProfileData.user!.firstName!;
              lastNameController.text = state.editProfileData.user!.lastName!;
              emailController.text = state.editProfileData.user!.emailAddress!;
              phoneNumberController.text =
                  state.editProfileData.user!.phoneNumber ?? "";
            }
          },
          builder: (context, state) {
            if (state is EditProfileIsLoading) {
              return Center(
                child: SpinKitThreeInOut(
                  color: Colors.yellow[700],
                ),
              );
            }

            if (state is EditProfileSuccess) {
              return Form(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AvatarSelection(
                          avatarImage: avatar ??
                              state.editProfileData.user!.profileImageUrl,
                          getImageFromGallery: getImageFromGallery,
                        ),
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
                      label: "Contact Info",
                      validator: _validateEmail,
                      isEnabled: false,
                    ),
                    const SizedBox(height: 20),
                    AppPhoneInputWithLabel(
                      label: "Phone Number",
                      hintText: "Phone Number",
                      validator: _validatePhoneNumber,
                      phoneCountryCodeController: phoneCountryCodeController,
                      phoneNumberController: phoneNumberController,
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
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
