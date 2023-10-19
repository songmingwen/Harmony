import hilog from '@ohos.hilog'
import { CommonConstants } from '../common/constants/CommonConstants'

@Preview
@Entry
@Component
export struct DialogPage {
  build() {
    Column() {
      this.newButton("AlertDialog", () => {
        this.showAlertDialog()
      })
      this.newButton("TextPickerDialog", () => {
        this.showTextPickerDialog()
      })
      this.newButton("DatePickerDialog", () => {
        this.showDatePickerDialog()
      })
      this.newButton("TimePickerDialog", () => {
        this.showTimePickerDialog()
      })
      this.newButton("CustomDialog", () => {

      })
    }
    .padding({ left: 10, right: 10 })
  }

  private showTimePickerDialog() {
    TimePickerDialog.show({
      selected: new Date(),
      useMilitaryTime: true,
      onAccept: (value: TimePickerResult) => {
        hilog.info(0x0000, "DialogPage", "hour = " + value.hour + "; minute = " + value.minute)
      }
    })
  }

  private showTextPickerDialog() {
    TextPickerDialog.show({
      range: ["男", "女"],
      selected: 0,
      onAccept: (result: TextPickerResult) => {
        hilog.info(0x0000, "DialogPage", "result = " + result.value)
      },
      onCancel: () => {
      }
    })
  }

  private showDatePickerDialog() {
    DatePickerDialog.show({
      start: new Date("1900-1-1"),
      end: new Date("2100-1-1"),
      selected: new Date(),
      lunar: false,
      onDateAccept: (value: Date) => {
        let year = value.getFullYear()
        let month = value.getMonth()
        let day = value.getDate()
        let week = value.getDay()
        hilog.info(0x0000, "DialogPage", "year = " + year + "; month = " + (month + 1) + "; day = " + day + "; week = " + week)
      }
    })
  }

  private showAlertDialog() {
    AlertDialog.show({
      title: "是否打开通知",
      message: "打开通知，及时收到最新信息",
      primaryButton: {
        value: "取消",
        action: () => {

        }
      },
      secondaryButton: {
        value: "打开",
        fontColor: "$r('app.color.page_title')",
        action: () => {

        }
      },
      alignment: DialogAlignment.Bottom,
      offset: { dx: "0", dy: "-20vp" }
    })
  }

  @Builder
  public newButton(title: string, onClick: () => void) {
    Button(title).onClick(() => {
      onClick.call(this)
    })
      .margin({ top: "10vp", left: "10vp", right: "10vp" })
      .width('100%')
  }
}