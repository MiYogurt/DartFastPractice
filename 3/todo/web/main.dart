import 'dart:html';
import 'dart:async';

// Model

class Todo {
  num Id; // 唯一标识符
  String Text; // 内容
  bool Deleted = false; // 是否删除
  bool Finished = false; // 是否完成
  Element dom; // 实际 DOM
  Todo(this.Id, this.Text);
}

// Delegate

class TodoDelegate {
  Todo todo;
  TodoDelegate(this.todo);

  onDelete(_) {
    // 硬删
    // 1.删除 List 项目
    // lists.removeWhere((v) => v == todo);
    // 2.删除 DOM
    // todo.dom.remove();
    // 软删
    todo.Deleted = true;
    todo.dom.style.display = "none";
    // update();
  }

  onToggleFinished(_) {
    if (todo.Finished) {
      (todo.dom.childNodes[0] as SpanElement).classes.remove('finished');
    } else {
      (todo.dom.childNodes[0] as SpanElement).classes.add('finished');
    }
    todo.Finished = !todo.Finished;
    // update();
  }

  onEdit(_) {
    editTodo = todo;
    Input.value = todo.Text;
    Tip("编辑中....");
  }
}

// View

DivElement RenderTodo(Todo todo) {
  var todoBox = new DivElement(); // 创建文本节点
  var todoContent = new SpanElement();
  todoBox.id = "todo-item-${todo.Id}"; // 设置 id
  // if(todo.Deleted) TodoBox.classes.add('deleted');
  todo.Deleted && todoContent.classes.add('deleted'); // 跟上面代码实现功能相同
  todo.Finished && todoContent.classes.add('finished'); // 跟上面代码实现功能相同
  todoContent.text = todo.Text; // 设置文本

  var ctrlBox = new SpanElement();
  var editBtn = new ButtonElement()..text = "edit";
  var deleteBtn = new ButtonElement()..text = "delete";

  var delegate = TodoDelegate(todo);

  deleteBtn.onClick.listen(delegate.onDelete);
  editBtn.onClick.listen(delegate.onEdit);

  todoContent.onClick.listen(delegate.onToggleFinished);

  [editBtn, deleteBtn].forEach(ctrlBox.append);
  [todoContent, ctrlBox].forEach(todoBox.append);
  todo.dom = todoBox; // 关联 DOM
  return todoBox;
}

Todo editTodo;

var lists = [Todo(1, "hello world")];

// 显示内容
render(Element App) {
  lists.where((todo) => !todo.Deleted).map(RenderTodo).forEach((node) {
    App.append(node);
  });
}

var invoked = false;

void update() {
  Future.microtask(() {
      if (!invoked) {
        App.innerHtml = '';
        render(App);
        invoked = false;
        return;
      }
      invoked = true;
    });
}

var App = querySelector('#output');
var Label = querySelector('#label');
InputElement Input = querySelector('#input');
var Submit = querySelector('#submit');

Tip(String text) {
  Label.text = text;
}

void main() {
  Tip("欢迎使用");

  Submit.onClick.listen((_) {
    var resetInput = () {
      Input.value = "";
      Tip("欢迎使用");
    };
    if (Input.value.isEmpty) return;
    if (editTodo != null) {
      editTodo.dom.childNodes[0].text = Input.value;
      editTodo.Text = Input.value;
      resetInput();
      // update();
      editTodo = null;
      return;
    }
    var len = lists.length;
    lists.add(Todo(len + 1, Input.value));
    resetInput();
    update();
  });

  render(App);
  //   var renderTodo = (String text) => ("""
  //   <div id="todo-item-1">
  //     <span class="deleted">$text</span>
  //     <span>
  //       <button>edit</button>
  //       <button>delete</button>
  //     </span>
  //   </div>
  // """);
  // App.innerHtml = renderTodo("hello world");
}
