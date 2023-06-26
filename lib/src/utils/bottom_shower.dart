import 'package:flutter/material.dart';

import '../domain/model/affiliate_model.dart';
import '../ui/widgets/custom_bottom_sheet.dart';

Future<void> openBottomSheet(BuildContext context, Affiliate affiliate) {
    return showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        context: context,
        builder: (context) => CustomBottomSheet(
              affiliate: affiliate,
            ));
  }