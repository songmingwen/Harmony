import promptAction from '@ohos.promptAction';
import { CommonConstants as Const, PageState, RefreshState } from '../common/constants/CommonConstants';
import NewsItem from './NewsItem';
import LoadMoreLayout from './LoadMoreLayout';
import RefreshLayout from './RefreshLayout';
import CustomRefreshLoadLayout from './CustomRefreshLoadLayout';
import { CustomRefreshLoadLayoutClass, NewsData } from '../common/bean/NewsData';
import NewsViewModel from '../viewmodel/NewsViewModel';
import NoMoreLayout from './NoMoreLayout';

/**
 * The news list component.
 */
@Component
export default struct NewsList {
  @Prop tabType: number = 0;
  @State newsData: Array<NewsData> = [];
  @State currentPage: number = 1;
  @State pageSize: number = Const.PAGE_SIZE;
  @State pullDownRefreshText: Resource = $r('app.string.pull_down_refresh_text');
  @State pullDownRefreshImage: Resource = $r('app.media.ic_pull_down_refresh');
  @State pullDownRefreshHeight: number = Const.CUSTOM_LAYOUT_HEIGHT;
  @State isVisiblePullDown: boolean = false;
  @State pullUpLoadText: Resource = $r('app.string.pull_up_load_text');
  @State pullUpLoadImage: Resource = $r('app.media.ic_pull_up_load');
  @State pullUpLoadHeight: number = Const.CUSTOM_LAYOUT_HEIGHT;
  @State isVisiblePullUpLoad: boolean = false;
  @State offsetY: number = 0;
  @State pageState: number = PageState.Loading;
  @State hasMore: boolean = true;
  private startIndex = 0;
  private endIndex = 0;
  private downY = 0;
  private lastMoveY = 0;
  private isRefreshing: boolean = false;
  private isCanRefresh = false;
  private isPullRefreshOperation = false;
  private isLoading: boolean = false;
  private isCanLoadMore: boolean = false;

  changeCategory() {
    this.currentPage = 1;
    NewsViewModel.getNewsList(this.currentPage, this.pageSize, Const.GET_NEWS_LIST).then((data: NewsData[]) => {
      this.pageState = PageState.Success;
      if (data.length === this.pageSize) {
        this.currentPage++;
        this.hasMore = true;
      } else {
        this.hasMore = false;
      }
      this.newsData = data;
    }).catch((err: string | Resource) => {
      promptAction.showToast({
        message: err,
        duration: Const.ANIMATION_DURATION
      });
      this.pageState = PageState.Fail;
    });
  }

  aboutToAppear() {
    // Request news data.
    this.changeCategory();
  }

  build() {
    Column() {
      if (this.pageState === PageState.Success) {
        this.ListLayout()
      } else if (this.pageState === PageState.Loading) {
        this.LoadingLayout()
      } else {
        this.FailLayout()
      }
    }
    .width(Const.FULL_WIDTH)
    .height(Const.FULL_HEIGHT)
    .justifyContent(FlexAlign.Center)
    .onTouch((event: TouchEvent | undefined) => {
      if (event) {
        if (this.pageState === PageState.Success) {
          this.listTouchEvent(event);
        }
      }
    })
  }

  @Builder
  LoadingLayout() {
    CustomRefreshLoadLayout({ customRefreshLoadClass: new CustomRefreshLoadLayoutClass(true,
      $r('app.media.ic_pull_up_load'), $r('app.string.pull_up_load_text'), this.pullDownRefreshHeight) })
  }

