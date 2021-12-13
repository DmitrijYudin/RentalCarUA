//для примера
//делает то что и codeunit 50200
//изменить в table 50200 trigger OnDelete() report

report 50200 "Rental Mgt."
{
    ProcessingOnly = true;
    UsageCategory = None;
    procedure DeleteRentalLine(DocumentNo: Code[20])
    var
        RentalLine: Record "Rental Line";
    begin
        RentalLine.SetRange("Document No.", DocumentNo);
        RentalLine.DeleteAll(true);
    end;
}