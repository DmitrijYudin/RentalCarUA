codeunit 50201 "Rental Post"
{
    procedure PostRentalCar(RentalHeader: Record "Rental Header")
    var
        RentalLine: Record "Rental Line";
        RentalHeaderPosted: Record "Rental Header Posted";
        RentalLinePosted: Record "Rental Line Posted";
        OrderPostedMsg: Label 'The order is posted as number %1 and moved to the %2', Comment = '%1 = No, %2 = TableCaption';
    begin
        RentalHeaderPosted.TransferFields(RentalHeader);
        //RentalHeaderPosted."No.rt" := '';
        RentalHeaderPosted.Insert(true);

        RentalLine.SetRange("Document No.", RentalHeader."No.");
        if RentalLine.FindSet() then
            repeat
                RentalLinePosted.Init();

                RentalLine.CalcFields("Total Lines Amount");
                RentalLine.CalcFields("Total Lines Discount Amount");
                RentalLine.CalcFields("Total Lines Qty.");
                RentalLine.CalcFields("Total Order Cost");
                RentalLine.CalcFields("Rental Cust. Discount");

                RentalLinePosted.TransferFields(RentalLine);

                RentalLinePosted."Total Lines Amount" := RentalLine."Total Lines Amount";
                RentalLinePosted."Total Lines Discount Amount" := RentalLine."Total Lines Discount Amount";
                RentalLinePosted."Total Lines Qty." := RentalLine."Total Lines Qty.";
                RentalLinePosted."Total Order Cost" := RentalLine."Total Order Cost";
                RentalLinePosted."Rental Cust. Discount" := RentalLine."Rental Cust. Discount";

                RentalLinePosted.Validate("Document No.", RentalHeaderPosted."No.");
                RentalLinePosted.Insert(true);
            until RentalLine.Next() = 0;

        PostRentalCarToGenJnl(RentalHeader, RentalHeaderPosted."No.");

        RentalHeader.Delete(true);
        RentalLine.DeleteAll(true);
        Commit();
        Message(OrderPostedMsg, RentalHeaderPosted."No.", RentalHeaderPosted.TableCaption());
    end;

    local procedure PostRentalCarToGenJnl(RentalHeader: Record "Rental Header"; DocumentNo_: Code[20])
    var
        RentalLine: Record "Rental Line Posted";
    begin
        RentalSetup.Get();
        RentalSetup.TestField("Interest Account");
        RentalSetup.TestField("Gross Receivable");
        RentalSetup.TestField("Post. Jnl. Template Name");
        RentalSetup.TestField("Post. Jnl. Batch Name");

        PostingDate := WorkDate();
        DocumentDate := WorkDate();
        DocumentNo := DocumentNo_;

        RentalLine.SetRange("Document No.", RentalHeader."No.");
        if RentalLine.FindFirst() then begin
            PostGenJnl(RentalSetup."Interest Account", 'Rental Car Interest', RentalLine."Total Order Cost");
            PostGenJnl(RentalSetup."Gross Receivable", 'Rental Car Gross Receivable', -RentalLine."Total Order Cost");
        end
        else
            Message('Posting error');
    end;

    local procedure PostGenJnl(GLAccNo: Code[20]; Descr: Text; Amt: Decimal)
    var
        GenJournalLine: Record "Gen. Journal Line";
        Currency: Record Currency;
    begin
        if Amt = 0 then begin
            Message('Total Order Cost = %1. Posting will be canceled', Amt);
            exit;
        end;

        GenJournalLine.Init();
        GenJournalLine."Journal Template Name" := RentalSetup."Post. Jnl. Template Name";
        GenJournalLine."Journal Batch Name" := RentalSetup."Post. Jnl. Batch Name";
        GenJournalLine."Account Type" := GenJournalLine."Account Type"::"G/L Account";
        GenJournalLine.Validate("Account No.", GLAccNo);
        GenJournalLine.Validate("Posting Date", PostingDate);
        GenJournalLine.Validate("Document Date", DocumentDate);
        GenJournalLine."Document Type" := GenJournalLine."Document Type"::" ";
        GenJournalLine."Document No." := DocumentNo;
        GenJournalLine.Description := CopyStr(Descr, 1, MaxStrLen(GenJournalLine.Description));

        Currency.InitRoundingPrecision();
        if (Round(Amt, Currency."Amount Rounding Precision") - Amt) < Currency."Amount Rounding Precision" then
            Amt := Round(Amt, Currency."Amount Rounding Precision");

        GenJournalLine.Validate(Amount, Amt);

        GenJournalLine."Gen. Bus. Posting Group" := '';
        GenJournalLine."Gen. Prod. Posting Group" := '';
        GenJournalLine."Gen. Posting Type" := GenJournalLine."Gen. Posting Type"::" ";
        GenJournalLine."VAT Bus. Posting Group" := '';
        GenJournalLine."VAT Prod. Posting Group" := '';
        GenJournalLine."Tax Liable" := false;
        GenJournalLine."Tax Area Code" := '';
        GenJournalLine."Tax Group Code" := '';
        GenJournalLine."System-Created Entry" := true;

        GenJnlPostLine.Run(GenJournalLine);
    end;

    var
        RentalSetup: Record "Rental Setup";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        PostingDate, DocumentDate : Date;
        DocumentNo: Code[20];
}