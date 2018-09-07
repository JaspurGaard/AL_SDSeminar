table 123456704 "CSD Seminar Comment Line"
{
    DataClassification = ToBeClassified;
    Caption = 'Seminar Comment Line';
    LookupPageId = "CSD Seminar Comment List";
    DrillDownPageId = "CSD Seminar Comment List";

    fields
    {
        field(10;"Table Name";Option)
        {
            Caption = 'Table Name';
            OptionMembers = Seminar, "Seminar Registration", "Posted Seminar Registration";
            OptionCaption = 'Seminar, "Seminar Registration", "Posted Seminar Registration';
        }
        field(20;"Document Line No.";Integer)
        {
            Caption = 'Document Line No.';
        }
        field(30;"No.";Code[20])
        {
            TableRelation = if("Table Name" = const(Seminar)) "CSD Seminar"
                            else if ("Table Name" = const("Seminar Registration")) "CSD Seminar Reg. Header";
        }
        field(40;"Line No.";Integer)
        {
            Caption = 'Line No.';
        }
        field(50;"Date";Date)
        {
            Caption = 'Date';
        }
        field(60;"Code";Code[10])
        {
            Caption = 'Code';
        }
        field(70;"Comment";Text[80])
        {
            Caption = 'Comment';
        }
    }

    keys
    {
        key(PK;"Table Name","Document Line No.","No.","Line No.")
        {
            Clustered = true;
        }
    }
    procedure SetupNewLine();
    var
        SeminarCommentLine : Record "CSD Seminar Comment Line";
    begin
        SeminarCommentLine.SetRange("Table Name", "Table Name");
        SeminarCommentLine.SetRange("No.","No.");
        SeminarCommentLine.SetRange("Document Line No.", "Document Line No.");
        
        SeminarCommentLine.SetRange(Date, WorkDate);

        if SeminarCommentLine.IsEmpty then
            date := WorkDate;
    end;
}