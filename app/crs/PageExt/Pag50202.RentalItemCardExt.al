pageextension 50202 "Rental Item Card Ext" extends "Item Card"
{
    Caption = 'Rental Item Card Ext';

    layout
    {
        addafter("No.")
        {
            field("Rental Model"; Rec."Rental Model")
            {
                Visible = true;
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Rental Model field.';
            }
            field("Rental Color"; Rec."Rental Color")
            {
                Visible = true;
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Rental Color field.';
            }
            field("Rental Mileage"; Rec."Rental Mileage")
            {
                Visible = true;
                ApplicationArea = all;
                ToolTip = 'Specifies the value of the Rental Mileage field.';
            }
        }
    }

}
