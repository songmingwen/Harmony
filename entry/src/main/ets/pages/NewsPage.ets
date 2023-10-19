
import TabBar from '../view/TabBar';
import { CommonConstants } from '../common/constants/CommonConstants';

/**
 * The Index is the entry point of the application.
 */
@Preview
@Entry
@Component
struct NewsPage {

  build() {
    Column() {
      TabBar()
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .backgroundColor($r('app.color.listColor'))
    .justifyContent(FlexAlign.Center)
  }
}