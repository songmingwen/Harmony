import lottie from '@ohos/lottie'
import promptAction from '@ohos.promptAction';
import { CommonConstants } from '../common/constants/CommonConstants';

@Preview
@Entry
@Component
export struct LottiePage {
  private renderingSettings: RenderingContextSettings = new RenderingContextSettings(true)
  private renderingContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSettings)
  private path: string = "common/lottie/json_kanshan.json";
  private animateName: string = this.path;
  private animateItem = null

  build() {
    Stack() {
      Canvas(this.renderingContext)
        .width(CommonConstants.FULL_WIDTH_PERCENT)
        .height(CommonConstants.FULL_WIDTH_PERCENT)
        .backgroundColor(Color.Transparent)
        .onDisAppear(() => {
          if (this.animateItem !== null) {
            lottie.destroy(this.animateName)
          }
        })
        .onClick(() => {
          promptAction.showToast({
            message: "点击了 Lottie 动画",
            duration: CommonConstants.ANIMATION_DURATION
          });
        })

      Button("开始播放 Lottie 动画").onClick(() => {

        if (this.animateItem !== null) {
          this.animateItem.destroy();
          this.animateItem = null;
        }

        this.animateItem = lottie.loadAnimation({
          container: this.renderingContext,
          renderer: 'canvas',
          name: this.animateName,
          loop: true,
          autoplay: true,
          path: this.path
        })
        this.animateItem.play()
      }).margin({ bottom: 40 })
    }.alignContent(Alignment.Bottom)
  }
}