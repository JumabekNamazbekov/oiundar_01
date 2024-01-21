import 'package:flutter/material.dart';

void main() {
  runApp(const PuzzleGameApp());
}

class PuzzleGameApp extends StatelessWidget {
  const PuzzleGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'oinoiber',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PuzzleGamePage(),
    );
  }
}

class PuzzleGamePage extends StatefulWidget {
  const PuzzleGamePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PuzzleGamePageState createState() => _PuzzleGamePageState();
}

class _PuzzleGamePageState extends State<PuzzleGamePage> {
  List<GlobalKey<PuzzlePieceState>> _pieceKeys = [];

  @override
  void initState() {
    super.initState();
    _initializePieces();
  }

  void _initializePieces() {
    _pieceKeys = List.generate(9, (index) => GlobalKey<PuzzlePieceState>());
  }

  List<Widget> _buildPuzzlePieces() {
    List<Widget> pieces = [];
    for (var i = 0; i < 9; i++) {
      pieces.add(
        PuzzlePiece(
          key: _pieceKeys[i],
          order: i,
          totalPieces: 9,
          image: const AssetImage('assets/kurmanjan.jpg'),
          onPieceTapped: _onPieceTapped,
        ),
      );
    }
    return pieces;
  }

  void _onPieceTapped(int order) {
    // Implement logic to handle piece taps and check for puzzle completion
    // Example: swap pieces if adjacent and check for puzzle completion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('oinoiber'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: _buildPuzzlePieces(),
      ),
    );
  }
}

class PuzzlePiece extends StatefulWidget {
  final int order;
  final int totalPieces;
  final ImageProvider image;
  final Function(int) onPieceTapped;

  const PuzzlePiece({Key ?key, required this.order, required this.totalPieces, required this.image, required this.onPieceTapped}): super(key: key)
    ;

  @override
  PuzzlePieceState createState() => PuzzlePieceState();
}

class PuzzlePieceState extends State<PuzzlePiece> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPieceTapped(widget.order);
      },
      child: Image(image: widget.image),
    );
  }
}