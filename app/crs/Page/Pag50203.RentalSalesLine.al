page 50203 "Rental Sales Line"
{

    Caption = 'Rental Sales Line';
    PageType = ListPart;
    SourceTable = "Rental Sales Line";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.';
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = All;
                }
                field(Type; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type  field.';
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No.  field.';
                    ApplicationArea = All;
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies the value of the Shipment Date field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }
                field("Item Model"; Rec."Item Model")
                {
                    ToolTip = 'Specifies the value of the Item Model field.';
                    ApplicationArea = All;
                }
                field("Rental Color"; Rec."Rental Color")
                {
                    ToolTip = 'Specifies the value of the Rental Color field.';
                    ApplicationArea = All;
                }
                field("Rental Duration"; Rec."Rental Duration")
                {
                    ToolTip = 'Specifies the value of the Rental Duration field.';
                    ApplicationArea = All;
                }
                field("Rental Start Date"; Rec."Rental Start Date")
                {
                    ToolTip = 'Specifies the value of the Rental Start Date field.';
                    ApplicationArea = All;
                }
                field("Rental End Date"; Rec."Rental End Date")
                {
                    ToolTip = 'Specifies the value of the Rental End Date field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
