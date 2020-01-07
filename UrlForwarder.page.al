page 70002 "Url Forwarder"
{
    PageType = NavigatePage;
    Caption = 'Sorry, we need you to visit our web site.';

    layout
    {
        area(Content)
        {
            usercontrol(UrlForwarder; "Url Forwarder AddIn")
            {
                ApplicationArea = Basic, Suite;
                trigger AddInReady()
                begin
                    CurrPage.UrlForwarder.Show(_Description, _UrlText, _Url);
                end;
            }
        }
    }

    var
        _UrlText: Text;
        _Url: Text;
        _Description: Text;

    procedure Set(Description: Text; UrlText: Text; Url: Text)
    begin
        _Description := Description;
        _UrlText := UrlText;
        _Url := Url;
    end;
}