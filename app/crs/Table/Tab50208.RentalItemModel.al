table 50208 "Rental Item Model"
{
    Caption = 'Rental Item Model';
    LookupPageId = "Rental Item Model";
    DrillDownPageId = "Rental Item Model";
    DataClassification = ToBeClassified;

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
