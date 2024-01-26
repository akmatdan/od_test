import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:od_photo/features/components/animation/animation.dart';
import 'package:od_photo/features/home/controllers/new_image_ui_controller.dart';
import 'package:od_photo/features/home/models/photos_model.dart';
import 'package:od_photo/utils/constants/sizes.dart';

class HomePage extends StatelessWidget {
  final ImageUIController imageUIController = Get.put(ImageUIController());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.imageThumbSize),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Discover",
                  style: Theme.of(context).textTheme.headlineLarge),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'What’s new today'.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),

            // Horizontal Set of Images
            HorizontalImageSet(imageList: imageUIController.latestPhotos),
            const SizedBox(height: TSizes.defaultSpace),

            // Title
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Browse all'.toUpperCase(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),

            // Vertical Set of Images
            VerticalImageSet(imageList: imageUIController.popularPhotos),
          ],
        ),
      ),
    );
  }
}

class HorizontalImageSet extends StatelessWidget {
  final RxList<PhotosModel> imageList;

  const HorizontalImageSet({Key? key, required this.imageList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 345,
      child: Obx(
        () => imageList.isEmpty
            ? Center(child: customLoading())
            : ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: SizedBox(
                      width: 345,
                      height: 345,
                      child: ImageDisplayWidget(
                        imageUrl: imageList[index].urls!['small'],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class VerticalImageSet extends StatelessWidget {
  final RxList<PhotosModel> imageList;

  const VerticalImageSet({Key? key, required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => imageList.isEmpty
          ? Center(child: customLoading())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.custom(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 8,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    const QuiltedGridTile(2, 1),
                    const QuiltedGridTile(1, 1),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: imageList.length,
                  (context, index) {
                    return ImageDisplayWidget(
                        imageUrl: imageList[index].urls!['small']);
                  },
                ),
              ),
            ),
    );
  }
}

class ImageDisplayWidget extends StatelessWidget {
  final String imageUrl;

  const ImageDisplayWidget({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (ctx, img) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: img,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        placeholder: (context, url) => Center(child: customLoading()),
        errorWidget: (context, url, error) => Center(child: errorIcon()),
      ),
    );
  }
}
