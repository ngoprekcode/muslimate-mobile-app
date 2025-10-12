import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<bool> requestPermissionIfNeeded() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }
    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  Future<Position> getCurrentPosition({int timeLimitSeconds = 10}) {
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: Duration(seconds: timeLimitSeconds),
    );
  }

  Future<String?> reverseGeocodeCity(double lat, double lng) async {
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (placemarks.isEmpty) return null;
      final p = placemarks.first;
      // gabungkan subAdministrativeArea atau locality sesuai ketersediaan
      final parts = <String>[];
      if (p.locality != null && p.locality!.isNotEmpty) parts.add(p.locality!);
      if (p.subAdministrativeArea != null &&
          p.subAdministrativeArea!.isNotEmpty) parts.add(p.subAdministrativeArea!);
      if (p.administrativeArea != null && p.administrativeArea!.isNotEmpty)
        parts.add(p.administrativeArea!);
      return parts.join(', ');
    } catch (_) {
      return null;
    }
  }
}