  @Builder
  ListLayout() {
    List() {
      ListItem() {
        RefreshLayout({
          refreshLayoutClass: new CustomRefreshLoadLayoutClass(this.isVisiblePullDown, this.pullDownRefreshImage,
            this.pullDownRefreshText, this.pullDownRefreshHeight)
        })
      }

      ForEach(this.newsData, (item: NewsData) => {
        ListItem() {
          NewsItem({ newsData: item })
        }
        .height(Const.NewsListConstant_ITEM_HEIGHT)
        .backgroundColor($r('app.color.white'))
        .margin({ top: Const.NewsListConstant_ITEM_MARGIN_TOP })
        .borderRadius(Const.NewsListConstant_ITEM_BORDER_RADIUS)
      }, (item: NewsData, index?: number) => JSON.stringify(item) + index)

      ListItem() {
        if (this.hasMore) {
          LoadMoreLayout({
            loadMoreLayoutClass: new CustomRefreshLoadLayoutClass(this.isVisiblePullUpLoad, this.pullUpLoadImage,
              this.pullUpLoadText, this.pullUpLoadHeight)
          })
        } else {
          NoMoreLayout()
        }
      }
    }
    .width(Const.NewsListConstant_LIST_WIDTH)
    .height(Const.FULL_HEIGHT)
    .margin({ left: Const.NewsListConstant_LIST_MARGIN_LEFT, right: Const.NewsListConstant_LIST_MARGIN_RIGHT })
    .backgroundColor($r('app.color.listColor'))
    .divider({
      color: $r('app.color.dividerColor'),
      strokeWidth: Const.NewsListConstant_LIST_DIVIDER_STROKE_WIDTH,
      endMargin: Const.NewsListConstant_LIST_MARGIN_RIGHT
    })
    // Remove the rebound effect.
    .edgeEffect(EdgeEffect.None)
    .offset({ x: 0, y: `${this.offsetY}px` })
    .onScrollIndex((start: number, end: number) => {
      // Listen to the first index of the current list.
      this.startIndex = start;
      this.endIndex = end;
    })
  }

  @Builder
  FailLayout() {
    Image($r('app.media.none'))
      .height(Const.NewsListConstant_NONE_IMAGE_SIZE)
      .width(Const.NewsListConstant_NONE_IMAGE_SIZE)
    Text($r('app.string.page_none_msg'))
      .opacity(Const.NewsListConstant_NONE_TEXT_opacity)
      .fontSize(Const.NewsListConstant_NONE_TEXT_size)
      .fontColor($r('app.color.fontColor_text3'))
      .margin({ top: Const.NewsListConstant_NONE_TEXT_margin })
  }

  listTouchEvent(event: TouchEvent) {
    switch (event.type) {
      case TouchType.Down:
        this.downY = event.touches[0].y;
        this.lastMoveY = event.touches[0].y;
        break;
      case TouchType.Move:
        if ((this.isRefreshing === true) || (this.isLoading === true)) {
          return;
        }
        let isDownPull = event.touches[0].y - this.lastMoveY > 0;
        if (((isDownPull === true) || (this.isPullRefreshOperation === true)) && (this.isCanLoadMore === false)) {
          // Finger movement, processing pull-down refresh.
          this.touchMovePullRefresh(event);
        } else {
          // Finger movement, processing load more.
          this.touchMoveLoadMore(event);
        }
        this.lastMoveY = event.touches[0].y;
        break;
      case TouchType.Cancel:
        break;
      case TouchType.Up:
        if ((this.isRefreshing === true) || (this.isLoading === true)) {
          return;
        }
        if ((this.isPullRefreshOperation === true)) {
          // Lift your finger and pull down to refresh.
          this.touchUpPullRefresh();
        } else {
          // Fingers up, handle loading more.
          this.touchUpLoadMore();
        }
        break;
      default:
        break;
    }
  }

  touchMovePullRefresh(event: TouchEvent) {
    if (this.startIndex === 0) {
      this.isPullRefreshOperation = true;
      let height = vp2px(this.pullDownRefreshHeight);
      this.offsetY = event.touches[0].y - this.downY;
      // The sliding offset is greater than the pull-down refresh layout height, and the refresh condition is met.
      if (this.offsetY >= height) {
        this.pullRefreshState(RefreshState.Release);
        this.offsetY = height + this.offsetY * Const.Y_OFF_SET_COEFFICIENT;
      } else {
        this.pullRefreshState(RefreshState.DropDown);
      }
      if (this.offsetY < 0) {
        this.offsetY = 0;
        this.isPullRefreshOperation = false;
      }
    }
  }

  public touchUpPullRefresh() {
    if (this.isCanRefresh === true) {
      this.offsetY = vp2px(this.pullDownRefreshHeight);
      this.pullRefreshState(RefreshState.Refreshing);
      this.currentPage = 1;
      setTimeout(() => {
        NewsViewModel.getNewsList(this.currentPage, this.pageSize, Const.GET_NEWS_LIST).then((data: NewsData[]) => {
          if (data.length === this.pageSize) {
            this.hasMore = true;
            this.currentPage++;
          } else {
            this.hasMore = false;
          }
          this.newsData = data;
          this.closeRefresh(true);
        }).catch((err: string | Resource) => {
          promptAction.showToast({ message: err });
          // closeRefresh.call(self, false);
          this.closeRefresh(false);
        });
      }, Const.DELAY_TIME);
    } else {
      this.closeRefresh(false);
    }
  }

