tableextension 50200 "Rental Item" extends Item
{
    Caption = 'Rental Item';
    fields
    {
        field(50200; "Rental Model"; Code[20])
        {
            Caption = 'Rental Model';
            DataClassification = CustomerContent;
            TableRelation = "Rental Item Model";
        }
        field(50201; "Rental Color"; Code[20])
        {
            Caption = 'Rental Color';
            DataClassification = CustomerContent;
            TableRelation = "Rental Color";
        }
        field(50202; "Rental Mileage"; Integer)
        {
            Caption = 'Rental Mileage';
            DataClassification = CustomerContent;
        }
    }
}
