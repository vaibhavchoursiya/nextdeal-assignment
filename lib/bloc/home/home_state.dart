enum HomeStatus { initial, loading, success, failed }

class HomeState {
  final HomeStatus status;
  final List<String> textList;
  final List<String> imageUrl;
  final bool startDragAnimation;
  final int currentIndex;

  HomeState({
    this.status = HomeStatus.initial,
    required this.textList,
    required this.imageUrl,
    required this.startDragAnimation,
    required this.currentIndex,
  });

  HomeState copyWith({
    List<String>? textList,
    List<String>? imageUrl,
    bool? startDragAnimation,
    int? currentIndex,
    HomeStatus? status,
  }) {
    return HomeState(
      textList: textList ?? this.textList,
      imageUrl: imageUrl ?? this.imageUrl,
      startDragAnimation: startDragAnimation ?? this.startDragAnimation,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
    );
  }
}
