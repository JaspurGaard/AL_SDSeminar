pageextension 123456700 "CSD ResourcePageExt" extends "Resource Card"
//Ext by JTG
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type";"CSD Resource Type")
            {

            }
            field("CSD Quantity Per Day";"CSD Quantity Per Day")
            {
                
            }
            
        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxField;
                field("CSD Maximum Participants";"CSD Maximum Participants")
                {

                }
            }
        }
    }

    trigger OnAfterGetRecord();
        
    begin
        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);    
    end;

    [InDataSet]        
    var ShowMaxField : Boolean;

    
}