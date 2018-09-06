pageextension 123456701 "CSD ResourceListExt" extends "Resource List"
//Ext by JTG
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        addafter(Type)
        {
            field("CSD Resource Type";"CSD Resource Type")
            {
                
            }

            field("CSD Maximum Participants";"CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }            
        }
    }

trigger OnOpenPage();

begin
    FilterGroup(3);
    ShowType := (GetFilter(Type)='');
    ShowMaxField := (GetFilter(Type) =
        format(Type::Machine));
    FilterGroup(0);
end;

    [InDataSet]
    var ShowMaxField : Boolean;

    [InDataSet]

    var ShowType :Boolean;
}