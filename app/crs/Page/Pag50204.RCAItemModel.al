page 50204 "RCA Item Model"
{
    Caption = 'RCA Item Model';
    SourceTable = "RCA Item Model";
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
