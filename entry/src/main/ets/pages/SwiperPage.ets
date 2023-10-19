import { SwiperDataSource } from '../common/datasource/SwiperDataSource';
import { CommonConstants } from '../common/constants/CommonConstants';
import hilog from '@ohos.hilog';
import { LottiePage } from './LottiePage';

@Preview
@Entry
@Component
export struct SwiperPage {
  private swiperController: SwiperController = new SwiperController()
  private data: SwiperDataSource = new SwiperDataSource([])

  aboutToAppear() {
    let list = []
    for (var i = 1; i <= 10; i++) {
      list.push("https://img.zcool.cn/community/01ed2c5e8ecbb7a801216518ae4706.png@1280w_1l_2o_100sh.png");
    }
    this.data = new SwiperDataSource(list)
  }

  build() {
    Column() {
      //轮播闪图
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Stack({ alignContent: Alignment.Bottom }) {
            Image("https://img.zcool.cn/community/01ed2c5e8ecbb7a801216518ae4706.png@1280w_1l_2o_100sh.png")
              .objectFit(ImageFit.Auto)
              .width(CommonConstants.FULL_WIDTH_PERCENT)
              .height("200vp")

            Text(item)
              .width(CommonConstants.FULL_WIDTH_PERCENT)
              .height(30)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }.height("200vp")
        }, item => item)
      }
      .cachedCount(2)
      .index(0)
      .autoPlay(true)
      .interval(3000)
      .indicator(true)
      .loop(true)
      .duration(300)
      .itemSpace(0)
      .curve(Curve.EaseOut)
      .onChange((index: number) => {
        hilog.info(0x0000, 'swiper', '%{public}s', 'index = ' + index);
      })
    }
  }
}