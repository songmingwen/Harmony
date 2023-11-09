import { CommonConstants } from '../common/constants/CommonConstants';
import { CategoryComponent } from '../view/CategoryComponent';
import PageViewModel from '../viewmodel/PageViewModel';
import router from '@ohos.router';

@Preview
@Entry
@Component
export struct CategoryListPage {
  @Builder
  ButtonList() {
    //普通设置样式
    CategoryComponent({ listData: PageViewModel.getCategoryData()[0].categoryContent })
    //闪图样式
    this.newButton("Swiper", () => {
      router.pushUrl({ url: CommonConstants.SWIPER_PAGE });
    })
    //弹窗
    this.newButton("Dialog", () => {
      router.pushUrl({ url: CommonConstants.DIALOG_PAGE })
    })
    //属性动画
    this.newButton("Anim", () => {
      router.pushUrl({ url: CommonConstants.ANIM_PAGE })
    })
    //网络请求
    this.newButton("HTTP", () => {
      router.pushUrl({ url: CommonConstants.NEWS_PAGE })
    })
    //通知
    this.newButton("Notification", () => {
      router.pushUrl({ url: CommonConstants.NOTIFICATION_PAGE })
    })
    //lottie 动画
    this.newButton("Lottie", () => {
      router.pushUrl({ url: CommonConstants.LOTTIE_PAGE })
    })
  }

  build() {
    Column() {
      GridRow({
        breakpoints: {
          value: CommonConstants.BREAK_POINTS_VALUE,
          reference: BreakpointsReference.WindowSize
        },
        columns: {
          sm: CommonConstants.COLUMNS_SM,
          md: CommonConstants.COLUMNS_MD,
          lg: CommonConstants.COLUMNS_LG
        },
        gutter: { x: CommonConstants.GUTTER_X },
        direction: GridRowDirection.Row
      }) {
        GridCol({
          span: {
            sm: CommonConstants.SPAN_SM,
            md: CommonConstants.SPAN_MD,
            lg: CommonConstants.SPAN_LG
          },
          offset: {
            md: CommonConstants.OFFSET_MD,
            lg: CommonConstants.OFFSET_LG
          }
        }) {
          Column() {
            this.Title()
            this.Search()
            this.Content()
          }
        }
      }
      .margin({
        left: $r('app.float.grid_row_margin_left'),
        right: $r('app.float.grid_row_margin_right')
      })
    }
    .backgroundColor($r('app.color.theme_background'))
  }

  @Builder
  Content() {
    Scroll() {
      Column() {
        this.ButtonList()
      }.height('100%');
    }
    .scrollBar(BarState.Off)
    .edgeEffect(EdgeEffect.Spring)
    .margin({
      top: $r('app.float.scroll_bottom_margin_top')
    })
    .layoutWeight(CommonConstants.SCROLL_WEIGHT)
    .height('100%')
  }

  @Builder
  Search() {
    Search({
      placeholder: CommonConstants.SEARCH_PLACEHOLDER
    })
      .height($r('app.float.search_height'))
      .border({ radius: $r('app.float.search_radius') })
      .placeholderColor($r('app.color.search_placeholder'))
      .placeholderFont({
        size: $r('app.float.search_text_size'),
        weight: CommonConstants.SEARCH_WEIGHT,
        family: CommonConstants.SEARCH_FONT_FAMILY,
        style: FontStyle.Normal
      })
      .textFont({ size: $r('app.float.search_text_size') })
      .margin({
        top: $r('app.float.search_margin_top'),
        bottom: $r('app.float.search_margin_bottom')
      })
      .backgroundColor($r('app.color.search_background'))
  }

  @Builder
  public newButton(title: string, onClick: () => void) {
    Button(title).onClick(() => {
      onClick()
    })
      .margin({ top: "10vp", left: "10vp", right: "10vp" })
      .width(CommonConstants.FULL_WIDTH_PERCENT)
  }

  @Builder
  Title() {
    Row() {
      Image("https://img.zcool.cn/community/01ed2c5e8ecbb7a801216518ae4706.png@1280w_1l_2o_100sh.png")
        .objectFit(ImageFit.Fill)
        .width("45vp")
        .height("30vp")
        .margin({ right: "10vp" })
        .draggable(true)

      Text($r('app.string.page_title'))
        .fontColor(Color.Blue)
        .fontSize($r('app.float.title_font_size'))

      LoadingProgress()
        .color(Color.Blue)
        .height("30vp")
        .width("30vp")
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height($r('app.float.title_height'))
    .margin({
      top: $r('app.float.title_margin_top'),
      left: $r('app.float.title_margin_left')
    })
    .padding({ bottom: 20, left: 20, right: 20 })
  }
}