import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zora/core/style/colors/colors.dart';
import 'package:zora/core/style/shimmer_gradient/shimmer_gradient.dart';

class ExploreLoading extends StatefulWidget {
  const ExploreLoading({super.key});

  @override
  State<ExploreLoading> createState() => _ExploreLoadingState();
}

class _ExploreLoadingState extends State<ExploreLoading> {
  @override
  Widget build(BuildContext context) {
      List<StaggeredGridTile> tiles =
            List.generate(30, (index) {
          if (index % 8 == 0) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                    color: kgreyshimmer,
                  ),
                ),
              ),
            );
          } else if (index % 8 == 1) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Shimmer(
               gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                   color: kgreyshimmer,
                  ),
                ),
              ),
            );
          } else if (index % 8 == 2) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Shimmer(
               gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                  color: kgreyshimmer,
                  ),
                ),
              ),
            );
          } else if (index % 8 == 3) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Shimmer(
               gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                  color: kgreyshimmer,
                  ),
                ),
              ),
            );
          } else if (index % 8 == 4) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Shimmer(
                gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                  color: kgreyshimmer,
                  ),
                ),
              ),
            );
          } else if (index % 8 == 5) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Shimmer(
              gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                    color: kgreyshimmer,
                  ),
                ),
              ),
            );
          } else if (index % 8 == 6) {
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Shimmer(
             gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                  color: kgreyshimmer,
                  ),
                ),
              ),
            );
          } else {
            return StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Shimmer(
            gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                   color: kgreyshimmer
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
  }
}