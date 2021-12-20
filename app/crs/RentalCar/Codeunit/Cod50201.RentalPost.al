codeunit 50201 "Rental Post"
{
    procedure PostRadioShow(RSHRadioShow: Record "Rental Header")
    var
        RSHRadioShowdetail: Record "Rental Line";
        RSHPostedRadioShow: Record "Rental Header Posted";
        RSHPostedRadioShowdetail: Record "Rental Line Posted";
        OrderPostedMsg: Label 'The order is posted as number %1 and moved to the %2', Comment = '%1 = No, %2 = TableCaption';
    begin
        RSHPostedRadioShow.TransferFields(RSHRadioShow);
        //RSHPostedRadioShow."No." := '';
        RSHPostedRadioShow.Insert(true);

        RSHRadioShowdetail.SetRange("Document No.", RSHRadioShow."No.");
        if RSHRadioShowdetail.FindSet() then
            repeat
                RSHPostedRadioShowdetail.TransferFields(RSHRadioShowdetail);
                RSHPostedRadioShowdetail.Validate("Document No.", RSHPostedRadioShow."No.");
                RSHPostedRadioShowdetail.Insert(true);
            until RSHRadioShowdetail.Next() = 0;

        //PostRadioShowToGenJnl(RSHRadioShow, RSHPostedRadioShow."No.");

        RSHRadioShow.Delete(true);
        RSHRadioShowdetail.DeleteAll(true);
        Commit();
        Message(OrderPostedMsg, RSHPostedRadioShow."No.", RSHPostedRadioShow.TableCaption());
    end;

    // local procedure PostRadioShowToGenJnl(RSHRadioShow: Record "RSH Radio Show"; DocumentNo_: Code[20])
    // var
    //     RSHRadioShowdetail: Record "RSH Radio Show detail";
    // begin
    //     RSHRadioShowSetup.Get();
    //     RSHRadioShowSetup.TestField("Interest Account");
    //     RSHRadioShowSetup.TestField("Gross Receivable");
    //     RSHRadioShowSetup.TestField("Post. Jnl. Template Name");
    //     RSHRadioShowSetup.TestField("Post. Jnl. Batch Name");

    //     PostingDate := WorkDate();
    //     DocumentDate := WorkDate();
    //     DocumentNo := DocumentNo_;

    //     RSHRadioShowdetail.SetRange("Radion Show No.", RSHRadioShow."No.");
    //     RSHRadioShowdetail.CalcSums("Total Amount");

    //     PostGenJnl(RSHRadioShowSetup."Interest Account", 'Radion Show Interest', RSHRadioShowdetail."Total Amount");
    //     PostGenJnl(RSHRadioShowSetup."Gross Receivable", 'Radion Show Gross Receivable', -RSHRadioShowdetail."Total Amount");
    // end;

    // local procedure PostGenJnl(GLAccNo: Code[20]; Descr: Text; Amt: Decimal)
    // var
    //     GenJournalLine: Record "Gen. Journal Line";
    //     Currency: Record Currency;
    // begin
    //     if Amt = 0 then
    //         exit;

    //     GenJournalLine.Init();
    //     GenJournalLine."Journal Template Name" := RSHRadioShowSetup."Post. Jnl. Template Name";
    //     GenJournalLine."Journal Batch Name" := RSHRadioShowSetup."Post. Jnl. Batch Name";
    //     GenJournalLine."Account Type" := GenJournalLine."Account Type"::"G/L Account";
    //     GenJournalLine.Validate("Account No.", GLAccNo);
    //     GenJournalLine.Validate("Posting Date", PostingDate);
    //     GenJournalLine.Validate("Document Date", DocumentDate);
    //     GenJournalLine."Document Type" := GenJournalLine."Document Type"::" ";
    //     GenJournalLine."Document No." := DocumentNo;
    //     GenJournalLine.Description := CopyStr(Descr, 1, MaxStrLen(GenJournalLine.Description));

    //     Currency.InitRoundingPrecision();
    //     if (Round(Amt, Currency."Amount Rounding Precision") - Amt) < Currency."Amount Rounding Precision" then
    //         Amt := Round(Amt, Currency."Amount Rounding Precision");

    //     GenJournalLine.Validate(Amount, Amt);

    //     GenJournalLine."Gen. Bus. Posting Group" := '';
    //     GenJournalLine."Gen. Prod. Posting Group" := '';
    //     GenJournalLine."Gen. Posting Type" := GenJournalLine."Gen. Posting Type"::" ";
    //     GenJournalLine."VAT Bus. Posting Group" := '';
    //     GenJournalLine."VAT Prod. Posting Group" := '';
    //     GenJournalLine."Tax Liable" := false;
    //     GenJournalLine."Tax Area Code" := '';
    //     GenJournalLine."Tax Group Code" := '';
    //     GenJournalLine."System-Created Entry" := true;

    //     GenJnlPostLine.Run(GenJournalLine);
    // end;

    // var
    //     RSHRadioShowSetup: Record "Rental Setup";
    //     GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    //     PostingDate, DocumentDate : Date;
    //     DocumentNo: Code[20];
}