

export class SwiperDataSource implements IDataSource{

  private list: number[] = []
  private listener: DataChangeListener

  constructor(list: number[]) {
    this.list = list
  }
  
  totalCount(): number {
    return this.list.length
  }

  getData(index: number) {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener) {
    this.listener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener) {
  }
}