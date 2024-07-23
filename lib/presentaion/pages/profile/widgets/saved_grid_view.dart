import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/data/models/user_model/user_model.dart';
import 'package:zora/presentaion/bloc/saved_posts/saved_posts_bloc.dart';
import 'package:zora/presentaion/pages/profile/widgets/loading_pages/post_grid_loading.dart';
import 'package:zora/presentaion/pages/user_saved_postimage/user_saved_postimage.dart';

class SavedGridView extends StatefulWidget {
  final UserModel? userModel;
  const SavedGridView({super.key, required this.userModel});

  @override
  State<SavedGridView> createState() => _SavedGridViewState();
}

class _SavedGridViewState extends State<SavedGridView> {
  @override
  void initState() {
    context.read<SavedPostsBloc>().add(GetSavedPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<SavedPostsBloc>().add(GetSavedPostEvent());
    return BlocBuilder<SavedPostsBloc, SavedPostsState>(
        builder: (context, state) {
      if (state is GetSavedPostLoadingState) {
       
      }
      if (state is GetSavedPostSuccessState) {
        log('working');
        return SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: state.savedposts.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  navigatorPush(
                      UserSavedPostimage(
                          userModel: widget.userModel!,
                          index: index,
                          title: 'saved post',
                          savedpostmodel: state.savedposts),
                      context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            NetworkImage(state.savedposts[index]!.mediaURL![0]),
                        fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        );
      }
      if (state is GetSavedPostErrorState) {
        return Center(
          child: Text('error posts'),
        );
      }
      return const PostGridLoading();
      
    });
  }
}
