import 'package:know_go/imports/app_imports.dart';

alert({
  required BuildContext context,
  required String subTitle,
  void Function()? onPressed,
}) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        surfaceTintColor: AppColors.appWhite,
        backgroundColor: AppColors.appWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(14),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Column(
                    crossAxisAlignment:
                        subTitle.isNotEmpty
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Confirm!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.appBlack,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Visibility(
                        visible: subTitle.isNotEmpty,
                        child: Text(
                          subTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.appBlack,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AppButton(
                              title: 'Yes',
                              onPressed: () {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop('dialog');
                                onPressed!();
                              },
                              color: AppColors.appGray,
                              borderColor: AppColors.appGray,
                              textColor: AppColors.appBlack,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AppButton(
                              title: 'No',
                              borderColor: AppColors.appBlack,
                              onPressed: () {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop('dialog');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.clear,
                      size: 16,
                      color: AppColors.appBlack,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
