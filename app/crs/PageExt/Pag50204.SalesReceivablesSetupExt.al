pageextension 50204 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Number Series")
        {

            field("Rental No."; Rec."Rental No.")
            {
                ToolTip = 'Specifies the value of the Rental No. field.';
                ApplicationArea = All;
            }
        }
    }
}
