import 'dart:math';

import 'package:data_heros_test/model/request/branch_request.dart';
import 'package:data_heros_test/services/network_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as Get;

class BranchRepository {
  BranchRepository();

  Future<Response?> fetchBranches(int page_number, int per_page) async {
    try {
      return Network.dio.get('branch/page', queryParameters: {
        'page_number': page_number,
        'per_page': per_page,
      });
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        Get.Get.snackbar('Error', 'Connection timeout',
            snackPosition: Get.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 2));
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        Get.Get.snackbar('Error', 'Network Error',
            snackPosition: Get.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 2));
      } else {
        Get.Get.snackbar('Error', 'Unknown Error',
            snackPosition: Get.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 2));
      }
    }
  }

  Future<Response?> saveBranches(BranchRequest branchRequest) async {
    try {
      Random random = new Random();
      return Network.dio.post('branch', data: {
        'number': random.nextInt(1000000),
        'code': branchRequest.code,
        'name': branchRequest.name,
        'foreign_name': branchRequest.foreign_name
      });
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        Get.Get.snackbar('Error', 'Connection timeout',
            snackPosition: Get.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 2));
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        Get.Get.snackbar('Error', 'Network Error',
            snackPosition: Get.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 2));
      } else {
        Get.Get.snackbar('Error', 'Unknown Error',
            snackPosition: Get.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 2));
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response?> deleteBranch(String guide) async {
    try {
      Random random = new Random();
      return Network.dio.delete('branch/$guide');
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        Get.Get.snackbar('Error', 'Connection timeout',
            snackPosition: Get.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 2));
      } else if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        Get.Get.snackbar('Error', 'Network Error',
            snackPosition: Get.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 2));
      } else {
        Get.Get.snackbar('Error', 'Unknown Error',
            snackPosition: Get.SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            icon: Icon(Icons.error, color: Colors.white),
            duration: Duration(seconds: 2));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

final branchRepository = BranchRepository();
