page 123456700 "CSD Seminar Setup"
{
    PageType = Card;
    Caption = 'Seminar Setup';
    SourceTable = "CSD Seminar Setup";    
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("Seminar Nos.";"Seminar Nos.")
                {
                    
                }
                field("Seminar Registration Nos.";"Seminar Registration Nos.")
                {

                }
                field("Posted Seminar Registration Nos.";"Posted Seminar Registration Nos.")
                {

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
        if not Get then begin
            init;
            Insert;
        end;
    end;
}