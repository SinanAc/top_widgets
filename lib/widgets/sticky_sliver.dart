import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ...List<int>.generate(2, (index) => index).map(
            (e) => SliverToBoxAdapter(
              child: Container(
                height: 250,
                color: Colors.red,
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ),
          StickySliver(
            child: Container(
              height: 150,
              color: Colors.purple,
            ),
          ),
          ...List<int>.generate(5, (index) => index).map(
            (e) => SliverToBoxAdapter(
              child: Container(
                height: 250,
                color: Colors.green,
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StickySliver extends SingleChildRenderObjectWidget {
  const StickySliver({Widget? child, Key? key}) : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStickySliver();
  }
}

class RenderStickySliver extends RenderSliverSingleBoxAdapter {
  RenderStickySliver({RenderBox? child}) : super(child: child);

  @override
  void performLayout() {
    child?.layout(
      constraints.asBoxConstraints(),
      parentUsesSize: true,
    );

    double childExtent = child?.size.height ?? 0;

    geometry = SliverGeometry(
      paintExtent: childExtent,
      maxPaintExtent: childExtent,
      paintOrigin: constraints.scrollOffset,
    );

    setChildParentData(child!, constraints, geometry!);
  }
}
