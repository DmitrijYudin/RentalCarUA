page 50203 "Rental Line"
{

    Caption = 'Rental Line';
    PageType = ListPart;
    SourceTable = "Rental Line";
    AutoSplitKey = true;

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

                    // trigger OnValidate()
                    // var
                    //     Item: Record Item;
                    // //ItemVariant: Record "Item Variant";
                    // begin
                    //     if Rec."No." <> '' then begin
                    //         //Item.Get(Item."No.");
                    //         //ItemVariant.Get(Item."No.");
                    //         Rec.Validate("Rental Model Line", Item."Rental Model");
                    //         //Rec.Validate("Rental Color", ItemVariant.Code);
                    //         Rec.Validate("Rental Mileage", item."Rental Mileage");
                    //         Rec.Validate("Rental Manufacture year", item."Rental Manufacture year");
                    //         Rec.Validate("Description", item."Description");
                    //     end;
                    // end;

                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Rental Model Line"; Rec."Rental Model Line")
                {
                    ToolTip = 'Specifies the value of the Car Model field.';
                    ApplicationArea = All;
                }
                field("Rental Mileage"; Rec."Rental Mileage")
                {
                    ToolTip = 'Specifies the value of the Mileage field.';
                    ApplicationArea = All;
                }
                field("Rental Manufacture year"; Rec."Rental Manufacture year")
                {
                    ToolTip = 'Specifies the value of the Manufacture year field.';
                    ApplicationArea = All;
                }
                field("Rental Color"; Rec."Rental Color")
                {
                    ToolTip = 'Specifies the value of the Car Color field.';
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
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
                field("Rental Duration"; Rec."Rental Duration")
                {
                    ToolTip = 'Specifies the value of the Rental Duration field.';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }

            }
        }
    }

}
