import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  final String photo;

  const Photo({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 180, minHeight: 180),
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Row(
        children: [
          Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    'https://picsum.photos/seed/179/600',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.clear_outlined, size: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
