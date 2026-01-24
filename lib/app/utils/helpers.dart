import 'package:flutter/material.dart';

class AppHelpers {

  static Color getStatusColor(String status) {

    switch (status.toLowerCase())
    {
      case 'pending':
        return Colors.orange;
      case 'processing':
        return Colors.blue;
      case 'packed':
        return Colors.blue;
      case 'shipped':
        return Colors.purple;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  static String formatDate(DateTime date)
  {
    return '${date.day}/${date.month}/${date.year}';
  }
}

