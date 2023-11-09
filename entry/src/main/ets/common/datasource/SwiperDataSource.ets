

export class SwiperDataSource implements IDataSource{

  private list: string[] = []

  private listener: DataChangeListener|null=null

  constructor(list: string[]) {
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