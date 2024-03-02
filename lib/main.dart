import 'package:flutter/material.dart';
import 'models/student.dart' show Student;
import 'pages/student_details_page.dart' show StudentDetailsPage;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Student List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Student> students;

  @override
  void initState() {
    super.initState();
    // Ініціалізуємо список студентів, куди додаємо себе для виводу відповідно до завдання
    students = [
      Student('Viacheslav', 'Moskalenko', DateTime(2002, 12, 23), 'xomkaxomiakovuch@gmail.com', 'St. Ronald Reagan, 8'),
      Student('Pablo', 'Naomi', DateTime(2004, 3, 7), 'pablonaomi@gmail.com', 'St. Chervona Kalyna, 8'),
      Student('Anastasia', 'Levenko', DateTime(2003, 10, 17), 'anastasialevenko@gmail.com', null),
    ];
    students[0].setGrade('Practice 0', 6);
    students[0].setGrade('Practice 1', 4);
    students[0].setGrade('Practice 2', 8);
    students[0].setGrade('Practice 3', 2);
    students[1].setGrade('Practice 0', 6);
    students[1].setGrade('Practice 1', 9);
    students[2].setGrade('Practice 0', 10);
    students[2].setGrade('Practice 1', 9);
    students[2].setGrade('Practice 2', 9);
    students[2].setGrade('Practice 3', 10);
  }

  void _showStudentDetails(Student student) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudentDetailsPage(student: student)),
    );
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${students[index].name} ${students[index].surname}'),
            onTap: () => _showStudentDetails(students[index]),
          );
        },
      ),
    );
  }

}



