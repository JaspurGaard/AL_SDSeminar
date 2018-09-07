codeunit 123456739 EventSubscriptions
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 7 - Lab 2-1
{
  [EventSubscriber(ObjectType::Codeunit, 212,'OnBeforeResLedgEntryInsert', '', true, true)]
  local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry : Record "Res. Ledger Entry";ResJournalLine : Record "Res. Journal Line");
  var
    c : Codeunit "Res. Jnl.-Post Line";
  begin   
      ResLedgerEntry."CSD Seminar No.":=ResJournalLine."CSD Seminar No.";
      ResLedgerEntry."CSD Seminar Registration No.":=ResJournalLine."CSD Seminar Registration No."; 
  end;
  [EventSubscriber(ObjectType::page, 344, 'OnAfterNavigateFindRecords', '', true, true)]
  local procedure ExtendNavigateOnAfterNavigateFindRecords(
    var DocumentEntry : Record "Document Entry";
    DocNoFilter : Text;
    PostingDateFilter : Text
  );

  var
    SeminarLedgerEntry : Record "CSD Seminar Ledger Entry";
    PostedSeminarRegHeader : Record "CSD Posted Seminar Reg. Header";
    DocNoOfRecord : Integer;
    NextEntryNo : Integer;
  
  begin
    if PostedSeminarRegHeader.ReadPermission then begin
      PostedSeminarRegHeader.Reset;
      PostedSeminarRegHeader.SetFilter("No.",DocNoFilter);
      PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
      DocNoOfRecord := PostedSeminarRegHeader.Count;
      with DocumentEntry do begin
        if DocNoOfRecord = 0 then
          exit;
        if FindLast then
          NextEntryNo := NextEntryNo +1
        else
          NextEntryNo := 1;
        init;
        "Entry No." := NextEntryNo;
        "Table ID" := Database::"CSD Posted Seminar Reg. Header";
        "Document Type" := 0;
        "Table Name" := CopyStr(PostedSeminarRegHeader.
                                  TableCaption,1,MaxStrLen("Table Name"));
        "No. of Records" := DocNoOfRecord;
        insert;
        end;
    end;
  end;

  [EventSubscriber(ObjectType::page, 344, 'OnAfterNavigateShowRecords', '', true, true)]
  local procedure ExtendNavigateOnAfterNavigateShowRecords(
    TableID : Integer;
    DocNoFilter : Text;
    PostingDateFilter : Text;
    ItemTrackingSearch : Boolean
  );

  var
    SeminarLedgerEntry : Record "CSD Seminar Ledger Entry";
    PostedSeminarRegHeader : Record "CSD Posted Seminar Reg. Header";
    
  begin
    case TableID of
      Database::"CSD Posted Seminar Reg. Header": begin
        PostedSeminarRegHeader.SetFilter("No.",DocNoFilter);
        PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
        page.run(0, PostedSeminarRegHeader);
      end;
      Database::"CSD Seminar Ledger Entry": begin
        SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
        SeminarLedgerEntry.SetFilter("Posting Date",PostingDateFilter);
        Page.Run(00,SeminarLedgerEntry);
      end;
  end;
end;
}