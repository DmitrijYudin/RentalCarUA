permissionset 50200 "Rental Permissions"
{
    Assignable = true;
    Caption = 'Rental Settings Permission Set';

    Permissions =
        tabledata "Rental Header" = rimd,
        tabledata "Rental Line" = rimd,
        tabledata "Rental Setup" = rimd,
        tabledata "Rental Line Posted" = rimd,
        tabledata "Rental Header Posted" = rimd;
}