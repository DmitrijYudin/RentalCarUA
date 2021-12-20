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
                RentalHeader: Record "Rental Header";
                Customer: Record Customer;
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

                    // RentalHeader.Get(Rec."No.");
                    // Rec.Validate("Customer No.", RentalHeader."Customer No.");
                    Customer.Get(Rec."No.");
                    Rec.Validate("Customer No.", Customer."No.");
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
                CheckItemSet();
                CheckDate();
                CheckItemAvailableStartDate();
                CheckServiceDayStartDate();
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
                CheckItemSet();
                CheckDate();
                CheckItemAvailableEndDate();
                CalcDuration();
                CalcLineAmount();
                ItemDiscAmount();
                LineCost();
                ServiceDay()
            end;
        }
        field(52; "Rental Duration"; Integer)
        {
            Caption = 'Rental Duration. Days';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(60; "Rental Service Day"; Date)
        {
            Caption = 'Service Day';
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
        field(290; "Customer No."; code[20])
        {
            Caption = 'Customer No.';
            Editable = false;
            TableRelation = "Rental Header"."Customer No." where("No." = field("Document No."));
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
        key(key3; "No.", "Rental Service Day")
        {
            //SumIndexFields = "Line Amount";
        }

    }
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

    local procedure ServiceDay()
    begin
        Rec."Rental Service Day" := Rec."Rental End Date" + 1;
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

    //----------------  errors input checking -------------------
    local procedure CheckItemSet();
    var
        CheckItemErr: Label 'Set Car first', Comment = 'Set Car first';
    begin
        if Rec."No." = '' then
            Error(CheckItemErr);
    end;

    local procedure CheckItemAvailableStartDate()
    var
        RentalLine: Record "Rental Line";
        StartDateErr: Text;
    begin
        RentalLine.SetRange("No.", Rec."No.");
        RentalLine.SetFilter("Rental Start Date", '<=%1', Rec."Rental Start Date");
        RentalLine.SetFilter("Rental end Date", '>=%1', Rec."Rental Start Date");
        if RentalLine.FindFirst() then begin
            //StartDateErr := 'Item is reserved on Start Date.\' + 'Line No.:' + Format(RentalLine."Line No.") + Format(RentalLine."No.") + ' Doc.No.:' + Format(RentalLine."Document No.") + 'Period:' + Format(RentalLine."Rental Start Date") + '...' + Format(RentalLine."Rental End Date");
            StartDateErr := 'On Start Date Car is reserved.\' + Format(RentalLine."Document No.") + ' ' + Format(RentalLine."Rental Start Date") + '..' + Format(RentalLine."Rental End Date") + '\End Service Date: ' + Format(RentalLine."Rental Service Day");
            Rec."Rental Start Date" := 0D;
            Rec."Rental End Date" := 0D;
            Rec."Rental Service Day" := 0D;
            Message(StartDateErr);
        end;
    end;

    local procedure CheckItemAvailableEndDate()
    var
        RentalLine: Record "Rental Line";
        EndDateErr: Text;
    begin
        RentalLine.SetRange("No.", Rec."No.");
        RentalLine.SetFilter("Rental Start Date", '<=%1', Rec."Rental End Date");
        RentalLine.SetFilter("Rental end Date", '>=%1', Rec."Rental End Date");
        if RentalLine.FindFirst() then begin
            //EndDateErr := 'Item is reserved on End Date.\' + 'Line No.:' + Format(RentalLine."Line No.") + Format(RentalLine."No.") + ' Doc.No.:' + Format(RentalLine."Document No.") + 'Period:' + Format(RentalLine."Rental Start Date") + '...' + Format(RentalLine."Rental End Date");
            EndDateErr := 'On End Date Car Item is reserved.\' + Format(RentalLine."Document No.") + ' ' + Format(RentalLine."Rental Start Date") + '..' + Format(RentalLine."Rental End Date") + '\End Service Date: ' + Format(RentalLine."Rental Service Day");
            Rec."Rental Start Date" := 0D;
            Rec."Rental End Date" := 0D;
            Rec."Rental Service Day" := 0D;
            Message(EndDateErr);
        end;
        RentalLine.Reset();
        RentalLine.SetRange("No.", Rec."No.");
        RentalLine.SetFilter("Rental Start Date", '>=%1', Rec."Rental Start Date");
        RentalLine.SetFilter("Rental end Date", '<=%1', Rec."Rental End Date");
        if RentalLine.FindFirst() then begin
            //EndDateErr := 'Item is reserved on End Date.\' + 'Line No.:' + Format(RentalLine."Line No.") + Format(RentalLine."No.") + ' Doc.No.:' + Format(RentalLine."Document No.") + 'Period:' + Format(RentalLine."Rental Start Date") + '...' + Format(RentalLine."Rental End Date");
            EndDateErr := 'On End Date Car Item is reserved\' + Format(RentalLine."Document No.") + ' ' + Format(RentalLine."Rental Start Date") + '..' + Format(RentalLine."Rental End Date") + '\End Service Date: ' + Format(RentalLine."Rental Service Day");
            Rec."Rental Start Date" := 0D;
            Rec."Rental End Date" := 0D;
            Rec."Rental Service Day" := 0D;
            Message(EndDateErr);
        end;

    end;

    local procedure CheckDate()
    var
        CheckDateErr: Label 'End Date < Start Date', Comment = 'End Date < Start Date';
        CheckEndDateErr: Label 'Set Start Date first', Comment = 'Set Start Date first';
    begin
        if (Rec."Rental Start Date" = 0D) and (Rec."Rental End Date" <> 0D) then begin
            Rec."Rental Start Date" := 0D;
            Rec."Rental End Date" := 0D;
            Rec."Rental Service Day" := 0D;
            Message(CheckEndDateErr);
        end;

        if (Rec."Rental Start Date" <> 0D) and (Rec."Rental End Date" <> 0D) then
            if Rec."Rental End Date" < Rec."Rental Start Date" then begin
                //Error(CheckDateErr);
                Rec."Rental Start Date" := 0D;
                Rec."Rental End Date" := 0D;
                Rec."Rental Service Day" := 0D;
                Message(CheckDateErr);
            end;
    end;

    local procedure CheckServiceDayStartDate()
    var
        RentalLine: Record "Rental Line";
        StartDateErr: Text;
    begin
        RentalLine.Reset();
        RentalLine.SetRange("No.", Rec."No.");
        RentalLine.SetRange("Rental Service Day", Rec."Rental Start Date");
        RentalLine.SetFilter(RentalLine."Rental Start Date", '<>%1', 0D);
        if RentalLine.FindFirst() then begin
            //StartDateErr := 'On Start Date Car Item is on service.\' + Format(RentalLine."Document No.") + ' ' + Format(RentalLine."Rental Start Date") + '..' + Format(RentalLine."Rental End Date") + '\Service Date: ' + Format(RentalLine."Rental Service Day");
            StartDateErr := 'On Start Date Car Item is on service.\' + 'Line No.: ' + Format(RentalLine."Line No.") + '\Doc.No :' + Format(RentalLine."Document No.") + ' ' + Format(RentalLine."Rental Start Date") + '..' + Format(RentalLine."Rental End Date") + '\Service Date: ' + Format(RentalLine."Rental Service Day");
            Rec."Rental Start Date" := 0D;
            Rec."Rental End Date" := 0D;
            Rec."Rental Service Day" := 0D;
            Message(StartDateErr);
        end;
    end;
}