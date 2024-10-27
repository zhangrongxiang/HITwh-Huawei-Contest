@Entry
@Component
struct ToDoList {
  @State tasks: string[] = [];
  @State newTask: string = '';
  @State completed: boolean =false;
  build() {
    Column() {

      // 标题
      Text('To-Do List')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center);


      TextInput({ placeholder: 'Enter a new task...' })
        .width('80%')
        .padding(10)
        .borderRadius(10)
        .borderWidth(2)
        .borderColor('#cccccc')
        .onChange((value: string) => {
          this.newTask = value;
        });

      Button('Add Task')
        .margin({ top: 10 })
        .onClick(() => {
          if (this.newTask.trim() !== '') {
            this.tasks.push(this.newTask);
            this.newTask = '';
          }
        });
  //在每一个任务左边添加一个图标，当任务被点击时，图标从圆形框变成打勾（即已完成）的图标
      ForEach(this.tasks, (task: string, index: number) => {
        Row() {
          Image(this.completed ? $rawfile('ic_ok.png') : $rawfile('ic_default.png'))
            .width(30)
            .height(30)
            .margin({ right: 10 })
            .onClick(() => {
              this.completed = !this.completed;
            });
          Text(task)
            .fontSize(20)
            .width('80%')
          Button('Delete')
            .backgroundColor('#FF6B6B')
            .onClick(() => {
              this.tasks.splice(index, 1);
            });
        }
        .padding(10)
        .backgroundColor('#f0f0f0')
        .borderRadius(8);
      })
    }
    .padding(20)
    .height('100%')
    .width('100%');
  }
}
