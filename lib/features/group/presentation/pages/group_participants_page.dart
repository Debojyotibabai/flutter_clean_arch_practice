import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/edit_group_details.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/participant_card.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/button/app_primary_solid_button.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/input/app_input_without_label.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupParticipantsPage extends StatefulWidget {
  const GroupParticipantsPage({
    super.key,
    required this.groupId,
  });

  final String groupId;

  @override
  State<GroupParticipantsPage> createState() => _GroupParticipantsPageState();
}

class _GroupParticipantsPageState extends State<GroupParticipantsPage> {
  TextEditingController controller = TextEditingController();

  bool isInviteSectionVisible = false;

  @override
  void initState() {
    super.initState();
    controller.text = "https://www.google.com";
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 29,
            color: Colors.white,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditGroupDetails(
              groupId: widget.groupId,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Participants",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ParticipantCard();
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isInviteSectionVisible
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AppInputWithoutLabel(
                                    label: "",
                                    controller: controller,
                                    hintText: "Link",
                                    isEnabled: false,
                                  ),
                                ),
                                AppPrimarySoidButton(
                                  onPressed: () {},
                                  buttonText: "Invite",
                                  width: 0.25,
                                  backgroundColor: Colors.red[900]!,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      : Container(),
                  AppPrimarySoidButton(
                    onPressed: () {
                      setState(() {
                        isInviteSectionVisible = !isInviteSectionVisible;
                      });
                    },
                    buttonText: "Invite Friends",
                    width: 0.65,
                    backgroundColor: Colors.yellow[700]!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
