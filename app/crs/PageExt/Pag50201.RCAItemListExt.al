pageextension 50201 "RCA Item List Ext" extends "Item List"
{
    Caption = 'RCA Item List Ext';

    layout
    {
        addafter("No.")
        {
            field("RCA Model"; Rec."RCA Model")
            {
                Visible = true;
                ApplicationArea = all;
            }
            field("RCA Color"; Rec."RCA Color")
            {
                Visible = true;
                ApplicationArea = all;
            }
            field("RCA Mileage"; Rec."RCA Mileage")
            {
                Visible = true;
                ApplicationArea = all;
            }
        }
    }
}