page 50203 "Rental Line"
{

    Caption = 'Rental Line';
    PageType = ListPart;
    SourceTable = "Rental Line";
    AutoSplitKey = true;
    MultipleNewLines = false;
    DelayedInsert = true;
    LinksAllowed = false;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No.  field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Rental Model Line"; Rec."Rental Model Line")
                {
                    ToolTip = 'Specifies the value of the Car Model field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Rental Mileage"; Rec."Rental Mileage")
                {
                    ToolTip = 'Specifies the value of the Mileage field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Rental Manufacture year"; Rec."Rental Manufacture year")
                {
                    ToolTip = 'Specifies the value of the Manufacture year field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Rental Color"; Rec."Rental Color")
                {
                    ToolTip = 'Specifies the value of the Car Color field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Rental Start Date"; Rec."Rental Start Date")
                {
                    ToolTip = 'Specifies the value of the Rental Start Date field.';
                    ApplicationArea = All;
                    NotBlank = false;
                    ShowMandatory = true;
                }
                field("Rental End Date"; Rec."Rental End Date")
                {
                    ToolTip = 'Specifies the value of the Rental End Date field.';
                    ApplicationArea = All;
                    NotBlank = false;
                    ShowMandatory = true;
                }
                field("Rental Duration"; Rec."Rental Duration")
                {
                    ToolTip = 'Specifies the value of the Rental Duration field.';
                    ApplicationArea = All;

                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }

}
