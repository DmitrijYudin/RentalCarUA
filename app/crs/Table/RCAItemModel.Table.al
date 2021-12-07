table 50208 "RCA Item Model"
{
    Caption = 'RCA Item Model';
    DataClassification = ToBeClassified;
    LookupPageId = "RCA Item Model";
    DrillDownPageId = "RCA Item Model";

    fields
    {
        field(10; Model; Code[20])
        {
            Caption = 'Model';
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
        key(PK; Model)
        {
            Clustered = true;
        }
    }

}
