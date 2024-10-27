import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: CachedNetworkImageProvider(
              'https://cdn.prod.website-files.com/62d84e447b4f9e7263d31e94/6557420216a456cfaef685c0_6399a4d27711a5ad2c9bf5cd_ben-sweet-2LowviVHZ-E-unsplash-1-p-1600.jpg',
            ),
          ),
        ),
      ],
    );
  }

  // Required for the PreferredSizeWidget interface
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
