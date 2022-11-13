import 'package:ecommercefrontend/constants/controllers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class HtmlTextEditorWidget extends StatefulWidget {
  final controller;
  const HtmlTextEditorWidget({Key? key,required this.controller}) : super(key: key);

  @override
  State<HtmlTextEditorWidget> createState() => _HtmlTextEditorWidgetState();
}

class _HtmlTextEditorWidgetState extends State<HtmlTextEditorWidget> {
  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
      controller: widget.controller,
      htmlEditorOptions:  HtmlEditorOptions(
        hint: 'Product Description Here...',
        shouldEnsureVisible: true,
        autoAdjustHeight: true,
        initialText: productController.newProduct.value.description??'',
      ),
      callbacks: Callbacks(
          onChangeContent: (String? changed) {
            // postController.createPost.value.content = changed;
            productController.newProduct.value.description = changed;
          },
          onFocus:(){
            // _focusEditor.value = true;
          }
      ),
      htmlToolbarOptions: HtmlToolbarOptions(
        toolbarPosition: ToolbarPosition.aboveEditor, //by default
        toolbarType: ToolbarType.nativeScrollable, //by default
        // onButtonPressed:
        //     (ButtonType type, bool? status, Function? updateStatus) {
        //   print(
        //       "button ${describeEnum(type)} pressed, the current selected status is $status");
        //   return true;
        // },
        // onDropdownChanged: (DropdownType type, dynamic changed,
        //     Function(dynamic)? updateSelectedItem) {
        //   print(
        //       "dropdown '${describeEnum(type)}' changed to $changed");
        //   return true;
        // },
        // mediaLinkInsertInterceptor:
        //     (String url, InsertFileType type) {
        //   print(url);
        //   return true;
        // },

      ),
      otherOptions: OtherOptions(height: overallController.screenHeight.value * 0.3 - 30),
      plugins: [
        SummernoteAtMention(
            getSuggestionsMobile: (String value) {
              var mentions = <String>['test1', 'test2', 'test3'];
              return mentions
                  .where((element) => element.contains(value))
                  .toList();
            },
            mentionsWeb: ['test1', 'test2', 'test3'],
            onSelect: (String value) {
              print(value);
            }),
      ],
    );
  }
}
