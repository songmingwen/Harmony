
import CustomRefreshLoadLayout from './CustomRefreshLoadLayout';
import { CustomRefreshLoadLayoutClass } from '../common/bean/NewsData';

/**
 * The load more layout component.
 */
@Component
export default struct LoadMoreLayout {
  @ObjectLink loadMoreLayoutClass: CustomRefreshLoadLayoutClass;

  build() {
    Column() {
      if (this.loadMoreLayoutClass.isVisible) {
        CustomRefreshLoadLayout({
          customRefreshLoadClass: new CustomRefreshLoadLayoutClass(this.loadMoreLayoutClass.isVisible,
            this.loadMoreLayoutClass.imageSrc, this.loadMoreLayoutClass.textValue, this.loadMoreLayoutClass.heightValue)
        })
      } else {
        CustomRefreshLoadLayout({
          customRefreshLoadClass: new CustomRefreshLoadLayoutClass(this.loadMoreLayoutClass.isVisible,
            this.loadMoreLayoutClass.imageSrc, this.loadMoreLayoutClass.textValue, 0)
        })
      }
    }
  }
}