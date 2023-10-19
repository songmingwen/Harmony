
import { RefreshState, RefreshConstants } from '../common/constants/RefreshConstants';
import { CommonConstants } from '../common/constants/CommonConstants';
import DimensionUtil from '../common/utils/DimensionUtil';
import ClassifyModel from '../common/bean/AnimationModel';

@Component
export default struct RefreshAnimHeader {

  @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') state: number;

  @State iconWidth: number = CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH;

  /**
   * refresh header item feature
   */
  readonly REFRESH_HEADER_FEATURE: ClassifyModel[] = [
    new ClassifyModel($r('app.media.ic_loading_game'), (px2vp(DimensionUtil.getScreenWidth()) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 100, 200),
    new ClassifyModel($r('app.media.ic_loading_heart'), (px2vp(DimensionUtil.getScreenWidth()) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 50, 400),
    new ClassifyModel($r('app.media.ic_loading_louder'), px2vp(DimensionUtil.getScreenWidth()) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2, 600),
    new ClassifyModel($r('app.media.ic_loading_bag'), (px2vp(DimensionUtil.getScreenWidth()) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 50, 800),
    new ClassifyModel($r('app.media.ic_loading_file'), (px2vp(DimensionUtil.getScreenWidth()) / 2 - CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 100, 1000)
  ];

  private onStateCheck() {
    if (this.state === RefreshState.REFRESHING) {
      this.iconWidth = CommonConstants.REFRESH_HEADER_ITEM_SCALE_WIDTH;
    } else {
      this.iconWidth = CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH;
    }
  }

  @Builder
  AttrAnimIcons(iconItem: ClassifyModel) {
    Image(iconItem.imgRes)
      .width(px2vp(DimensionUtil.adaptDimension(this.iconWidth)))
      .position({ x: iconItem.posX })
      .objectFit(ImageFit.Contain)
      .animation({
        duration: CommonConstants.REFRESH_HEADER_ITEM_ANIM_DURATION,
        tempo: CommonConstants.REFRESH_HEADER_ITEM_ANIM_TEMPO,
        delay: iconItem.delay,
        curve: Curve.Linear,
        playMode: PlayMode.Alternate,
        iterations: CommonConstants.REFRESH_HEADER_ITEM_ANIM_ITERATIONS
      })
  }

  build() {
    Row() {
      if (this.state !== RefreshState.IDLE) { // stop animation when idle state.
        ForEach(this.REFRESH_HEADER_FEATURE, (iconItem: ClassifyModel) => {
          this.AttrAnimIcons(iconItem)
        }, (item: ClassifyModel) => JSON.stringify(item))
      }
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height(CommonConstants.FULL_WIDTH_PERCENT)
    .onAppear(() => {
      this.onStateCheck();
    })
  }
}