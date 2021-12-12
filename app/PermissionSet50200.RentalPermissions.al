permissionset 50200 "Rental Permissions"
{
    Assignable = true;
    Caption = 'Rental Settings Permision Set';

    Permissions =
        tabledata "Rental Sales Header" = rimd,
        tabledata "Rental Sales Line" = rimd;
}