
import { CommonConstants as Const } from '../common/constants/CommonConstants'

/**
 * The No more data layout component.
 */
@Component
export default struct NoMoreLayout {
  build() {
    Row() {
      Text($r('app.string.prompt_message'))
        .margin({ left: Const.NoMoreLayoutConstant_NORMAL_PADDING })
        .fontSize(Const.NoMoreLayoutConstant_TITLE_FONT)
        .textAlign(TextAlign.Center)
    }
    .width(Const.FULL_WIDTH)
    .justifyContent(FlexAlign.Center)
    .height(Const.CUSTOM_LAYOUT_HEIGHT)
  }
}