page 50200 "Rental Order Posted"
{
    Caption = 'Posted Rental Order';
    PageType = Card;
    SourceTable = "Rental Header Posted";
    UsageCategory = Lists;
    ApplicationArea = all;
    DeleteAllowed = true;
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = 'ESP="Code."';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                    NotBlank = false;
                    Visible = true;
                }

                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the value of the Salesperson Code field.';
                    ApplicationArea = All;
                    NotBlank = false;
                    ShowMandatory = true;
                    Visible = true;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field("Rental Cust. Discount"; Rec."Rental Cust. Discount")
                {
                    ToolTip = 'Specifies the value of the Cust. Discount % field.';
                    ApplicationArea = All;
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ToolTip = 'Specifies the value of the Bill-to Address field.';
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
                    ApplicationArea = All;
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                    Caption = 'Document Modified at';
                    ApplicationArea = All;
                }
            }
            part(SalesLines; "Rental Line Posted")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
                //Enabled = (Rec."Customer No." <> '');
                Editable = false;
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action("Find Entries")
            {

                Caption = 'Find Entries';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Export;
                ToolTip = 'Executes the Find Entries action.';

                trigger OnAction()
                var
                    RentalNavigate: Codeunit "Rental Navigate";

                begin
                    RentalNavigate.FindEntries(Rec."No.");
                end;
            }
        }
    }
}