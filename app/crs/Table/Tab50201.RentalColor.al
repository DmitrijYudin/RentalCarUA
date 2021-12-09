table 50201 "Rental Color"
{
    Caption = 'Rental Color';
    LookupPageId = "Rental Color";
    DrillDownPageId = "Rental Color";
    DataClassification = ToBeClassified;

    fields
    {
        field(10; Color; Code[20])
        {
            Caption = 'Color';
            DataClassification = CustomerContent;
        }
        field(20; Discription; Text[250])
        {
            Caption = 'Discription';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Color)
        {
            Clustered = true;
        }
    }

}
