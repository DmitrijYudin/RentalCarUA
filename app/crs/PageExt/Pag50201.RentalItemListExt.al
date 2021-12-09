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
            }
            field("Rental Color"; Rec."Rental Color")
            {
                Visible = true;
                ApplicationArea = all;
            }
            field("Rental Mileage"; Rec."Rental Mileage")
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }
}