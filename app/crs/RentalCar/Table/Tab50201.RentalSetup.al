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
        field(10; "Post. Jnl. Template Name"; Code[10])
        {
            Caption = 'Leasing Postings Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(20; "Post. Jnl. Batch Name"; Code[10])
        {
            Caption = 'Postings Journal Template Name';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Post. Jnl. Template Name"));
        }
        field(30; "Gross Receivable"; Code[20])
        {
            TableRelation = "G/L Account" where("Direct Posting" = const(true));
            Caption = 'Gross Receivable';
        }
        field(40; "Interest Account"; Code[20])
        {
            TableRelation = "G/L Account" where("Direct Posting" = const(true));
            Caption = 'Interest Account';
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
