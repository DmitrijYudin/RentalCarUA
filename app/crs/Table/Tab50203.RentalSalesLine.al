table 50203 "Rental Sales Line"
{
    Caption = 'Rental Sales Line ';
    DataClassification = CustomerContent;

    fields
    {
        // field(1; "Document Type"; Text[250])
        // {
        //     Caption = 'Document Type';
        //     DataClassification = ToBeClassified;
        // }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(5; Type; Text[250])
        {
            Caption = 'Type ';
            DataClassification = ToBeClassified;
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No. ';
            DataClassification = ToBeClassified;
        }
        field(10; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
            DataClassification = ToBeClassified;
        }
        field(11; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(22; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
        }
        field(50; "Item Model"; Code[20])
        {
            Caption = 'Item Model';
            DataClassification = ToBeClassified;
        }
        field(51; "Rental Color"; Code[20])
        {
            Caption = 'Rental Color';
            DataClassification = ToBeClassified;
        }
        field(53; "Rental Start Date"; Date)
        {
            Caption = 'Rental Start Date';
            DataClassification = ToBeClassified;
        }
        field(54; "Rental End Date"; Date)
        {
            Caption = 'Rental End Date';
            DataClassification = ToBeClassified;
        }
        field(52; "Rental Duration"; Duration)
        {
            Caption = 'Rental Duration';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

}
