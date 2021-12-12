permissionset 50200 "Rental Permissions"
{
    Assignable = true;
    Caption = 'Rental Settings Permision Set';

    Permissions =
        tabledata "Rental Header" = rimd,
        tabledata "Rental Line" = rimd,
        tabledata "Rental Setup" = rimd;
}