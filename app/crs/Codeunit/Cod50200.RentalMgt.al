codeunit 50200 "Rental Mgt."
{
    procedure DeleteRentalLine(DocumentNo: Code[20])
    var
        RentalLine: Record "Rental Line";
    begin
        RentalLine.SetRange("Document No.", DocumentNo);
        RentalLine.DeleteAll(true);
    end;
}