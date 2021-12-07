table 50108 "RCA Item Model"
{
    Caption = 'RCA Item Model';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Model; Code[20])
        {
            Caption = 'Model';
            DataClassification = CustomerContent;
        }
        field(3; Discription; Text[250])
        {
            Caption = 'Discription';
            DataClassification = CustomerContent;
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
