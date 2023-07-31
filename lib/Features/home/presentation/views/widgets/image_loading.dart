import 'package:bookly_with_clean_arch/core/widgets/custom_fading.dart';
import 'package:flutter/material.dart';

class FeatchedImageLoading extends StatelessWidget {
  const FeatchedImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomFadingWidget(
                child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
