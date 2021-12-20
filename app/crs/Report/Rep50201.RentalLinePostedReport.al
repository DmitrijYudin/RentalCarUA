report 50201 "Rental Line Posted Report"
{
    ApplicationArea = All;
    Caption = 'Posted Report';
    UsageCategory = ReportsAndAnalysis;
    WordLayout = 'crs\Layout\RentalReport.docx';
    RDLCLayout = 'crs\Layout\RentalReport.rdlc';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(RentalLinePosted; "Rental Line Posted")
        {
            column(DocumentNo; "Document No.")
            {
                IncludeCaption = true;
            }
            column(LineNo; "Line No.")
            {
                IncludeCaption = true;
            }
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(TotalOrderCost; "Total Order Cost")
            {
                IncludeCaption = true;
            }
            column(CustomerNo_RentalLinePosted; "Customer No.")
            {
                IncludeCaption = true;
            }
            column(AppliedDiscount_RentalLinePosted; "Applied Discount")
            {
                IncludeCaption = true;
            }
            column(LineCost_RentalLinePosted; "Line Cost")
            {
                IncludeCaption = true;
            }
            column(UnitPrice_RentalLinePosted; "Unit Price")
            {
                IncludeCaption = true;
            }
            column(RentalModelLine_RentalLinePosted; "Rental Model Line")
            {
                IncludeCaption = true;
            }
        }
    }
}
