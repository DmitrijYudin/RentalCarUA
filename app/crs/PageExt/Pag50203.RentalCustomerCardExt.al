pageextension 50203 "Rental CustomerCardExt" extends "Customer Card"
{
    Caption = 'Rental Customer Card Ext';

    layout
    {
        addafter(Name)
        {
            field("Rental Cust. Discount"; Rec."Rental Cust. Discount")
            {
                ToolTip = 'Specifies the value of the Car Rental.';
                ApplicationArea = All;
                ShowMandatory = true;
            }
        }
    }
}
