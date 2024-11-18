class PaginationRequest {
  final int page;
  final int limit;

  PaginationRequest({
    required this.page,
    required this.limit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'limit': limit,
    };
  }
}
