import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro/features/product_features/logic/product_bloc.dart';
import 'package:pro/features/product_features/services/product_repository.dart';
import 'package:pro/features/public_features/widget/error_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});
  static const screenId = '/product_detail_screen';
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(arguments['product_id']);
    return Scaffold(
      appBar:  AppBar(backgroundColor: theme.appBarTheme.backgroundColor ,),
      body: BlocProvider(
        create: (context) => ProductBloc(ProductRepository())
          ..add(CallProductEvent(arguments['product_id'].toString())),
        child: BlocConsumer<ProductBloc, ProductState>(
          builder: (context, state) {
            if(state is ProductLoadingState)
            {
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is ProductCompletedState)
            {
              final helper=state.productModel.product!;
              return SingleChildScrollView
                (
                child: Column
                  (
                  children: [
                    Text(helper.title!),
                    Text(helper.productBody!),
                  ],
                ),
              );
            }
            if(state is ProductErrorState)
            {
              return ErrorScreenWidget(errorMsg: state.errormassage.errorMsg!,
                  function: ()
              {
                BlocProvider.of<ProductBloc>(context).add(CallProductEvent(arguments['product_id'].toString()));
              });
            }
            return SizedBox.shrink();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
