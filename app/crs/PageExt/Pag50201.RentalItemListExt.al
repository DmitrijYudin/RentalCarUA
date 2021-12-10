pageextension 50201 "Rental Item List Ext" extends "Item List"
{
    Caption = 'Rental Item List Ext';

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