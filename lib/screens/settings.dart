import 'package:flutter/material.dart';
import 'package:mphb_app/local_storage.dart';

class SettingsPage extends StatefulWidget {

	const SettingsPage({Key? key}) : super(key: key);

	@override
	_SettingsPageState createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: const Text('Settings'),
			),
			body: Center(
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.center,
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						Text(
							LocalStorage().domain
						),
						SizedBox(height: 25.0),
						OutlinedButton(
							onPressed: () {
								LocalStorage().clear();
								Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
							},
							child: Text("Log out"),
						),
					]
				),
			),
		);
	}
}
