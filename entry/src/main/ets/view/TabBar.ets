
import NewsList from '../view/newslist';
import { CommonConstants } from '../common/constants/CommonConstants';
import NewsTypeBean from '../common/bean/NewsTypeBean';
import NewsViewModel from '../viewmodel/NewsViewModel';

/**
 * The tabBar component.
 */
@Component
export default struct TabBar {
  @State tabBarArray: NewsTypeBean[] = NewsViewModel.getDefaultTypeList();
  @State currentIndex: number = 0;
  @State currentPage: number = 1;

  @Builder TabBuilder(index: number) {
    Column() {
      Text(this.tabBarArray[index].name)
        .height(CommonConstants.FULL_HEIGHT_PERCENT)
        .padding({ left: CommonConstants.TabBars_HORIZONTAL_PADDING, right: CommonConstants.TabBars_HORIZONTAL_PADDING })
        .fontSize(this.currentIndex === index ? CommonConstants.TabBars_SELECT_TEXT_FONT_SIZE : CommonConstants.TabBars_UN_SELECT_TEXT_FONT_SIZE)
        .fontWeight(this.currentIndex === index ? CommonConstants.TabBars_SELECT_TEXT_FONT_WEIGHT : CommonConstants.TabBars_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.fontColor_text3'))
    }
  }

  aboutToAppear() {
    // Request news category.
    NewsViewModel.getNewsTypeList().then((typeList: NewsTypeBean[]) => {
      this.tabBarArray = typeList;
    }).catch((typeList: NewsTypeBean[]) => {
      this.tabBarArray = typeList;
    });
  }

  build() {
    Tabs() {
      ForEach(this.tabBarArray, (tabsItem: NewsTypeBean,index:number) => {
        TabContent() {
          Column() {
            NewsList({tabType:index})
          }
        }
        .tabBar(this.TabBuilder(tabsItem.id))
      }, (item: NewsTypeBean) => JSON.stringify(item));
    }
    .barHeight(CommonConstants.TabBars_BAR_HEIGHT)
    .barMode(BarMode.Scrollable)
    .barWidth(CommonConstants.TabBars_BAR_WIDTH)
    .onChange((index: number) => {
      this.currentIndex = index;
      this.currentPage = 1;
    })
    .vertical(false)
  }
}