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

                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
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
                field("Line Amount"; Rec."Line Amount")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Item Discount"; Rec."Item Discount")
                {
                    ToolTip = 'Specifies the value of the Item Discount % field.';
                    ApplicationArea = All;
                }
                field("Rental Cust. Discount"; Rec."Rental Cust. Discount")
                {
                    ToolTip = 'Specifies the value of the Customer Discount % field.';
                    ApplicationArea = All;
                }
                field("Applied Discount"; Rec."Applied Discount")
                {
                    ToolTip = 'Specifies the value of the Applied Discount % field.';
                    ApplicationArea = All;
                }
                field("Item Discount Amount"; Rec."Item Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Item Discount Amount field.';
                    ApplicationArea = All;
                }
            }
            group(Control28)
            {
                ShowCaption = false;
                field("Total Lines Qty."; Rec."Total Lines Qty.")
                {
                    ToolTip = 'Specifies the value of the Total Lines Qty. field.';
                    ApplicationArea = All;
                }
                field("Total Lines Amount"; Rec."Total Lines Amount")
                {
                    ToolTip = 'Specifies the value of the Total Lines Amount field.';
                    ApplicationArea = All;
                }
                field("Total Lines Discount Amount"; Rec."Total Lines Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Total Lines Discount Amount field.';
                    ApplicationArea = All;
                }
                field("Total Customer Discount Amount"; Rec."Total Customer Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Total Customer Discount Amount % field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
