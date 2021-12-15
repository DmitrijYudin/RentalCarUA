tableextension 50200 "Rental Item" extends Item
{
    Caption = 'Rental Item';
    fields
    {
        field(50200; "Rental Model"; Code[20])
        {
            Caption = 'Car Model';
            TableRelation = "Item Category";

            trigger OnValidate()
            var
                ItemAttributeManagement: Codeunit "Item Attribute Management";
            begin
                if not IsTemporary then
                    ItemAttributeManagement.InheritAttributesFromItemCategory(Rec, "Item Category Code", xRec."Item Category Code");
                UpdateItemCategoryId();
            end;
        }

        field(50211; "Rental Color"; Code[20])
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
            TableRelation = "Item Variant".Code;
        }
        field(50220; "Rental Mileage"; Integer)
        {
            Caption = 'Mileage';
            DataClassification = CustomerContent;
        }
        field(50230; "Rental Manufacture year"; Integer)
        {
            Caption = 'Manufacture year';
            DataClassification = CustomerContent;
        }
        field(50240; "Rental Item Discount"; Decimal)
        {
            Caption = 'Rental Item Discount %';
            DataClassification = CustomerContent;
            //TableRelation = "Price List Line"."Line Discount %";
            NotBlank = false;
            MinValue = 0;
            MaxValue = 100;
        }
    }
}
