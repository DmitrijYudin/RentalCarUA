xmlport 50200 "Rental Car XML"
{
    Caption = 'Rental Car XML Import/Export';
    FormatEvaluate = Xml;
    Encoding = UTF8;
    // = Import;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Item; Item)
            {
                fieldelement(No2; Item."No. 2")
                {
                }
                fieldelement(RentalModel; Item."Rental Model")
                {
                }
                fieldelement(RentalVisible; Item."Rental Visible")
                {
                }
                fieldelement(RentalColor; Item."Rental Color")
                {
                }
                fieldelement(RentalMileage; Item."Rental Mileage")
                {
                }
                fieldelement(RentalManufactureyear; Item."Rental Manufacture year")
                {
                }
                fieldelement(RentalItemDiscount; Item."Rental Item Discount")
                {
                }
                fieldelement(RentalCarServiceduration; Item."Rental Car Service duration")
                {
                }
            }
        }
    }
}
