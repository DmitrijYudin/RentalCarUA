tableextension 50201 "Rental CustomerExt" extends Customer
{
    fields
    {
        field(50200; "Rental Cust. Discount"; Decimal)
        {
            Caption = 'Cust. Discount %';
            DataClassification = CustomerContent;
            NotBlank = false;
            MinValue = 0;
            MaxValue = 100;
        }
    }
}
