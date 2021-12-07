pageextension 50102 "RCA  Item Card Ext" extends "Item Card"
{
    Caption = 'RCA  Item Card Ext';

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
