import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/Image_controller/image_controller_bloc.dart';
import 'image_grid.dart';

class AdsGrid extends StatelessWidget {
  const AdsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => ImageBloc()..add(FetchPosterList()),
      child: BlocBuilder<ImageBloc, ImageControllerState>(
        builder: (context, state) {
          if (state is ImageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PosterImages) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<ImageBloc>().add(FetchPosterList());
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.01,
                ),
                child: state.images.isNotEmpty
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: state.images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ImageCard(
                            imageUrl: state.images[index],
                            onDelete: () {
                              context
                                  .read<ImageBloc>()
                                  .add(DeleteTurfImageEvent(index));
                            },
                          );
                        },
                      )
                    : const Center(child: Text("No Images Found")),
              ),
            );
          } else if (state is ImagesFetchError) {
            return Center(
                child: Text('Failed to fetch images: ${state.error}'));
          } else {
            return const Center(child: Text('No images available'));
          }
        },
      ),
    );
  }
}
