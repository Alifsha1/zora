import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zora/core/navigators/navigators.dart';
import 'package:zora/presentaion/bloc/get_all_post/get_all_post_bloc.dart';
import 'package:zora/presentaion/bloc/saved_posts/saved_posts_bloc.dart';
import 'package:zora/presentaion/pages/explore_page/loading/explore_loading.dart';
import 'package:zora/presentaion/pages/explore_page/widget/user_post_view.dart';

class ExploreGridView extends StatefulWidget {
  const ExploreGridView({super.key});

  @override
  State<ExploreGridView> createState() => _ExploreGridViewState();
}

class _ExploreGridViewState extends State<ExploreGridView> {
  @override
  void initState() {
    context.read<GetAllPostBloc>().add(GetAllPostInitialFetchEvent());
    context.read<SavedPostsBloc>().add(GetSavedPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediawidth = MediaQuery.of(context).size.width;
    final mediaheight = MediaQuery.of(context).size.height;
    // context.read<GetAllPostBloc>().add(GetAllPostInitialFetchEvent());
    // context.read<SavedPostsBloc>().add(GetSavedPostEvent());
    return BlocBuilder<GetAllPostBloc, GetAllPostState>(
        builder: (context, state) {
      if (state is GetAllPostLoadingState) {
        return const ExploreLoading();
      }
      if (state is GetAllPostSuccessState) {
        log(state.posts.length.toString());

        List<StaggeredGridTile> tiles =
            List.generate(state.posts.length, (index) {
          if (index % 8 == 0) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      UserPostViewWidget(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          currentindex: index),
                      context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.posts[index].mediaURL![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          } else if (index % 8 == 1) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      UserPostViewWidget(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          currentindex: index),
                      context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.posts[index].mediaURL![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          } else if (index % 8 == 2) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      UserPostViewWidget(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          currentindex: index),
                      context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.posts[index].mediaURL![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          } else if (index % 8 == 3) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      UserPostViewWidget(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          currentindex: index),
                      context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.posts[index].mediaURL![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          } else if (index % 8 == 4) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      UserPostViewWidget(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          currentindex: index),
                      context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.posts[index].mediaURL![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          } else if (index % 8 == 5) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      UserPostViewWidget(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          currentindex: index),
                      context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.posts[index].mediaURL![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          } else if (index % 8 == 6) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      UserPostViewWidget(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          currentindex: index),
                      context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.posts[index].mediaURL![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: GestureDetector(
                onTap: () {
                  navigatorPush(
                      UserPostViewWidget(
                          mediaheight: mediaheight,
                          mediawidth: mediawidth,
                          currentindex: index),
                      context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.posts[index].mediaURL![0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }
        });

        return StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: tiles,
        );
      } else {
        return const ExploreLoading();
      }
    });
  }
}
