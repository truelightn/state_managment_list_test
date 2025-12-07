import 'package:flutter/material.dart';
import 'post_list_screen.dart';
import 'post_list_annotation_screen.dart';
import 'post_list_hooks_screen.dart';
import 'post_list_getx_screen.dart';
import 'post_list_bloc_screen.dart';
import 'post_list_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
              context,
              'Riverpod Notifier',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostListScreen(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildButton(
              context,
              'Riverpod Annotation',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostListAnnotationScreen(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildButton(
              context,
              'Riverpod Annotation + Hooks',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostListHooksScreen(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildButton(
              context,
              'GetX',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostListGetxScreen(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildButton(
              context,
              'Bloc',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostListBlocScreen(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildButton(
              context,
              'Provider',
              () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostListProviderScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

