codeunit 50201 "Rental Post"
{
    procedure PostRadioShow(RentalHeader: Record "Rental Header")
    var
        RentalLine: Record "Rental Line";
        RSHPostedRadioShow: Record "Rental Header Posted";
        RSHPostedRadioShowdetail: Record "Rental Line Posted";
        OrderPostedMsg: Label 'The order is posted as number %1 and moved to the %2', Comment = '%1 = No, %2 = TableCaption';
    begin
        RSHPostedRadioShow.TransferFields(RentalHeader);
        //RSHPostedRadioShow."No." := '';
        RSHPostedRadioShow.Insert(true);

        RentalLine.SetRange("Document No.", RentalHeader."No.");
        if RentalLine.FindSet() then
            repeat
                RSHPostedRadioShowdetail.Init();

                RentalLine.CalcFields("Total Lines Amount");
                RentalLine.CalcFields("Total Lines Discount Amount");
                RentalLine.CalcFields("Total Lines Qty.");
                RentalLine.CalcFields("Total Order Cost");
                RentalLine.CalcFields("Rental Cust. Discount");

                RSHPostedRadioShowdetail.TransferFields(RentalLine);

                RSHPostedRadioShowdetail."Total Lines Amount" := RentalLine."Total Lines Amount";
                RSHPostedRadioShowdetail."Total Lines Discount Amount" := RentalLine."Total Lines Discount Amount";
                RSHPostedRadioShowdetail."Total Lines Qty." := RentalLine."Total Lines Qty.";
                RSHPostedRadioShowdetail."Total Order Cost" := RentalLine."Total Order Cost";
                RSHPostedRadioShowdetail."Rental Cust. Discount" := RentalLine."Rental Cust. Discount";

                RSHPostedRadioShowdetail.Validate("Document No.", RSHPostedRadioShow."No.");
                RSHPostedRadioShowdetail.Insert(true);
            until RentalLine.Next() = 0;

        PostRadioShowToGenJnl(RentalHeader, RSHPostedRadioShow."No.");

        RentalHeader.Delete(true);
        RentalLine.DeleteAll(true);
        Commit();
        Message(OrderPostedMsg, RSHPostedRadioShow."No.", RSHPostedRadioShow.TableCaption());
    end;

    local procedure PostRadioShowToGenJnl(RentalHeader: Record "Rental Header"; DocumentNo_: Code[20])
    var
        RentalLine: Record "Rental Line Posted";
    begin
        RSHRadioShowSetup.Get();
        RSHRadioShowSetup.TestField("Interest Account");
        RSHRadioShowSetup.TestField("Gross Receivable");
        RSHRadioShowSetup.TestField("Post. Jnl. Template Name");
        RSHRadioShowSetup.TestField("Post. Jnl. Batch Name");

        PostingDate := WorkDate();
        DocumentDate := WorkDate();
        DocumentNo := DocumentNo_;


        RentalLine.SetRange("Document No.", RentalHeader."No.");
        if RentalLine.FindFirst() then begin
            PostGenJnl(RSHRadioShowSetup."Interest Account", 'Radion Show Interest', RentalLine."Total Order Cost");
            PostGenJnl(RSHRadioShowSetup."Gross Receivable", 'Radion Show Gross Receivable', -RentalLine."Total Order Cost");
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
        GenJournalLine."Journal Template Name" := RSHRadioShowSetup."Post. Jnl. Template Name";
        GenJournalLine."Journal Batch Name" := RSHRadioShowSetup."Post. Jnl. Batch Name";
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
        RSHRadioShowSetup: Record "Rental Setup";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        PostingDate, DocumentDate : Date;
        DocumentNo: Code[20];
}