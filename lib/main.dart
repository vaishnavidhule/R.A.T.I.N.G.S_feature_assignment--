import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Gallery with Ratings',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ImageGalleryScreen(),
    );
  }
}

class ImageGalleryScreen extends StatefulWidget {
  const ImageGalleryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImageGalleryScreenState createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  // List of images and ratings
  final List<Map<String, dynamic>> images = [
    {'url': 'data:image/jpeg;base64,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', 'rating': 0.0},
    {'url': 'https://static.vecteezy.com/system/resources/previews/024/669/489/non_2x/mountain-countryside-landscape-at-sunset-dramatic-sky-over-a-distant-valley-green-fields-and-trees-on-hill-beautiful-natural-landscapes-of-the-carpathians-generative-ai-variation-5-photo.jpeg', 'rating': 0.0},
    {'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDo890dsxpB5UCLQFdVBWmK4qVxTrsrLEEUg&s', 'rating': 0.0},
    {'url': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNgRezLFB9BzDht2sgUpL9p-pwBi8W0m3Mag&s', 'rating': 0.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery with Ratings'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImageGallery(
                    images: images,
                    initialIndex: index,
                    onRatingUpdate: (rating) {
                      setState(() {
                        images[index]['rating'] = rating;
                      });
                    },
                  ),
                ),
              );
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.network(
                  image['url'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 5),
                      Text(
                        image['rating'].toStringAsFixed(1),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FullScreenImageGallery extends StatefulWidget {
  final List<Map<String, dynamic>> images;
  final int initialIndex;
  final Function(double) onRatingUpdate;

  const FullScreenImageGallery({super.key, 
    required this.images,
    required this.initialIndex,
    required this.onRatingUpdate,
  });

  @override
  _FullScreenImageGalleryState createState() => _FullScreenImageGalleryState();
}

class _FullScreenImageGalleryState extends State<FullScreenImageGallery> {
  late PageController _pageController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Image'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PhotoViewGallery.builder(
              pageController: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget.images[index]['url']),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                );
              },
              scrollPhysics: const BouncingScrollPhysics(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text(
                  'Rate this Image',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                RatingBar.builder(
                  initialRating: widget.images[currentIndex]['rating'],
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      widget.images[currentIndex]['rating'] = rating;
                    });
                    widget.onRatingUpdate(rating);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
