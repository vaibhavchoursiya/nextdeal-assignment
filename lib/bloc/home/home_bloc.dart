import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nextdeal_app/bloc/home/home_event.dart';
import 'package:nextdeal_app/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<String> textList = [
    "Find Your Dream\nHome with Ease!",
    "Learn, Build,\nRepeat! asdfasdf",
    "Create Amazing \nUI! asdfasd",
    "Master Animation!\nsdfasdf",
    "Keep Coding! \nadsfasd asdfasdf",
  ];

  List<String> imageUrl = List.generate(5, (e) {
    return "https://picsum.photos/200/300";
  });

  HomeBloc()
    : super(
        HomeState(
          textList: [],
          imageUrl: [],
          startDragAnimation: false,
          currentIndex: 0,
        ),
      ) {
    on<HomeDataLoaded>((event, emit) {
      emit(
        state.copyWith(
          status: HomeStatus.success,
          textList: textList,
          imageUrl: imageUrl,
        ),
      );
    });
    on<HomeCurrentIndexUpdated>((event, emit) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    });
    on<HomeDragAnimationStarted>((event, emit) {
      emit(state.copyWith(startDragAnimation: true));
    });
  }
}
