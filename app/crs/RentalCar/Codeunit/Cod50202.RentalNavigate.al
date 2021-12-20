codeunit 50202 "Rental Navigate"
{
    procedure FindEntries(DocumentNo: Code[20])
    var
        DocumentEntry: Record "Document Entry";
    begin
        DocumentEntry.SetRange("Document No.", DocumentNo);
        if not DocumentEntry.IsEmpty then begin
            Message('Document No.= %1\Posting Date= %2', DocumentNo, 'no');
            Page.Run(344);
        end;
    end;
}
