enum PaymentMethodEnum
{
  PAGO_MOVIL(5),
  ZELLE(1),
  TDC_INTERNATIONAL(11),
  TDC_NATIONAL(14);

  final int value;
  const PaymentMethodEnum(this.value);

  bool isAnyTDC() {
    return this == PaymentMethodEnum.TDC_INTERNATIONAL || this == PaymentMethodEnum.TDC_NATIONAL;
  }
}