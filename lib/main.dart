import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
// #enddocregion build
}
// #enddocregion MyApp

// #docregion RWS-var
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = TextStyle(fontSize: 18.0);
  // #enddocregion RWS-var

  // #docregion _buildSuggestions
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  // #enddocregion _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('El_Funkys Solicitud'),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
 void _pushSaved(){
    Navigator.of(context).push(
      //add Lines from here...
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
              (WordPair pair) {
                return ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles:tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Funkys Favorito'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
 }
// #enddocregion RWS-build
// #docregion RWS-var
}
// #enddocregion RWS-var

class RandomWords extends StatefulWidget {
  @override
  State<RandomWords> createState() => _RandomWordsState();
}
















// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';
//
// void main() => runApp(MyApp());
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final wordPair = WordPair.random(); // Add this line.
// //     return MaterialApp(
// //       title: 'Welcome to Flutter',
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Welcome to funkys Flutter'),
// //         ),
// //         body: Center(
// //           //child: Text('Hello World'),   // Replace this text...
// //           child: Text(wordPair.asPascalCase), // With this text.
// //         ),
// //       ),
// //     );
// //   }
// // }
// class RandomWords extends StatefulWidget {
//   @override
//   _RandomWordsState createState() => _RandomWordsState();
// }
//
//
// class _RandomWordsState extends State<RandomWords>  {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();      // NEW
//     return Text(wordPair.asPascalCase);      // NEW
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();  // DELETE
//
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to  funkys Flutter'),
//         ),
//         body: Center(
//           //child: Text(wordPair.asPascalCase), // REPLACE with...
//           child: RandomWords(),                 // ...this line
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // class MyApp extends StatelessWidget {
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Hello World Demo Application',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: MyHomePage(title: 'Welcome TO Funky_s Page'),
// //     );
// //   }
// // }
// //
// //
// //
// // // class MyHomePage extends StatelessWidget {
// // //   MyHomePage({Key key, this.title}) : super(key: key);
// // //   final String title;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(this.title),
// // //       ),
// // //       body: Center(
// // //           child:
// // //           Text(
// // //             '#Bcom coder',
// // //           )
// // //       ),
// // //     );
// // //   }
// // // }
// // // class MyHomePge extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Welcome to Flutter',
// // //       home: Scaffold(
// // //         home: RandomWords(),
// // //         appBar: AppBar(
// // //           title: Text('Welcome to Flutter'),
// // //         ),
// // //         body: Center(
// // //           child: RandomWords(),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }