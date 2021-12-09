page 50201 "Rental Color"
{
    Caption = 'Rental Color';
    SourceTable = "Rental Color";
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    Editable = true;
    ModifyAllowed = true;
    DeleteAllowed = true;
    InsertAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Color; Rec.Color)
                {
                    ToolTip = 'Specifies the value of the Color field.';
                    ApplicationArea = All;
                }
                field(Discription; Rec.Discription)
                {
                    ToolTip = 'Specifies the value of the Discription field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}