import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookListPage(),
    );
  }
}

class Book {
   String title;
   String author;
   String description;
   String imageUrl;
   double rating;

  Book(
      {String title = '',
        String author = '',
        String description = '',
        String imageUrl = '',
        double rating = 0.0})
      : title = title,
        author = author,
        description = description,
        imageUrl = imageUrl,
        rating = rating;
}

class BookListPage extends StatelessWidget {
   List<Book> books = [
    Book(
      title: 'Гаррі Поттер і філософський камінь',
      author: 'Джоан Роулінг',
      description: 'Перша книга про Гаррі Поттера.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/uk/thumb/d/db/HPand_the_Chamber_of_Secrets_UKR.jpg/220px-HPand_the_Chamber_of_Secrets_UKR.jpg',
      rating: 4.9,
    ),
    Book(
      title: 'Гаррі Поттер і таємна кімната',
      author: 'Джоан Роулінг',
      description: 'Друга книга про Гаррі Поттера.',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/uk/thumb/6/6c/HPandPhStone_Ukr.jpg/220px-HPandPhStone_Ukr.jpg',
      rating: 4.8,
    ),
     Book(
       title: "Гаррі Поттер і в'язень Азкабану",
       author: 'Джоан Роулінг',
       description: 'Третя книга про Гаррі Поттера.',
       imageUrl: 'https://upload.wikimedia.org/wikipedia/uk/thumb/c/c8/HPand_the_Prisoner_of_Azkaban_UKR.jpg/220px-HPand_the_Prisoner_of_Azkaban_UKR.jpg',
       rating: 4.7,
     ),
     Book(
       title: 'Гаррі Поттер і келих вогню',
       author: 'Джоан Роулінг',
       description: 'Четверта книга про Гаррі Поттера.',
       imageUrl: 'https://upload.wikimedia.org/wikipedia/uk/thumb/a/a2/HPand_the_Goblet_of_Fire_UKR.jpg/220px-HPand_the_Goblet_of_Fire_UKR.jpg',
       rating: 4.6,
     ),
     Book(
       title: 'Гаррі Поттер і Орден Фенікса',
       author: 'Джоан Роулінг',
       description: "П'ята книга про Гаррі Поттера.",
       imageUrl: 'https://upload.wikimedia.org/wikipedia/uk/thumb/8/80/HPand_the_Order_of_the_Phoenix_UKR.jpg/220px-HPand_the_Order_of_the_Phoenix_UKR.jpg',
       rating: 4.5,
     ),
     Book(
       title: 'Гаррі Поттер і напівкровний Принц',
       author: 'Джоан Роулінг',
       description: "Шоста книга про Гаррі Поттера.",
       imageUrl: 'https://upload.wikimedia.org/wikipedia/uk/thumb/6/62/HPand_the_Half-Blood_Prince_UKR.jpg/220px-HPand_the_Half-Blood_Prince_UKR.jpg',
       rating: 4.6,
     ),
     Book(
       title: 'Гаррі Поттер і смертельні реліквії',
       author: 'Джоан Роулінг',
       description: "Сьома книга про Гаррі Поттера.",
       imageUrl: 'https://upload.wikimedia.org/wikipedia/uk/thumb/f/fd/HP_and_the_Deathly_Hallows_UKR.jpg/220px-HP_and_the_Deathly_Hallows_UKR.jpg',
       rating: 4.9,
     ),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Гаррі Поттер'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index].title),
            subtitle: Text(books[index].author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(book: books[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetailPage extends StatelessWidget {
  Book book;

  BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Автор: ${book.author}'),
            Text('Опис: ${book.description}'),
            Image.network(book.imageUrl),
            Text('Рейтинг: ${book.rating}'),
          ],
        ),
      ),
    );
  }
}
