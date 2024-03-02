import 'dart:core';

class Student {
  String name;
  String surname;
  DateTime dateOfBirth;
  Map<String, double> _grades = {};
  String _email;
  String? _address;

  Student(this.name, this.surname, this.dateOfBirth, this._email, this._address){
     // Перевірка чи не порожній ввід ім'я та прізвища
    if (name.isEmpty || surname.isEmpty) {
      throw ArgumentError('Name and surname must not be empty');
    }

    // Перевірка чи правильно задана дата, якщо студент не може бути молодше 17 і старше 100
    int age = DateTime.now().year - dateOfBirth.year - (DateTime.now().month < dateOfBirth.month || (DateTime.now().month == dateOfBirth.month && DateTime.now().day < dateOfBirth.day) ? 1 : 0);
    if (age < 17 || age > 100){
      throw ArgumentError("Student can't be younger than 17 and older than 100");
    }

    // Перевірка email на коректність
    if (!_isValidEmail(_email)) {
      throw ArgumentError('Invalid email address');
    }

  }
  
  // Гетер для отримання оцінок
  Map<String, double> get grades => _grades;

  // Сетер оцінки за певне завдання
  void setGrade(String assignment, double grade) => _grades[assignment] = grade >= 0 ?  grade : throw ArgumentError("Grade can't be less than 0");


  // Метод для отримання віку студента з дати його народження
  int calculateAge() => DateTime.now().year - dateOfBirth.year - (DateTime.now().month < dateOfBirth.month || (DateTime.now().month == dateOfBirth.month && DateTime.now().day < dateOfBirth.day) ? 1 : 0);

  // Гетер для отримання адреси
  String? get address => _address;

  // Сетер для адреси
  void setAddress(String value) => _address = value.isNotEmpty ? value : throw ArgumentError("Address can't be empty");

  // Гетер для отримання email
  String get email => _email;

  // Сетер email
  void setEmail(String value) {
    if (_isValidEmail(value)) {
      _email = value;
    }
    else {
      throw ArgumentError('Invalid email address');
    }
  }

  // Перевірка email на коректність
  static bool _isValidEmail(String email) => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);

  // Підрахунок середньої оцінки
  double calculateAverageGrade() {
    if (_grades.isEmpty) return 0.0;
    double sum = _grades.values.reduce((a, b) => a + b);
    return sum / _grades.length;
  }

  @override 
  String toString() => "\nName: $name\nSurname: $surname\nAge: ${calculateAge()} years old\nAverage grade: ${calculateAverageGrade()}";

}
