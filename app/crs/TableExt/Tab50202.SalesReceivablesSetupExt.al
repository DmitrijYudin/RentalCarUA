tableextension 50202 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50200; "Rental No."; Code[20])
        {
            Caption = 'Rental No.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
}
