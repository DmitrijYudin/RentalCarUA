page 50201 "Rental Setup"
{

    Caption = 'Rental Setup';
    PageType = Card;
    SourceTable = "Rental Setup";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("Rental Nos."; Rec."Rental Nos.")
                {
                    ToolTip = 'Specifies the value of the Radio Show Nos. field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
