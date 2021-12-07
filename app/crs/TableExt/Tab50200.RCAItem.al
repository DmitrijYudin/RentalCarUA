tableextension 50200 "RCA Item" extends Item
{
    Caption = 'RCA Item';
    fields
    {
        field(50100; "RCA Model"; Code[20])
        {
            Caption = 'Model';
            DataClassification = CustomerContent;
            TableRelation = "RCA Item Model";
        }
        field(50101; "RCA Color"; Code[20])
        {
            Caption = 'Color';
            DataClassification = CustomerContent;
            TableRelation = "RCA Color";
        }
        field(50102; "RCA Mileage"; Integer)
        {
            Caption = 'Mileage';
            DataClassification = CustomerContent;
        }
    }
}
