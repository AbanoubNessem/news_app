import '../models/SourcesRespons.dart';

abstract class ApiStates {}

class ApiInitialState extends ApiStates {}

class GetResponsState extends ApiStates {
  final List<Source> sources;

  GetResponsState(this.sources);
}
class GetResponsArtState extends ApiStates {}
class SearchArtState extends ApiStates {}
class UrlLauncherState extends ApiStates {}


class IndexState extends ApiStates {
  final int currentIndex;
  IndexState(this.currentIndex);
}
