import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'data/dragable_list_data.dart';
import 'models/dragable_list.dart';

class KanbanBoard extends StatefulWidget {
  const KanbanBoard({Key? key}) : super(key: key);

  @override
  _KanbanBoard createState() => _KanbanBoard();
}

class _KanbanBoard extends State<KanbanBoard> {
  late List<DragAndDropList> _teamlists;

  @override
  void initState() {
    super.initState();
    _teamlists = allLists.map(buildList).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban Borad'),
      ),
      body: DragAndDropLists(
        children: _teamlists,
        onItemReorder: _onItemReorder,
        onListReorder: _onListReorder,
        axis: Axis.horizontal,
        listWidth: 320,
        listDraggingWidth: 320,
        listDecoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 3.0,
              blurRadius: 6.0,
              offset: Offset(2, 3),
            ),
          ],
        ),
        listPadding: const EdgeInsets.all(10.0),
        listDragHandle: buildDragHandle(isList: true),
        itemDragHandle: buildDragHandle(),
      ),
    );
  }

  _onItemReorder(
      int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
    setState(() {
      var movedItem = _teamlists[oldListIndex].children.removeAt(oldItemIndex);
      _teamlists[newListIndex].children.insert(newItemIndex, movedItem);
    });
  }

  _onListReorder(int oldListIndex, int newListIndex) {
    setState(() {
      var movedList = _teamlists.removeAt(oldListIndex);
      _teamlists.insert(newListIndex, movedList);
    });
  }

  DragHandle buildDragHandle({bool isList = false}) {
    final verticalAlignment = isList
        ? DragHandleVerticalAlignment.top
        : DragHandleVerticalAlignment.center;
    final color = isList ? Colors.blueGrey : Colors.black26;

    return DragHandle(
      verticalAlignment: verticalAlignment,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Icon(Icons.menu, color: color),
      ),
    );
  }

  DragAndDropList buildList(DraggableList list) => DragAndDropList(
        header: Card(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              list.header,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        children: list.items
            .map((item) => DragAndDropItem(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 132, 167, 216),
                            image: DecorationImage(
                              image: NetworkImage(item.urlImage),
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(60.0)),
                            border: Border.all(
                              color: const Color.fromARGB(255, 253, 87, 75),
                              width: 4.0,
                            ),
                          ),
                        ),
                        title: Text(item.name),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.expert),
                            Text(item.email),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      );

  void onReorderListItem(
    int oldItemIndex,
    int oldListIndex,
    int newItemIndex,
    int newListIndex,
  ) {
    setState(() {
      final oldListItems = _teamlists[oldListIndex].children;
      final newListItems = _teamlists[newListIndex].children;

      final movedItem = oldListItems.removeAt(oldItemIndex);
      newListItems.insert(newItemIndex, movedItem);
    });
  }

  void onReorderList(
    int oldListIndex,
    int newListIndex,
  ) {
    setState(() {
      final movedList = _teamlists.removeAt(oldListIndex);
      _teamlists.insert(newListIndex, movedList);
    });
  }
}
