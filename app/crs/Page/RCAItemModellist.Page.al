page 50104 "RCA Item Model list"
{

    Caption = 'RCA Item Model list';
    PageType = List;
    SourceTable = "RCA Item Model";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.';
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
