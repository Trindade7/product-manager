import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_manager/ui/products/product_details/cubit/product_cubit.dart';
import 'package:product_manager/ui/styles.dart';
import 'package:product_manager/ui/theme.dart';
import 'package:product_manager/ui/widgets/separator_box.dart';
import 'package:formz/formz.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Editar',
          style: TextStyles.h3,
        ),
        //Nome
        _NameInput(),
        SeparatorBox.medium(),
        // Código e Preço
        Row(
          children: [
            Expanded(child: _CodeInput()),
            SeparatorBox.small(),
            Expanded(child: _PriceInput()),
          ],
        ),
        SeparatorBox.small(),
        // Quantidade e unidade
        Row(
          children: [
            Expanded(child: _QuantityInput()),
            SeparatorBox.small(),
            Expanded(child: _QuantityUnitInput()),
          ],
        ),
        SeparatorBox.xLarge(),
        // Salvar
        _SaveButton()
      ],
    );
  }
}

class _NameInput extends _GenericInputField {
  _NameInput()
      : super(
          key: const Key('loginForm_nameInput_textField'),
          buildWhen: (previous, current) => previous.name != current.name,
          onChanged: (name, context) =>
              context.read<ProductCubit>().nameChanged(name),
          hintText: "Nome...",
          errorText: (state) => state.name.invalid
              ? 'Pelo menos 2 carácteres e no máximo 100'
              : null,
          maxLines: 3,
          minLines: 1,
          maxLength: 200,
        );
}

class _CodeInput extends _GenericInputField {
  _CodeInput()
      : super(
          key: const Key('loginForm_codeInput_textField'),
          buildWhen: (previous, current) => previous.code != current.code,
          onChanged: (code, context) =>
              context.read<ProductCubit>().codeChanged(code),
          hintText: "Código...",
          errorText: (state) => state.code.invalid
              ? 'Pelo menos 2 carácteres e no máximo 50'
              : null,
        );
}

class _PriceInput extends _GenericInputField {
  _PriceInput()
      : super(
          key: const Key('loginForm_pricecodeInput_textField'),
          buildWhen: (previous, current) => previous.price != current.price,
          onChanged: (price, context) => context
              .read<ProductCubit>()
              .priceChanged(double.tryParse(price) ?? -1),
          hintText: "Preço...",
          errorText: (state) => state.code.invalid
              ? 'Valor tem que ser  entre 0 e 10000000000'
              : null,
        );
}

class _QuantityInput extends _GenericInputField {
  _QuantityInput()
      : super(
          key: const Key('loginForm_quantityInput_textField'),
          buildWhen: (previous, current) =>
              previous.quantity != current.quantity,
          onChanged: (quantity, context) => context
              .read<ProductCubit>()
              .quantityChanged(double.tryParse(quantity) ?? -1),
          hintText: "Quantidade do stock...",
          errorText: (state) =>
              state.code.invalid ? 'Valor tem que ser  entre 0 e 100000' : null,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
        );
}

class _QuantityUnitInput extends _GenericInputField {
  _QuantityUnitInput()
      : super(
          key: const Key('loginForm_quantityUnitInput_textField'),
          buildWhen: (previous, current) =>
              previous.quantityUnit != current.quantityUnit,
          onChanged: (quantityUnit, context) =>
              context.read<ProductCubit>().quantityUnitChanged(quantityUnit),
          hintText: "Unidade de quantidade...",
          errorText: (state) => state.code.invalid
              ? 'Pelo menos 2 carácteres e no máximo 5'
              : null,
        );
}

/// Widget genêrico para facilitar a criação de inputs
class _GenericInputField extends StatelessWidget {
  const _GenericInputField({
    required Key key,
    required this.buildWhen,
    required this.onChanged,
    required this.hintText,
    required this.errorText,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength = 100,
    this.inputFormatters,
  }) : super(key: key);

  final bool Function(ProductState previous, ProductState current) buildWhen;
  final void Function(String, BuildContext) onChanged;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(ProductState state) errorText;
  final int maxLines;
  final int minLines;
  final int maxLength;
  @override
  Widget build(BuildContext context) {
    //? TODO: generlizar ainda mais para vários tipos de states?
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: buildWhen,
      builder: (context, state) {
        return TextField(
          key: key,
          onChanged: (val) => onChanged(val, context),
          enabled: !state.status.isSubmissionInProgress,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: hintText,
            errorText: errorText(state),
            border: OutlineInputBorder(
              borderRadius: Corners.smBorder,
            ),
            contentPadding: EdgeInsets.all(Insets.sm),
            isDense: true,
          ),
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
        );
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return TextButton(
          onPressed: state.status.isValid
              ? () => context.read<ProductCubit>().saveProduct()
              : null,
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: Corners.mdBorder,
            ),
          ),
          child: !state.status.isSubmissionInProgress
              ? Text(
                  'Salvar',
                  style: TextStyles.title1.copyWith(
                    color: state.status.isValid ? Colors.white : Colors.white54,
                  ),
                )
              : CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
        );
      },
    );
  }
}
