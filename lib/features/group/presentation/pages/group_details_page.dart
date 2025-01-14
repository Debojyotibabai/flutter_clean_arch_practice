import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/edit_group_details.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/view_participants_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GroupDetailsPage extends StatelessWidget {
  const GroupDetailsPage({super.key});

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
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            EditGroupDetails(),
            SizedBox(height: 30),
            ViewParticipantsCard(),
          ],
        ),
      ),
    );
  }
}
