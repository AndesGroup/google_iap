import 'package:andesgroup_common/common.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iap_interface/iap_interface.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:url_launcher/url_launcher.dart';

import 'iap_google_providers.dart';
import 'iap_google_state.dart';

class BuyScreen extends ConsumerStatefulWidget {
  const BuyScreen({
    this.title = 'Buy options',
    this.showAppbar = true,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool showAppbar;

  @override
  ConsumerState createState() => _BuyScreenState();
}

class _BuyScreenState extends ConsumerState<BuyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(iapProvider.notifier).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<IapGooglePurchaseResult?>(iapGoogleProvider.select((value) => value.purchaseResult),
        (previous, next) {
      if (next != null) {
        if (next.status == PurchaseStatus.pending) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Purchase is pending')));
        } else if (next.status == PurchaseStatus.purchased ||
            next.status == PurchaseStatus.restored) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Purchase successfully')));
        } else if (next.status == PurchaseStatus.error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Purchase is error. ${next.error?.message}')));
        } else if (next.status == PurchaseStatus.canceled) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Purchase is canceled')));
        }
      }
    });
    return Scaffold(
      appBar: widget.showAppbar
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final products = ref.watch(iapGoogleProvider.select((value) => value.iapItems));

                  return products.when(data: (data) {
                    if (data.isEmpty) {
                      return const Center(
                        child: Text('Buy options cannot be loaded at this time.'),
                      );
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: data.length,
                      separatorBuilder: (context, index) {
                        return const Gap(16);
                      },
                      itemBuilder: (context, index) {
                        final i = data[index];
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Theme.of(context).primaryColor)),
                          child: ListTile(
                            onTap: () {
                              ref.read(iapProvider.notifier).makePurchase(i.id);
                            },
                            title: Text(i.title),
                            subtitle: Text(i.description),
                            trailing: Text(
                              i.price,
                              style:
                                  TextStyles.t16SB.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                        );
                      },
                    );
                  }, error: (e, s) {
                    return Center(
                      child: Text('Error: $e'),
                    );
                  }, loading: () {
                    return const LoadingWidget();
                  });
                },
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final mustShowNoteSubs =
                    ref.watch(iapProvider.select((value) => value.mustShowNoteSubscription));
                if (mustShowNoteSubs) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyles.t14R.copyWith(color: Colors.black),
                          text:
                              'If you purchase a subscription, it will be automatically renewed when it\'s due. You can cancel renewal at any time in the ',
                          children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    if (!await launchUrl(Uri.parse(
                                        'https://play.google.com/store/account/subscriptions'))) {}
                                  },
                                text: 'subscriptions center',
                                style: TextStyles.t14M.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                )),
                            const TextSpan(text: '.')
                          ]),
                    ),
                  );
                }
                return const Gap(0);
              },
            )
          ],
        ),
      ),
    );
  }
}
