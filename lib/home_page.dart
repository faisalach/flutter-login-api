import 'package:flutter/material.dart';
import 'login_screen.dart';
// import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {

	final int id;
	final String name;
	final String foto;
	final String email;
	final String token;
	final String jurusan;
	final String fakultas;
	final String angkatan;
	final List akm;

	HomePage(
		{required this.id,
		required this.name,
		required this.foto,
		required this.email,
		required this.token,
		required this.jurusan,
		required this.fakultas,
		required this.angkatan,
    required this.akm
		});

	@override
	State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
	Future<void> handleLogout(String token) async {
		Navigator.pushAndRemoveUntil(
			context,
			MaterialPageRoute(builder: (context) => LoginScreen()),
				(route) => false,
		);
	}


	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Home'),
				actions: [
					IconButton(
						onPressed: () => handleLogout(this.widget.token),
						icon: Icon(Icons.logout),
					),
				],
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Image(
							width: 100,
							image: NetworkImage('${this.widget.foto}'),
						),
						Text('Welcome, ${this.widget.name}!'),
						SizedBox(height: 16.0),
						Text('Email: ${this.widget.email}'),
						SizedBox(height: 16.0),
						Text('Name: ${this.widget.name}'),
						SizedBox(height: 16.0),
						Text('Jurusan: ${this.widget.jurusan}'),
						SizedBox(height: 16.0),
						Text('Fakultas: ${this.widget.fakultas}'),
						SizedBox(height: 16.0),
						Text('Angkatan: ${this.widget.angkatan.substring(0,4)}'),
						SizedBox(height: 16.0),
						Container(
							color: Colors.white,
							padding: EdgeInsets.all(20.0),
							child: Table(
								border: TableBorder.all(color: Colors.black),
								children: [
									TableRow(children: [
										Padding(
												padding: EdgeInsets.all(10.0),
												child: Text('Semester'),
										),
										Padding(
											padding: EdgeInsets.all(10.0),
											child: Text('IP'),
										),
										Padding(
											padding: EdgeInsets.all(10.0),
											child: Text('IPK'),
										),
									]),
									for(var item in this.widget.akm ) ...[
										TableRow(children: [
											Padding(
												padding: EdgeInsets.all(10.0),
												child: Text('${item['semester']}'),
											),
											Padding(
												padding: EdgeInsets.all(10.0),
												child: Text('${item['ip']}'),
											),
											Padding(
												padding: EdgeInsets.all(10.0),
												child: Text('${item['ipk']}'),
											),
										])
									],
								],
							),
						)
					],
				),
			),
		);
	}
}