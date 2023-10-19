
import CustomRefreshLoadLayout from './CustomRefreshLoadLayout';
import { CustomRefreshLoadLayoutClass } from '../common/bean/NewsData';

/**
 * The refresh layout component.
 */
@Component
export default struct RefreshLayout {
  @ObjectLink refreshLayoutClass: CustomRefreshLoadLayoutClass;

  build() {
    Column() {
      if (this.refreshLayoutClass.isVisible) {
        CustomRefreshLoadLayout({ customRefreshLoadClass: new CustomRefreshLoadLayoutClass
        (this.refreshLayoutClass.isVisible, this.refreshLayoutClass.imageSrc, this.refreshLayoutClass.textValue,
          this.refreshLayoutClass.heightValue) })
      }
    }
  }
}