table 50203 "Rental Line"
{
    Caption = 'Rental Line ';
    DataClassification = CustomerContent;

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
            TableRelation = Item."No.";
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
                end;
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
        // field(29; Amount; Decimal)
        // {
        //     AutoFormatType = 1;
        //     Caption = 'Amount';
        //     Editable = false;

        //     trigger OnValidate()
        //     begin
        //         Amount := Round(Amount, Currency."Amount Rounding Precision");
        //         case "VAT Calculation Type" of
        //             "VAT Calculation Type"::"Normal VAT",
        //             "VAT Calculation Type"::"Reverse Charge VAT":
        //                 begin
        //                     "VAT Base Amount" :=
        //                       Round(Amount * (1 - SalesHeader."VAT Base Discount %" / 100), Currency."Amount Rounding Precision");
        //                     "Amount Including VAT" :=
        //                       Round(Amount + "VAT Base Amount" * "VAT %" / 100, Currency."Amount Rounding Precision");
        //                 end;
        //             "VAT Calculation Type"::"Full VAT":
        //                 if Amount <> 0 then
        //                     FieldError(Amount,
        //                       StrSubstNo(
        //                         Text009, FieldCaption("VAT Calculation Type"),
        //                         "VAT Calculation Type"));
        //             "VAT Calculation Type"::"Sales Tax":
        //                 begin
        //                     SalesHeader.TestField("VAT Base Discount %", 0);
        //                     "VAT Base Amount" := Round(Amount, Currency."Amount Rounding Precision");
        //                     "Amount Including VAT" :=
        //                       Amount +
        //                       SalesTaxCalculate.CalculateTax(
        //                         "Tax Area Code", "Tax Group Code", "Tax Liable", SalesHeader."Posting Date",
        //                         "VAT Base Amount", "Quantity (Base)", SalesHeader."Currency Factor");
        //                     OnAfterSalesTaxCalculate(Rec, SalesHeader, Currency);
        //                     UpdateVATPercent("VAT Base Amount", "Amount Including VAT" - "VAT Base Amount");
        //                     "Amount Including VAT" := Round("Amount Including VAT", Currency."Amount Rounding Precision");
        //                 end;
        //         end;

        //         InitOutstandingAmount();
        //     end;
        // }
        field(53; "Rental Start Date"; Date)
        {
            Caption = 'Rental Start Date';
            DataClassification = CustomerContent;
            //NotBlank = false;

            trigger OnValidate()
            begin
                CheckDate();
                CalcDuration();
                CalcLineAmount();
            end;
        }
        field(54; "Rental End Date"; Date)
        {
            Caption = 'Rental End Date';
            DataClassification = CustomerContent;
            //NotBlank = false;

            trigger OnValidate()
            begin
                CheckDate();
                CalcDuration();
                CalcLineAmount();
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

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    local procedure CheckDate()
    var
        CheckDateErr: Label '"Rental End Date" must be > "Rental Start Date". "Rental End Date" will be set to "0"', Comment = '1%="Rental Start Date" 2%="Rental End Date"';
    begin
        if (Rec."Rental Start Date" <> 0D) and (Rec."Rental End Date" <> 0D) then
            if Rec."Rental End Date" < Rec."Rental Start Date" then begin
                Message(CheckDateErr);
                Rec."Rental End Date" := 0D;
            end;
    end;

    local procedure CalcDuration()
    begin
        if (Rec."Rental Start Date" = 0D)
           or (Rec."Rental End Date" = 0D)
        then
            "Rental Duration" := 0
        else
            "Rental Duration" := Rec."Rental End Date" - Rec."Rental Start Date";
        if rec."Rental End Date" = rec."Rental Start Date" then
            "Rental Duration" := 1;
    end;

    local procedure CalcLineAmount()
    begin
        "Line Amount" := "Rental Duration" * "Unit Price";
    end;
}
