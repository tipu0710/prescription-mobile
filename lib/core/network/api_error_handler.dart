import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String getErrorMessage(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return "Connection timeout. Please check your internet connection.";
        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);
        case DioExceptionType.cancel:
          return "Request cancelled.";
        case DioExceptionType.connectionError:
          return "No internet connection.";
        case DioExceptionType.unknown:
          return "An unexpected error occurred.";
        default:
          return "Something went wrong. Please try again.";
      }
    } else {
      return "An unexpected error occurred: $error";
    }
  }

  static String _handleBadResponse(Response? response) {
    if (response != null && response.data != null) {
      final data = response.data;

      try {
        if (data is Map<String, dynamic>) {
          // Check for 'detail' field (common in DRF)
          if (data.containsKey('detail')) {
            return data['detail'].toString();
          }

          // Check for 'message' field
          if(data.containsKey('message')) {
            return data['message'].toString();
          }

          // Check for 'non_field_errors'
          if (data.containsKey('non_field_errors')) {
            final errors = data['non_field_errors'];
            if (errors is List) {
              return errors.join('\n');
            }
            return errors.toString();
          }

          // Handle field-specific errors
          final List<String> errorMessages = [];
          data.forEach((key, value) {
            if (value is List) {
              for (var item in value) {
                errorMessages.add(item.toString());
              }
            } else {
              errorMessages.add(value.toString());
            }
          });

          if (errorMessages.isNotEmpty) {
            return errorMessages.join('\n');
          }
        } else if (data is List) {
          // Handle list of errors
          return data.join('\n');
        }
      } catch (e) {
        return "Server error: ${response.statusCode}";
      }
    }
    return "Server error: ${response?.statusCode ?? 'Unknown'}";
  }
}
