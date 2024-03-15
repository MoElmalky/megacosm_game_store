class User {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String password;

  User(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.password});
}

List<User> users = [
  User(
      firstName: 'Mohamed',
      lastName: 'Elmalky',
      userName: 'Mo_Elmalky',
      email: 'elmalkymohamed@gmail.com',
      password: '123456789')
];
