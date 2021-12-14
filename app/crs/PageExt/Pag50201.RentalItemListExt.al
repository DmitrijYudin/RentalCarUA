pageextension 50201 "Rental Item List Ext" extends "Item List"
{
    Caption = 'Rental Item List Ext';

    layout
    {
        addafter("No.")
        {

            field("Rental Model"; Rec."Rental Model")
            {
                ToolTip = 'Specifies the value of the Car Model field.';
                ApplicationArea = All;
            }
            field("Rental Color"; Rec."Rental Color")
            {
                ToolTip = 'Specifies the value of the Color field.';
                ApplicationArea = All;
            }
            field("Rental Mileage"; Rec."Rental Mileage")
            {
                ToolTip = 'Specifies the value of the Mileage field.';
                ApplicationArea = All;
            }
            field("Rental Manufacture year"; Rec."Rental Manufacture year")
            {
                ToolTip = 'Specifies the value of the Manufacture year field.';
                ApplicationArea = All;
            }
            field("Rental Item Discount"; Rec."Rental Item Discount")
            {
                ToolTip = 'Specifies the value of the Rental Item Discount % field.';
                ApplicationArea = All;
                ShowMandatory = true;
            }
        }
    }
}