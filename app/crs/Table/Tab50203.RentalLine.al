table 50203 "Rental Line"
{
    Caption = 'Rental Line ';
    DataClassification = CustomerContent;

    fields
    {
        // field(1; "Document Type"; Text[250])
        // {
        //     Caption = 'Document Type';
        //     DataClassification = CustomerContent;
        // }
        // field(5; Type; Enum "Sales Line Type")
        // {
        //     Caption = 'Type';
        //     TableRelation = Item.Type;
        // }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            TableRelation = "Rental Header"."No.";
            Editable = false;
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No. ';
            DataClassification = CustomerContent;
            TableRelation = Item."No.";
            ValidateTableRelation = false;

            //trigger OnValidate()
            trigger OnLookup()
            var
                Item: Record Item;
            //ItemVariant: Record "Item Variant";
            begin
                if "No." <> '' then begin
                    Item.Get(Item."No.");
                    Rec.Validate("Rental Model Line", Item."Rental Model");
                    Rec.Validate("Rental Mileage", item."Rental Mileage");
                    Rec.Validate("Rental Manufacture year", item."Rental Manufacture year");
                    Rec.Validate("Description", item."Description");

                    //ItemVariant.Get(Item."No.");
                    //Rec.Validate("Rental Color", ItemVariant.Code);
                end;

            end;
        }
        field(10; "Rental Model Line"; Code[20])
        {
            Caption = 'Car Model';
            TableRelation = "Item Category".Code;
            //Editable = false;
        }

        field(20; "Rental Color"; Code[20])
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
            TableRelation = "Item Variant".Code;
            //Editable = false;
        }
        field(50220; "Rental Mileage"; Integer)
        {
            Caption = 'Mileage';
            DataClassification = CustomerContent;
            TableRelation = Item."Rental Mileage";
            //Editable = false;
        }
        field(50230; "Rental Manufacture year"; Integer)
        {
            Caption = 'Manufacture year';
            DataClassification = CustomerContent;
            TableRelation = Item."Rental Manufacture year";
            //Editable = false;
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            TableRelation = Item.Description;
            //Editable = false;
        }
        field(15; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(22; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
        field(53; "Rental Start Date"; Date)
        {
            Caption = 'Rental Start Date';
            DataClassification = CustomerContent;
        }
        field(54; "Rental End Date"; Date)
        {
            Caption = 'Rental End Date';
            DataClassification = CustomerContent;
        }
        field(52; "Rental Duration"; Duration)
        {
            Caption = 'Rental Duration';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "No.", "Document No.", Description, "Rental Model Line", "Rental Mileage", "Rental Manufacture year", "Rental Color")
        {
            Clustered = true;
        }
    }

}
