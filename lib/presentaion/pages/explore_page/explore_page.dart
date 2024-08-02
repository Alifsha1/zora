import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/icons/customiconsflutter_icons.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/utils/debouncer.dart';
import 'package:zora/presentaion/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:zora/presentaion/pages/explore_page/widget/explore_grid.dart';
import 'package:zora/presentaion/pages/explore_page/widget/search_result_widget.dart';
import 'package:zora/presentaion/pages/post_add_page/widgets/post_custom_text_field.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String searchValue = '';
  bool searchbarValue = false;
  final Debouncer debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));
  final TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 228, 246, 246),
            centerTitle: true,
            title: PostCustomTexTField(
              onTap: () {
                context
                    .read<GetAllUsersBloc>()
                    .add(GetAllUsersInitialFetchEvent());
                setState(() {
                  searchbarValue = true;
                });
              },
              onFieldSubmitted: (value) {
                setState(() {
                  searchbarValue = false;
                });
              },
              onChanged: (value) {
                debouncer.run(() {
                  if (value.isNotEmpty) {
                    log('Here: $value');
                    context
                        .read<GetAllUsersBloc>()
                        .add(GetSearchUserInitialFetchEvent(value: value));
                  } else {
                    context
                        .read<GetAllUsersBloc>()
                        .add(GetAllUsersInitialFetchEvent());
                  }
                });
              },
              controller: searchcontroller,
              hint: 'search',
              prefix: const Icon(
                CupertinoIcons.search,
                color: kblack,
              ),
            ),
            expandedHeight: 70,
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child:
                    searchbarValue ? SearchResultWidget() : ExploreGridView()),
          ),
        ],
      ),
    );
  }
}
