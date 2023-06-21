import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//
// class CircleListItem extends StatelessWidget {
//   const CircleListItem({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//       child: Container(
//         width: 54,
//         height: 54,
//         decoration: const BoxDecoration(
//           color: Colors.black,
//           shape: BoxShape.circle,
//         ),
//         child: ClipOval(
//           child: Image.network(
//             'https://flutter'
//                 '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg',
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
class CardListItem extends StatelessWidget {
  const CardListItem({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          const SizedBox(height: 16),
          _buildText(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://flutter'
                '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    if (isLoading) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 250,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      );
    } else {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
              'eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
      );
    }
  }
}


const shimmerGradientLight = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

const shimmerGradientDark = LinearGradient(
  colors: [
    Color(0xFF7C7C80),
    Color(0xFF706D6D),
    Color(0xFF4C4C4F),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

//
// class ShimmerLoading extends StatefulWidget {
//   const ShimmerLoading({
//     super.key,
//     required this.isLoading,
//     required this.child,
//   });
//
//   final bool isLoading;
//   final Widget child;
//
//   @override
//   State<ShimmerLoading> createState() => _ShimmerLoadingState();
// }
//
// class _ShimmerLoadingState extends State<ShimmerLoading> {
//   Listenable? _shimmerChanges;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_shimmerChanges != null) {
//       _shimmerChanges!.removeListener(_onShimmerChange);
//     }
//     _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
//     if (_shimmerChanges != null) {
//       _shimmerChanges!.addListener(_onShimmerChange);
//     }
//   }
//
//   @override
//   void dispose() {
//     _shimmerChanges?.removeListener(_onShimmerChange);
//     super.dispose();
//   }
//
//   void _onShimmerChange() {
//     if (widget.isLoading) {
//       setState(() {
//         // update the shimmer painting.
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!widget.isLoading) {
//       return widget.child;
//     }
//
//     return ShaderMask(
//       blendMode: BlendMode.srcATop,
//       shaderCallback: (bounds) {
//         return shimmerGradient.createShader(bounds);
//       },
//       child: widget.child,
//     );
//   }
// }
//
// class Shimmer extends StatefulWidget {
//   static ShimmerState? of(BuildContext context) {
//     return context.findAncestorStateOfType<ShimmerState>();
//   }
//
//   const Shimmer({
//     super.key,
//     required this.linearGradient,
//     this.child,
//   });
//
//   final LinearGradient linearGradient;
//   final Widget? child;
//
//   @override
//   ShimmerState createState() => ShimmerState();
// }
//
// class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin  {
//   late AnimationController _shimmerController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _shimmerController = AnimationController.unbounded(vsync: this)
//       ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
//   }
//
//   @override
//   void dispose() {
//     _shimmerController.dispose();
//     super.dispose();
//   }
//
//   Gradient get gradient => LinearGradient(
//     colors: widget.linearGradient.colors,
//     stops: widget.linearGradient.stops,
//     begin: widget.linearGradient.begin,
//     end: widget.linearGradient.end,
//     transform:
//     _SlidingGradientTransform(slidePercent: _shimmerController.value),
//
//   );
//
//   Listenable get shimmerChanges => _shimmerController;
//
//   bool get isSized => (context.findRenderObject() as RenderBox?)?.hasSize ?? false;
//
//   Size get size => (context.findRenderObject() as RenderBox).size;
//
//   Offset getDescendantOffset({
//     required RenderBox descendant,
//     Offset offset = Offset.zero,
//   }) {
//     final shimmerBox = context.findRenderObject() as RenderBox;
//     return descendant.localToGlobal(offset, ancestor: shimmerBox);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.child ?? const SizedBox();
//   }
// }
//
// class _SlidingGradientTransform extends GradientTransform {
//   const _SlidingGradientTransform({
//     required this.slidePercent,
//   });
//
//   final double slidePercent;
//
//   @override
//   Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
//     return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
//   }
// }


class ImageLoadingPlaceholder extends StatelessWidget {
  const ImageLoadingPlaceholder({
    super.key,
    required this.isLoading, this.height = 450.0, this.width = double.infinity,
  });

  final bool isLoading;
  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return  AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isDarkMode? Colors.grey.shade900: Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://flutter'
                '.dev/docs/cookbook/img-files/effects/split-check/Food1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


}

