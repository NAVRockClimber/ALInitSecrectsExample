controladdin "Url Forwarder AddIn"
{
    RequestedHeight = 300;
    RequestedWidth = 550;

    MinimumHeight = 200;
    MinimumWidth = 550;

    VerticalStretch = false;
    HorizontalStretch = false;

    VerticalShrink = true;
    HorizontalShrink = true;

    StartupScript = 'AddIn/Script/startupScript.js';
    Scripts = 'AddIn/Script/UrlForwarder.js';

    event AddInReady();

    procedure Show(Description: Text; UrlText: Text; Url: Text);
}