import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/remove_participant_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ParticipantCard extends StatelessWidget {
  const ParticipantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const RemoveParticipantDialog();
                },
              );
            },
            backgroundColor: Colors.red[800]!,
            icon: null,
            label: 'Remove',
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!,
              width: 2,
            ),
          ),
        ),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: const Text(
                "John Smith",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
