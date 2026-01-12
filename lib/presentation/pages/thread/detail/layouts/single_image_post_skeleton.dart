import 'package:flutter/material.dart';

class SingleImagePostSkeleton extends StatefulWidget {
  const SingleImagePostSkeleton({super.key});

  @override
  State<SingleImagePostSkeleton> createState() => _SingleImagePostSkeletonState();
}

class _SingleImagePostSkeletonState extends State<SingleImagePostSkeleton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 0.8).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            final color = Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: _animation.value);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(width: 40, height: 40, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
                    const SizedBox(width: 8),
                    Container(width: 100, height: 16, color: color),
                  ],
                ),
                const SizedBox(height: 8),
                // Body
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: double.infinity, height: 16, color: color),
                          const SizedBox(height: 4),
                          Container(width: double.infinity, height: 16, color: color),
                          const SizedBox(height: 4),
                          Container(width: 150, height: 16, color: color),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Footer
                Row(
                  children: [
                    Container(width: 24, height: 24, color: color),
                    const SizedBox(width: 4),
                    Container(width: 40, height: 16, color: color),
                    const SizedBox(width: 16),
                    Container(width: 24, height: 24, color: color),
                    const SizedBox(width: 4),
                    Container(width: 40, height: 16, color: color),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
