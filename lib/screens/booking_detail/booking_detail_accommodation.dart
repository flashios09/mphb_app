import 'package:flutter/material.dart';
import 'package:mphb_app/models/reserved_accommodation.dart';

class BookingDetailAccommodation extends StatelessWidget {

	const BookingDetailAccommodation({required this.reserved_accommodation, Key? key}) : super(key: key);

	final Reserved_Accommodation reserved_accommodation;

	@override
	Widget build(BuildContext context) {

		return Container(

			padding: EdgeInsets.all(20.0),
			margin: const EdgeInsets.only(top: 10.0),
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.all(
					Radius.circular(6)
				),
				boxShadow: [
					BoxShadow(
						color: Colors.grey.withOpacity(0.1),
						spreadRadius: 0,
						blurRadius: 2,
						offset: Offset(0, 4), // changes position of shadow
					),
				],
			),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Row(
						children: [
							Expanded(
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Text(
											reserved_accommodation.accommodationObject.title,
											style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
										),
										Padding(
											padding: EdgeInsets.only(top: 5.0),
											child: Text(
												reserved_accommodation.accommodationTypeObject.title,
												style: TextStyle(fontSize: 12),
											),
										),
									]
								)
							),
							Container(
								child: Column(
									mainAxisSize: MainAxisSize.min,
									children: [
										Text(
											reserved_accommodation.adults.toString(),
											style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
										),
										Text(
											'adults',
											style: TextStyle(fontSize: 11),
										),
									]
								),
							),
							if ( reserved_accommodation.children > 0 )
								Container(
									padding: EdgeInsets.only(left: 10.0),
									child: Column(
										mainAxisSize: MainAxisSize.min,
										children: [
											Text(
												reserved_accommodation.children.toString(),
												style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
											),
											Text(
												'children',
												style: TextStyle(fontSize: 11),
											),
										]
									),
								),
						]
					),
				],
			),
		);
	}
}
