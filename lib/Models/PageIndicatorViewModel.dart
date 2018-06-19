class PageIndicatorViewModel {
  final List<MaterialPageModel> pages;
  final int activeIndex;
  final SlideDirection slideDirection;
  final double slidepercent;

  PageIndicatorViewModel(
      this.pages, this.activeIndex, this.slideDirection, this.slidepercent);
}