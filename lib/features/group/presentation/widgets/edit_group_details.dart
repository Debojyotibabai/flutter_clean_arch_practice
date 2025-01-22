import 'package:clean_architecture_rivaan_ranawat/features/edit_profile/presentation/bloc/edit_profile_data/edit_profile_data_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/delete_group/delete_group_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_group_details/get_group_details_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/update_group_details/update_group_details_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/dialog/confirmation_dialog.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_input_without_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class EditGroupDetails extends StatefulWidget {
  const EditGroupDetails({
    super.key,
    required this.groupId,
    required this.getGroupRecommendations,
  });

  final String groupId;
  final void Function() getGroupRecommendations;

  @override
  State<EditGroupDetails> createState() => _EditGroupDetailsState();
}

class _EditGroupDetailsState extends State<EditGroupDetails> {
  final List<String> menuItemsForGroupOwner = [
    "Edit Group Name",
    "Edit Group Location",
    "Delete Group",
  ];

  final List<String> menuItemsForGroupJoiner = [
    "Leave Group",
  ];

  String? selectedMenuItem = "";

  final TextEditingController groupNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  void getGroupDetails() {
    BlocProvider.of<GetGroupDetailsBloc>(context)
        .add(GetGroupDetails(groupId: widget.groupId));
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<EditProfileDataBloc>(context)
        .add(GetEditProfileDataEvent());

    getGroupDetails();
  }

  void editGroupDetails() {
    if (groupNameController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        stateController.text.isNotEmpty) {
      BlocProvider.of<UpdateGroupDetailsBloc>(context).add(
        UpdateGroupDetails(
          params: UpdateGroupDetailsParams(
            groupId: widget.groupId,
            groupName: groupNameController.text,
            city: cityController.text,
            state: stateController.text,
          ),
        ),
      );
    }
  }

  void onDeleteGroup(String groupId) {
    BlocProvider.of<DeleteGroupBloc>(context).add(
      DeleteGroup(
        groupId: groupId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGroupDetailsBloc, GetGroupDetailsState>(
      builder: (context, getGroupDetailsState) {
        if (getGroupDetailsState is GetGroupDetailsLoading) {
          return SpinKitThreeInOut(
            color: Colors.yellow[700],
          );
        } else if (getGroupDetailsState is GetGroupDetailsSuccess) {
          return BlocConsumer<UpdateGroupDetailsBloc, UpdateGroupDetailsState>(
            listener: (context, updateGroupDetailsState) {
              if (updateGroupDetailsState is UpdateGroupDetailsFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      updateGroupDetailsState.message,
                    ),
                  ),
                );
              } else if (updateGroupDetailsState is UpdateGroupDetailsSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      updateGroupDetailsState.message,
                    ),
                  ),
                );

                setState(() {
                  selectedMenuItem = "";
                  groupNameController.clear();
                  cityController.clear();
                  stateController.clear();
                });

                getGroupDetails();
                widget.getGroupRecommendations();
              }
            },
            builder: (context, updateGroupDetailsState) {
              return BlocBuilder<EditProfileDataBloc, EditProfileDataState>(
                builder: (context, editProfileDataState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            selectedMenuItem != "Edit Group Name"
                                ? Text(
                                    getGroupDetailsState
                                        .groupDetails.groupName!,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : AppInputWithoutLabel(
                                    label: "Group name",
                                    controller: groupNameController,
                                    hintText: "Group name",
                                  ),
                            const SizedBox(height: 5),
                            selectedMenuItem != "Edit Group Location"
                                ? Text(
                                    "Created by ${getGroupDetailsState.groupDetails.creator!.firstName} ${getGroupDetailsState.groupDetails.creator!.lastName} | ${getGroupDetailsState.groupDetails.city}, ${getGroupDetailsState.groupDetails.state}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Created by John Doe",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: AppInputWithoutLabel(
                                              label: "City",
                                              controller: cityController,
                                              hintText: "City",
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: AppInputWithoutLabel(
                                              label: "State",
                                              controller: stateController,
                                              hintText: "State",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      updateGroupDetailsState is UpdateGroupDetailsLoading
                          ? SpinKitThreeInOut(
                              color: Colors.yellow[700],
                              size: 30,
                            )
                          : selectedMenuItem == ""
                              ? PopupMenuButton(
                                  onSelected: (item) {
                                    if (item == "Edit Group Name" ||
                                        item == "Edit Group Location") {
                                      setState(() {
                                        selectedMenuItem = item;
                                        groupNameController.text =
                                            getGroupDetailsState
                                                .groupDetails.groupName!;
                                        cityController.text =
                                            getGroupDetailsState
                                                .groupDetails.city!;
                                        stateController.text =
                                            getGroupDetailsState
                                                .groupDetails.state!;
                                      });
                                    } else if (item == "Delete Group") {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            BlocConsumer<DeleteGroupBloc,
                                                DeleteGroupState>(
                                          listener:
                                              (context, deleteGroupState) {
                                            if (deleteGroupState
                                                is DeleteGroupError) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    deleteGroupState.message,
                                                  ),
                                                ),
                                              );
                                            } else if (deleteGroupState
                                                is DeleteGroupSuccess) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    deleteGroupState.message,
                                                  ),
                                                ),
                                              );

                                              int count = 0;
                                              Navigator.of(context).popUntil(
                                                  (_) => count++ >= 2);
                                            }
                                          },
                                          builder: (context, deleteGroupState) {
                                            return ConfirmationDialog(
                                              title: "Delete Group",
                                              subTitle:
                                                  "Are you sure you want to delete this group? This process is irreversible.",
                                              confirmButtonText: "Delete Group",
                                              onConfirm: () {
                                                onDeleteGroup(
                                                    getGroupDetailsState
                                                        .groupDetails.groupId!);
                                              },
                                              disableConfirmationButton:
                                                  deleteGroupState
                                                      is DeleteGroupLoading,
                                            );
                                          },
                                        ),
                                      );
                                    } else if (item == "Leave Group") {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            const ConfirmationDialog(
                                          title:
                                              "Are you sure you want leave this group?",
                                          subTitle:
                                              "Are you sure you want to leave this group? You will have to have the link if you want to rejoin later.",
                                          confirmButtonText: "Leave Group",
                                        ),
                                      );
                                    }
                                  },
                                  color: Colors.white,
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: Colors.black38,
                                    size: 25,
                                  ),
                                  itemBuilder: (context) {
                                    List<String> menuItems =
                                        editProfileDataState
                                                is EditProfileDataSuccess
                                            ? editProfileDataState
                                                        .editProfileData
                                                        .user!
                                                        .userId ==
                                                    getGroupDetailsState
                                                        .groupDetails
                                                        .creator!
                                                        .creatorId
                                                ? menuItemsForGroupOwner
                                                : menuItemsForGroupJoiner
                                            : [];

                                    return menuItems.map(
                                      (item) {
                                        return PopupMenuItem(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        );
                                      },
                                    ).toList();
                                  },
                                )
                              : IconButton(
                                  onPressed: () {
                                    editGroupDetails();
                                  },
                                  icon: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.yellow[700],
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                    ],
                  );
                },
              );
            },
          );
        }

        return Container();
      },
    );
  }
}
