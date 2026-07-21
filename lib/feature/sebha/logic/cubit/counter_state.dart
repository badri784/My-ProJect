class CounterState {
  final int count;
  final int totalCount;
  final int selectedIndex;

  const CounterState({
    required this.count,
    required this.totalCount,
    required this.selectedIndex,
  });

  CounterState copyWith({int? count, int? totalCount, int? selectedIndex}) {
    return CounterState(
      count: count ?? this.count,
      totalCount: totalCount ?? this.totalCount,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