  pullRefreshState(state: number) {
    switch (state) {
      case RefreshState.DropDown:
        this.pullDownRefreshText = $r('app.string.pull_down_refresh_text');
        this.pullDownRefreshImage = $r("app.media.ic_pull_down_refresh");
        this.isCanRefresh = false;
        this.isRefreshing = false;
        this.isVisiblePullDown = true;
        break;
      case RefreshState.Release:
        this.pullDownRefreshText = $r('app.string.release_refresh_text');
        this.pullDownRefreshImage = $r("app.media.ic_pull_up_refresh");
        this.isCanRefresh = true;
        this.isRefreshing = false;
        break;
      case RefreshState.Refreshing:
        this.offsetY = vp2px(this.pullDownRefreshHeight);
        this.pullDownRefreshText = $r('app.string.refreshing_text');
        this.pullDownRefreshImage = $r("app.media.ic_pull_up_load");
        this.isCanRefresh = true;
        this.isRefreshing = true;
        break;
      case RefreshState.Success:
        this.pullDownRefreshText = $r('app.string.refresh_success_text');
        this.pullDownRefreshImage = $r("app.media.ic_succeed_refresh");
        this.isCanRefresh = true;
        this.isRefreshing = true;
        break;
      case RefreshState.Fail:
        this.pullDownRefreshText = $r('app.string.refresh_fail_text');
        this.pullDownRefreshImage = $r("app.media.ic_fail_refresh");
        this.isCanRefresh = true;
        this.isRefreshing = true;
        break;
      default:
        break;
    }
  }

  closeRefresh(isRefreshSuccess: boolean) {
    let self = this;
    setTimeout(() => {
      let delay = Const.RefreshConstant_DELAY_PULL_DOWN_REFRESH;
      if (self.isCanRefresh === true) {
        this.pullRefreshState(isRefreshSuccess ? RefreshState.Success : RefreshState.Fail);
        delay = Const.RefreshConstant_DELAY_SHRINK_ANIMATION_TIME;
      }
      animateTo({
        duration: Const.RefreshConstant_CLOSE_PULL_DOWN_REFRESH_TIME,
        delay: delay,
        onFinish: () => {
          this.pullRefreshState(RefreshState.DropDown);
          self.isVisiblePullDown = false;
          self.isPullRefreshOperation = false;
        }
      }, () => {
        self.offsetY = 0;
      })
    }, self.isCanRefresh ? Const.DELAY_ANIMATION_DURATION : 0);
  }

  touchMoveLoadMore(event: TouchEvent) {
    if (this.endIndex === this.newsData.length - 1 || this.endIndex === this.newsData.length) {
      this.offsetY = event.touches[0].y - this.downY;
      if (Math.abs(this.offsetY) > vp2px(this.pullUpLoadHeight) / 2) {
        this.isCanLoadMore = true;
        this.isVisiblePullUpLoad = true;
        this.offsetY = -vp2px(this.pullUpLoadHeight) + this.offsetY * Const.Y_OFF_SET_COEFFICIENT;
      }
    }
  }

  touchUpLoadMore() {
    animateTo({
      duration: Const.ANIMATION_DURATION,
    }, () => {
      this.offsetY = 0;
    })
    if ((this.isCanLoadMore === true) && (this.hasMore === true)) {
      this.isLoading = true;
      setTimeout(() => {
        this.closeLoadMore();
        NewsViewModel.getNewsList(this.currentPage, this.pageSize, Const.GET_NEWS_LIST).then((data: NewsData[]) => {
          if (data.length === this.pageSize) {
            this.currentPage++;
            this.hasMore = true;
          } else {
            this.hasMore = false;
          }
          this.newsData = this.newsData.concat(data);
        }).catch((err: string | Resource) => {
          promptAction.showToast({ message: err });
        })
      }, Const.DELAY_TIME);
    } else {
      this.closeLoadMore();
    }
  }

  closeLoadMore() {
    this.isCanLoadMore = false;
    this.isLoading = false;
    this.isVisiblePullUpLoad = false;
  }
}