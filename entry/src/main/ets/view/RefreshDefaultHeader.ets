
import {CommonConstants} from '../common/constants/CommonConstants';
import { RefreshConstants, RefreshState } from '../common/constants/RefreshConstants';
import DimensionUtil from '../common/utils/DimensionUtil';

@Component
export default struct RefreshDefaultHeader {

  @State refreshTitle: Resource = $r('app.string.refresh_default_header_hint');

  @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') state: number;

  private onStateCheck() {
    switch (this.state) {
      case RefreshState.IDLE:
        this.refreshTitle = $r('app.string.refresh_default_header_hint');
        break;
      case RefreshState.DRAGGING_REFRESHABLE:
        this.refreshTitle = $r('app.string.refresh_default_header_load');
        break;
      case RefreshState.REFRESHING:
        this.refreshTitle = $r('app.string.refresh_default_header_loading');
        break;
    }
  }

  build() {
    if (this.state !== RefreshState.IDLE) {
      Text(this.refreshTitle)
        .height(CommonConstants.FULL_WIDTH_PERCENT)
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .textAlign(TextAlign.Center)
        .fontSize(DimensionUtil.getFp($r('app.float.default_header_font_size')))
        .onAppear(() => {
          this.onStateCheck();
        })
    }
  }
}