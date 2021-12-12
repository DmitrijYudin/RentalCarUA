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
        field(20; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."Bill-to Customer No.";
        }
        field(30; "Customer Name"; Code[20])
        {
            Caption = 'Customer Name';
            DataClassification = CustomerContent;
            TableRelation = Customer.Name;
        }
        field(40; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = ToBeClassified;
        }
        field(50; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;
        }

        field(140; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        // field(20; "Posting Date"; Date)
        // {
        //     Caption = 'Posting Date';
        //     DataClassification = ToBeClassified;
        // }
    }
    keys
    {
        key(PK; "No.")
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
        RadioShowSetup: Record "Rental Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        if "No." <> '' then
            exit;

        TestNoSeries(RadioShowSetup);
        NoSeriesMgt.InitSeries(RadioShowSetup."Rental Nos.", xRec."No. Series", 0D, "No.", "No. Series");
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
}
