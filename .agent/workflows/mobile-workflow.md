---
description: Mobile app development rules
---

1. Always create widget and unit test case for each feature.
2. All riverpod provider should be Ref. Example:
@riverpod
ApiClient apiClient(ApiClientRef ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
}

Here ApiClientRef should be Ref.
@riverpod
ApiClient apiClient(Ref ref) {
  final dio = ref.watch(dioProvider);
  return ApiClient(dio);
}

3. Use dot shorthand where appicable.