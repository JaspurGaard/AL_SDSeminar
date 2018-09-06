tableextension 123456700 "CSD ResourceExt" extends Resource
//Code by JTG
{

    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate();
            
            begin
                rec.TestField("Unit Cost");
            end;
        }
        field(123456701;"CSD Resource Type";Option)
        {
            Caption = 'Resource Type';
            OptionMembers = "Internal", "External";
            OptionCaption = 'Internal, External';
        }
        field(123456702;"CSD Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(123456703;"CSD Quantity Per Day";Decimal)
        {
            Caption = 'Quantity Per Day';
        }
    }
}