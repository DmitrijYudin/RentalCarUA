table 50201 "Rental Setup"
{
    Caption = 'Rental Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Rental Nos."; Code[20])
        {
            Caption = 'Rental Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
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
