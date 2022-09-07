import 'package:flutter/material.dart';

class SecondBlock extends StatelessWidget {
  const SecondBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1533910534207-90f31029a78e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
              ),
              title: Text('Pink in disguise'),
              subtitle: Text('\$3.55'),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1535568824865-a801351e8483?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
              ),
              title: Text('baked blueberry'),
              subtitle: Text('\$3.55'),
            ),
          ),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1618436784394-f5199d65b8db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
              ),
              title: Text('Glaze party'),
              subtitle: Text('\$3.55'),
            ),
          ),
        ],
      ),
    );
  }
}
