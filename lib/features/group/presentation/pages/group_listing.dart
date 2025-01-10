import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/bloc/get_all_group/get_all_group_bloc.dart';
import 'package:clean_architecture_rivaan_ranawat/features/group/presentation/widgets/group_listing_card.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/models/group_model.dart';
import 'package:clean_architecture_rivaan_ranawat/utils/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GroupListing extends StatefulWidget {
  const GroupListing({super.key});

  @override
  State<GroupListing> createState() => _GroupListingState();
}

class _GroupListingState extends State<GroupListing> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int? page = 1;
  int? size = 10;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<GetAllGroupBloc>(context).add(
      GetAllGroups(
        params: GetAllGroupsParams(
          page: page!,
          size: size!,
        ),
      ),
    );
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Groups",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Colors.red[900],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Make a group and the app will find places that have food that the whole group will like.",
                  style: TextStyle(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<GetAllGroupBloc, GetAllGroupState>(
            builder: (context, state) {
              if (state is GetAllGroupLoading) {
                return Expanded(
                  child: SpinKitThreeInOut(
                    color: Colors.yellow[700],
                  ),
                );
              }

              if (state is GetAllGroupError) {
                return Expanded(
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              }

              if (state is GetAllGroupSuccess) {
                if (state.group.groups!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.group.groups!.length,
                      itemBuilder: (context, index) => GroupListingCard(
                        groupName: state.group.groups![index].groupName!,
                        creatorName:
                            "${state.group.groups![index].creator!.firstName!} ${state.group.groups![index].creator!.lastName!}",
                      ),
                    ),
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Text(
                          "You don’t currently have any groups. Tap the plus button above to get one started.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                }
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
