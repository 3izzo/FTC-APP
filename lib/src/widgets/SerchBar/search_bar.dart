import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  SearchBar({
    Key key,
    @required this.onCancelSearch,
    @required this.onSearchQueryChanged,
  }) : super(key: key);

  final VoidCallback onCancelSearch;
  final Function(String) onSearchQueryChanged;

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  String searchQuery = '';
  TextEditingController _searchFieldController = TextEditingController();

  clearSearchQuery() {
    _searchFieldController.clear();
    widget.onSearchQueryChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        top: true,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: widget.onCancelSearch,
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _searchFieldController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: "اكتب اسم العضو",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: InkWell(
                    child: Icon(Icons.close, color: Colors.white),
                    onTap: clearSearchQuery,
                  ),
                ),
                onChanged: widget.onSearchQueryChanged,
              ),
            )
          ],
        ),
      ),
    );
  }
}
