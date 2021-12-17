pageextension 50202 "Rental Item Card Ext" extends "Item Card"
{
    Caption = 'Rental Item Card Ext';

    layout
    {
        addafter(Item)
        {
            group("Rental Car")
            {
                field("Rental Model"; Rec."Rental Model")
                {
                    ToolTip = 'Specifies the value of the Car Model field.';
                    ApplicationArea = All;
                }
                field("Rental Color"; Rec."Rental Color")
                {
                    ToolTip = 'Specifies the value of the Color field.';
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
                field("Rental Item Discount"; Rec."Rental Item Discount")
                {
                    ToolTip = 'Specifies the value of the Rental Item Discount % field.';
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Rental Visible"; Rec."Rental Visible")
                {
                    ToolTip = 'Specifies the value of the Visible on Rental Order field.';
                    ApplicationArea = All;
                }
                field("Rental Car Service duration"; Rec."Rental Car Service duration")
                {
                    ToolTip = 'Specifies the value of the Rental Item Service duration, days field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
