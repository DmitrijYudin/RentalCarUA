page 50202 "Rental Order"
{
    Caption = 'Rental Order';
    PageType = Card;
    SourceTable = "Rental Header";
    UsageCategory = Lists;
    ApplicationArea = all;
    PromotedActionCategories = 'New,Process,Report,Approve,Release,Posting,Prepare,Order,Request Approval,History,Print/Send,Navigate';

    layout
    {
        area(content)
        {
            group(General)
            {
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
                    ShowMandatory = true;
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
            part(SalesLines; "Rental Line")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
                UpdatePropagation = Both;
                Editable = true;
                Enabled = (Rec."Customer No." <> '');
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'P&ost';
                Ellipsis = true;
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ShortCutKey = 'F9';
                ToolTip = 'Finalize the document';

                AboutTitle = 'Posting the order';
                AboutText = 'Posting will post the quantities on the order.';

                trigger OnAction()
                var
                    RSHPostRadionShow: Codeunit "Rental Post";
                begin
                    RSHPostRadionShow.PostRadioShow(Rec);
                end;
            }
        }
    }
}