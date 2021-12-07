table 50201 "RCA Color"
{
    Caption = 'RCA Color';
    LookupPageId = "RCA Color";
    DrillDownPageId = "RCA Color";
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
