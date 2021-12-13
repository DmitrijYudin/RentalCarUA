table 50202 "Rental Header"
{
    Caption = 'Rental Header ';
    DataClassification = CustomerContent;

    fields
    {
        // field(1; "Document Type"; Text[150])
        // {
        //     Caption = 'Document Type';
        //     DataClassification = CustomerContent;
        // }
        field(1; "No."; Code[20])
        {
            Caption = 'No.', comment = 'ESP="Code."';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                RentalSetup: Record "Rental Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "No." <> xRec."No." then begin
                    TestNoSeries(RentalSetup);
                    NoSeriesMgt.TestManual(RentalSetup."Rental Nos.");
                    "No. Series" := '';

                end;
            end;
        }
        field(7; "Bill-to Address"; Text[100])
        {
            Caption = 'Bill-to Address';
            DataClassification = CustomerContent;
            TableRelation = Customer.Address;
            Editable = false;
        }
        field(9; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."Phone No.";
            Editable = false;
        }

        field(21; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if "Customer No." <> '' then begin
                    Customer.Get("Customer No.");
                    Rec.Validate("Customer Name", Customer.Name);
                    Rec.Validate("Bill-to Address", Customer.Address);
                    Rec.Validate("Phone No.", Customer."Phone No.");
                end;
            end;
        }
        field(30; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
            TableRelation = Customer.Name;
            Editable = false;
        }
        field(50; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }

        field(140; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

        // field(99; "Document Date"; Date)
        // {
        //     Caption = 'Document Date';

        //     trigger OnValidate()
        //     begin
        //         CalcQuoteValidUntilDate();
        //     end;
        // }
        field(152; "Quote Valid Until Date"; Date)
        {
            Caption = 'Quote Valid To Date';
        }

        // field(20; "Posting Date"; Date)
        // {
        //     Caption = 'Posting Date';
        //     DataClassification = ToBeClassified;
        // }
    }
    keys
    {
        key(PK; "No.", "Customer Name")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        InitInsert();
    end;

    // trigger OnDelete()
    // var
    //     RSHRadionShowMgt: Report "RSH Radion Show Mgt.";
    // begin
    //     RSHRadionShowMgt.DeleteRadioShowdetail(Rec."No.");
    // end;

    local procedure InitInsert()
    var
        RentalSetup: Record "Rental Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        if "No." <> '' then
            exit;

        TestNoSeries(RentalSetup);
        NoSeriesManagement.InitSeries(RentalSetup."Rental Nos.", xRec."No. Series", 0D, "No.", "No. Series");
    end;

    local procedure TestNoSeries(var RentalSetup: Record "Rental Setup")
    // var
    //     RadioShowNosErr: Label 'The field %1 should not be empty in Table %2!', Comment = '%1 = fieldCaption,%2 = TableCaption';
    begin
        if not RentalSetup.get() then begin
            RentalSetup.Insert();
            Commit();
        end;
        RentalSetup.TestField("Rental Nos.");

        // if RadioShowSetup."Radio Show Nos." = '' then
        //     Error(RadioShowNosErr, RadioShowSetup.FieldCaption("Radio Show Nos."), RadioShowSetup.TableCaption());
    end;

    // local procedure CalcQuoteValidUntilDate()
    // var
    //     SalesReceivablesSetup: Record "Sales & Receivables Setup";
    //     BlankDateFormula: DateFormula;
    // begin
    //     SalesReceivablesSetup.Get();
    //     if SalesReceivablesSetup."Quote Validity Calculation" <> BlankDateFormula then
    //         "Quote Valid Until Date" := CalcDate(SalesReceivablesSetup."Quote Validity Calculation", "Document Date");
    // end;
}