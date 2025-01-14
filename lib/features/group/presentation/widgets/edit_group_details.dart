import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_input_without_label.dart';
import 'package:flutter/material.dart';

class EditGroupDetails extends StatefulWidget {
  const EditGroupDetails({super.key});

  @override
  State<EditGroupDetails> createState() => _EditGroupDetailsState();
}

class _EditGroupDetailsState extends State<EditGroupDetails> {
  final List<String> menuItems = [
    "Edit Group Name",
    "Edit Group Location",
    "Delete Group",
    "Leave Group",
  ];

  String? selectedMenuItem = "";

  final TextEditingController groupNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              selectedMenuItem != "Edit Group Name"
                  ? const Text(
                      "Appstango Employees",
                      style: TextStyle(
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
                  ? const Text(
                      "Created by John Doe | City, State",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
        selectedMenuItem == ""
            ? PopupMenuButton(
                onSelected: (item) {
                  setState(() {
                    selectedMenuItem = item;
                  });
                },
                color: Colors.white,
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black38,
                  size: 25,
                ),
                itemBuilder: (context) => menuItems.map(
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
                ).toList(),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    selectedMenuItem = "";
                  });
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
  }
}
