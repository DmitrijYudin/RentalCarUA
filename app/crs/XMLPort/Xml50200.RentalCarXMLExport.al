xmlport 50200 "Rental Car XML Export"
{
    Caption = 'Rental Car XML Export';
    FormatEvaluate = Xml;
    Encoding = UTF8;
    Direction = Export;
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(Item; Item)
            {
                fieldelement(No; Item."No.")
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
