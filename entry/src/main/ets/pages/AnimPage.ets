import { CommonConstants } from '../common/constants/CommonConstants';
import DimensionUtil from '../common/utils/DimensionUtil';
import RefreshComponent from '../view/RefreshComponent';
import { RefreshHeaderStyle, RefreshState, RefreshConstants } from '../common/constants/RefreshConstants';

@Preview
@Entry
@Component
export struct AnimPage {
  @Provide(RefreshConstants.REFRESH_STATE_TAG) state: number = RefreshState.REFRESHING;

  @Builder
  ContentBody() {
    Image($r('app.media.bg_content'))
      .width(CommonConstants.FULL_WIDTH_PERCENT)
      .height(DimensionUtil.getVp($r('app.float.content_height')))
      .objectFit(ImageFit.Fill)
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Text($r('app.string.file_index_title'))
        .backgroundColor(Color.White)
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .height(DimensionUtil.getVp($r('app.float.file_index_title_height')))
        .fontSize(DimensionUtil.getFp($r('app.float.file_index_title_size')))
        .fontWeight(FontWeight.Regular)
        .padding({ left: DimensionUtil.getVp($r('app.float.file_index_title_padding')) })
        .zIndex(CommonConstants.FILE_MANAGER_Z_INDEX)

      RefreshComponent({
        headerStyle: RefreshHeaderStyle.CLOUD,//刷新样式
        itemLayout: (): void => this.ContentBody(),
        displayHeight: (
          px2vp(DimensionUtil.getScreenHeight()) - DimensionUtil.getVp($r('app.float.file_index_title_height'))),
        onRefresh: () => {
          setTimeout(() => {
            this.state = RefreshState.COMPLETE;
          }, CommonConstants.REFRESH_DEFAULT_TIMEOUT);
        }
      })
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .margin({ top: DimensionUtil.getVp($r('app.float.file_index_title_height')) })
    }
    .height(CommonConstants.REFRESH_DEFAULT_TIMEOUT)
  }
}