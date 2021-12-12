table 50202 "Rental Sales Header"
{
    Caption = 'Rental Sales Header ';
    DataClassification = ToBeClassified;

    fields
    {
        // field(1; "Document Type"; Text[150])
        // {
        //     Caption = 'Document Type';
        //     DataClassification = CustomerContent;
        // }
        field(2; "Sell-to Customer No."; Code[20])
        {
            Caption = 'Sell-to Customer No.';
            DataClassification = CustomerContent;
        }
        field(3; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(4; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
        }
        field(5; "Bill-to Name"; Text[250])
        {
            Caption = 'Bill-to Name';
            DataClassification = ToBeClassified;
        }
        field(7; "Bill-to Address"; Text[250])
        {
            Caption = 'Bill-to Address';
            DataClassification = CustomerContent;
        }
        field(19; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = ToBeClassified;
        }
        field(20; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(43; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
        }
        field(15; "Ship-to Address"; Text[250])
        {
            Caption = 'Ship-to Address';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

}
