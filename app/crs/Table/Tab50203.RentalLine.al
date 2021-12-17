table 50203 "Rental Line"
{
    Caption = 'Rental Line ';
    DataClassification = CustomerContent;
    //LookupPageId = "Rental Line";
    //DrillDownPageId = "Rental Line";

    fields
    {
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            TableRelation = "Rental Header"."No.";
            Editable = false;
        }
        field(4; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }
        field(6; "No."; Code[20])
        {
            Caption = 'No. ';
            DataClassification = CustomerContent;
            TableRelation = Item."No." where("Rental Visible" = const(true));
            Editable = true;

            //ValidateTableRelation = false;

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                if "No." <> '' then begin
                    Item.Get(Rec."No.");
                    Rec.Validate("Rental Model Line", Item."Rental Model");
                    Rec.Validate("Rental Color", item."Rental Color");
                    Rec.Validate("Rental Mileage", item."Rental Mileage");
                    Rec.Validate("Rental Manufacture year", item."Rental Manufacture year");
                    Rec.Validate("Description", item."Description");
                    Rec.Validate("Unit Price", item."Unit Price");
                    Rec.Validate("Item Discount", item."Rental Item Discount");
                end;
                SetDiscount();
            end;

        }
        field(10; "Rental Model Line"; Code[20])
        {
            Caption = 'Car Model';
            TableRelation = "Item Category".Code;
            Editable = false;
        }

        field(20; "Rental Color"; Code[20])
        {
            Caption = 'Car Color';
            DataClassification = CustomerContent;
            TableRelation = "Item Variant".Code;
            Editable = false;
        }
        field(50220; "Rental Mileage"; Integer)
        {
            Caption = 'Mileage';
            DataClassification = CustomerContent;
            TableRelation = Item."Rental Mileage";
            Editable = false;
        }
        field(50230; "Rental Manufacture year"; Integer)
        {
            Caption = 'Manufacture year';
            DataClassification = CustomerContent;
            TableRelation = Item."Rental Manufacture year";
            Editable = false;
        }
        field(11; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
            TableRelation = Item.Description;
            Editable = false;
        }
        field(22; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(53; "Rental Start Date"; Date)
        {
            Caption = 'Rental Start Date';
            DataClassification = CustomerContent;
            NotBlank = false;

            trigger OnValidate()
            begin
                CheckItemAvailableStartDate();
                CheckDate();
                CalcDuration();
                CalcLineAmount();
                ItemDiscAmount();
                LineCost();
            end;
        }
        field(54; "Rental End Date"; Date)
        {
            Caption = 'Rental End Date';
            DataClassification = CustomerContent;
            NotBlank = false;

            trigger OnValidate()
            begin
                //CheckItemAvailableEndDate();
                CheckDate();
                CalcDuration();
                CalcLineAmount();
                ItemDiscAmount();
                LineCost();
            end;
        }
        field(52; "Rental Duration"; Integer)
        {
            Caption = 'Rental Duration. Days';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(103; "Line Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Amount';
        }
        field(104; "Item Discount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Item Discount %';
            TableRelation = Item."Rental Item Discount";
            Editable = false;
        }
        field(220; "Rental Cust. Discount"; Decimal)
        {
            Caption = 'Rental Cust. Discount %';
            FieldClass = FlowField;
            CalcFormula = lookup("Rental Header"."Rental Cust. Discount" where("No." = field("Document No.")));
            Editable = false;
        }
        field(222; "Line Discount Amount"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Line Discount Amount';
            Editable = false;
        }
        field(225; "Applied Discount"; Decimal)
        {
            Caption = 'Applied Discount %';
            Editable = false;
        }
        field(230; "Line Cost"; Decimal)
        {
            Caption = 'Line Cost';
            Editable = false;
        }
        field(250; "Total Lines Qty."; Integer)
        {
            Caption = 'Total Lines Qty.';
            FieldClass = FlowField;
            CalcFormula = count("Rental Line" where("Document No." = field("Document No.")));
            Editable = false;
        }
        field(260; "Total Lines Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Rental Line"."Line Amount" where("Document No." = field("Document No.")));
            Caption = 'Total Lines Amount';
            Editable = false;
        }
        field(270; "Total Lines Discount Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Rental Line"."Line Discount Amount" where("Document No." = field("Document No.")));
            Caption = 'Total Lines Discount Amount';
            Editable = false;
        }
        field(280; "Total Order Cost"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Rental Line"."Line Cost" where("Document No." = field("Document No.")));
            Caption = 'Total Order Cost';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
        key(key2; "Line Amount")
        {
            SumIndexFields = "Line Amount";
        }
    }

    local procedure CheckDate()
    var
        CheckDateErr: Label '"Rental End Date" must be > "Rental Start Date". \All dates will be set to "0"', Comment = '1%="Rental Start Date" 2%="Rental End Date"';
    begin
        if (Rec."Rental Start Date" <> 0D) and (Rec."Rental End Date" <> 0D) then
            if Rec."Rental End Date" < Rec."Rental Start Date" then begin
                Message(CheckDateErr);
                Rec."Rental End Date" := 0D;
                Rec."Rental Start Date" := 0D;
                CalcDuration();
                CalcLineAmount();
                ItemDiscAmount();
                LineCost();
            end;
    end;

    local procedure CalcDuration()
    begin
        if (Rec."Rental Start Date" = 0D)
           or (Rec."Rental End Date" = 0D)
        then
            "Rental Duration" := 0
        else
            "Rental Duration" := Rec."Rental End Date" - Rec."Rental Start Date" + 1;
        if rec."Rental End Date" = rec."Rental Start Date" then
            "Rental Duration" := 1;
    end;

    local procedure CalcLineAmount()
    begin
        "Line Amount" := "Rental Duration" * "Unit Price";
    end;

    local procedure SetDiscount()
    begin
        Rec."Applied Discount" := Rec."Item Discount";
        if Rec."Item Discount" < Rec."Rental Cust. Discount" then
            Rec."Applied Discount" := Rec."Rental Cust. Discount"
    end;

    local procedure ItemDiscAmount()
    begin
        "Line Discount Amount" := "Line Amount" * "Applied Discount" / 100;
    end;

    local procedure LineCost()
    begin
        "Line Cost" := "Line Amount" - "Line Discount Amount";
    end;

    local procedure CheckItemAvailableStartDate()
    var
        RentalLine: Record "Rental Line";
        StartDateErr: Text;
    begin
        RentalLine.SetRange("No.", Rec."No.");
        RentalLine.SetFilter("Rental Start Date", '<=%1', Rec."Rental Start Date");
        RentalLine.SetFilter("Rental end Date", '>=%1', Rec."Rental Start Date");
        if RentalLine.FindSet() then begin
            repeat
                StartDateErr := 'Start Date Error:\Item :' + Format(RentalLine."No.") + ' Document No.:' + Format(RentalLine."Document No.") + ' Line No.:' + Format(RentalLine."Line No.") + 'Period:' + Format(RentalLine."Rental Start Date") + '...' + Format(RentalLine."Rental End Date");
                Message(StartDateErr);
            until RentalLine.Next() = 0;
            Rec."Rental Start Date" := 0D;
            Rec."Rental End Date" := 0D;
        end;
        //Reset();
    end;

}
