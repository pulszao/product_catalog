import 'package:flutter/material.dart';

class BottomSheetModal extends StatefulWidget {
  final String? isOnline;
  final Gradient? backgroundGradient;
  final Color? backgroundColor;
  final List<Widget> body;
  final double maxHeight;
  final double horizontalPadding;
  final double verticalPadding;
  final Widget? bottomWidget;
  final Widget? topWidget;
  final CrossAxisAlignment bodyAlignment;
  final bool displayTopDragElement;

  const BottomSheetModal({
    Key? key,
    this.isOnline,
    this.backgroundGradient,
    this.backgroundColor,
    required this.body,
    required this.maxHeight,
    this.horizontalPadding = 30,
    this.verticalPadding = 30,
    this.bottomWidget,
    this.topWidget,
    this.displayTopDragElement = true,
    this.bodyAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  State<BottomSheetModal> createState() => _BottomSheetModalState();
}

class _BottomSheetModalState extends State<BottomSheetModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      constraints: BoxConstraints(
        maxHeight: widget.maxHeight,
        minHeight: 10,
      ),
      decoration: widget.backgroundColor == null
          ? BoxDecoration(
              gradient: widget.backgroundGradient,
            )
          : BoxDecoration(
              color: widget.backgroundColor,
            ),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: widget.maxHeight,
          minHeight: 10,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding, vertical: widget.verticalPadding),
                child: Column(
                  crossAxisAlignment: widget.bodyAlignment,
                  mainAxisSize: MainAxisSize.min,
                  children: widget.body,
                ),
              ),
            ),
            widget.topWidget != null
                ? Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      constraints: BoxConstraints(
                        maxHeight: widget.maxHeight,
                        minHeight: 10,
                      ),
                      child: widget.topWidget,
                    ),
                  )
                : const SizedBox(),
            widget.bottomWidget != null
                ? Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: widget.maxHeight,
                        minHeight: 10,
                      ),
                      child: widget.bottomWidget,
                    ),
                  )
                : const SizedBox(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 20,
              decoration: widget.backgroundColor == null
                  ? BoxDecoration(
                      gradient: widget.backgroundGradient,
                    )
                  : BoxDecoration(
                      color: widget.backgroundColor,
                    ),
              child: Container(
                height: 20,
                constraints: BoxConstraints(
                  maxHeight: widget.maxHeight,
                  minHeight: 10,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.displayTopDragElement)
                      Container(
                        height: 6,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: const BorderRadius.all(Radius.circular(23.0)),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
