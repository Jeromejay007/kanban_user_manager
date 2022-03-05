import 'package:kanban_user_manager/models/dragable_list.dart';

List<DraggableList> allLists = [
  DraggableList(
    header: 'Graphics Team',
    items: [
      DraggableListItem(
        name: 'Jay',
        urlImage: 'https://i.pravatar.cc/150?img=2',
        email: 'jeromejay007@gmail.com',
        expert: 'illustrator',
      ),
      DraggableListItem(
        name: 'Karthi',
        urlImage: 'https://i.pravatar.cc/150?img=51',
        email: 'karthi@gmail.com',
        expert: 'Designer',
      ),
      DraggableListItem(
        name: 'Ajay',
        urlImage: 'https://i.pravatar.cc/150?img=13',
        email: 'Ajay@gmail.com',
        expert: 'art director',
      ),
    ],
  ),
  DraggableList(
    header: 'Vfx Team',
    items: [
      DraggableListItem(
        name: 'Vijay',
        urlImage: 'https://i.pravatar.cc/150?img=12',
        email: 'vijay@gmail.com',
        expert: 'Animator',
      ),
      DraggableListItem(
        name: 'Ajith',
        urlImage: 'https://i.pravatar.cc/150?img=8',
        email: 'ajith@gmail.com',
        expert: '3D Artist',
      ),
      DraggableListItem(
        name: 'Krishna',
        urlImage: 'https://i.pravatar.cc/150?img=4',
        email: '@gmail.com',
        expert: 'Vfx Artist',
      ),
    ],
  ),
  DraggableList(
    header: 'Tele Callers',
    items: [
      DraggableListItem(
        name: 'Kayal',
        urlImage: 'https://i.pravatar.cc/150?img=1',
        email: 'Kayal@gmail.com',
        expert: 'Telecaller',
      ),
      DraggableListItem(
        name: 'Kavi',
        urlImage: 'https://i.pravatar.cc/150?img=5',
        email: 'kavi@gmail.com',
        expert: 'Telecaller',
      ),
      DraggableListItem(
        name: 'Rani',
        urlImage: 'https://i.pravatar.cc/150?img=20',
        email: 'rani@gmail.com',
        expert: 'Telecaller',
      ),
    ],
  ),
];
