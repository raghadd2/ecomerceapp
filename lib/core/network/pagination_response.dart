import 'package:base_project/core/utils/app_constance.dart';
import 'package:equatable/equatable.dart';

class PaginationResponse<T> extends Equatable {
  final List<T> items;
  final int totalPages;
  final int page;
  const PaginationResponse({
    required this.items,
    this.totalPages = 1,
    this.page = AppConstance.page,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json,
          T modelFromJson(Map<String, dynamic> json)) =>
      PaginationResponse(
        items: json['your list'] != null
            ? (json['your list'] as List<T>)
                .map((e) => modelFromJson(e as Map<String, dynamic>))
                .toList()
            : [],
        page: json['your key'] ?? AppConstance.page,
        totalPages: json['your key'] ?? 1,
      );

  @override
  List<Object?> get props {
    return [
      items,
      totalPages,
      page,
    ];
  }
}
