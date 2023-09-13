import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

String generateJwtToken() {
  const apiKey = '';
  const apiSecret = '';

  final payload = {
    'iss': apiKey,
    'exp': (DateTime.now().add(Duration(hours: 1))).millisecondsSinceEpoch ~/ 1000 + 3600,
  };

  final encodedHeader = base64Url.encode(utf8.encode(jsonEncode({'alg': 'HS256', 'typ': 'JWT'})));
  final encodedPayload = base64Url.encode(utf8.encode(jsonEncode(payload)));

  final hmac = Hmac(sha256, utf8.encode(apiSecret));
  final signature = hmac.convert(utf8.encode('$encodedHeader.$encodedPayload'));

  final jwtToken = '$encodedHeader.$encodedPayload.${base64Url.encode(signature.bytes)}';

  return jwtToken;
}
