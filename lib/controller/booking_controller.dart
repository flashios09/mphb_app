import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:mphb_app/controller/basic_controller.dart';
import 'package:mphb_app/models/booking.dart';

class BookingController extends BasicController{

	final String _queryEndpoint = '/bookings';

	/*
	 * https://booking.loc/wp-json/mphb/v1/bookings/6827?&consumer_key=ck_1d9a5f63a7d95d69db24ea6d2a1a883cace7a127&consumer_secret=cs_993ee46f420b9472bc4b98aed6b2b1ca5e92b717
	 */
	Future<Booking> wpGetBooking( int bookingID ) async {

		final headers = super.getHeaders();

		final queryParameters = <String, String> {
			'_embed' : 'accommodation,accommodation_type,services'
		};

		var queryEndpoint = '$_queryEndpoint/${bookingID.toString()}';

		final uri = super.getUriHttps( queryEndpoint, queryParameters);

		print(uri.toString());
		final response = await http.get(
			uri,
			headers: headers,
		);

		if ( response.statusCode == HttpStatus.OK ) {

			return Booking.fromJson(jsonDecode(response.body));

		} else {

			throw Exception('Request failed with status: ${response.statusCode}.');
		}

	}

	Future<Booking> wpUpdateBookingStatus( Booking booking, String newStatus ) async {

		var bookingID = booking.id;

		final headers = super.getHeaders();

		final queryEndpoint = '$_queryEndpoint/${bookingID.toString()}';

		final uri = super.getUriHttps( queryEndpoint );

		print(uri.toString());
		final response = await http.post(
			uri,
			headers: headers,
			body: jsonEncode(<String, String>{
				'status': newStatus,
			}),
		);

		if (response.statusCode == 200) {

			Booking result = Booking.fromJson(jsonDecode(response.body));

			if ( result.status == newStatus ) {
				booking.status = newStatus;
			}

			return booking;

		} else {

			throw Exception('Request failed with status: ${response.statusCode}.');
		}

	}

}