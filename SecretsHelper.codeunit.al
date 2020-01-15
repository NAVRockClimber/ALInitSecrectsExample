codeunit 70001 "Secret Helper"
{
    Access = Internal;

    [NonDebuggable]
    procedure SaveSecret(KeyName: Text; SecretValue: Text)
    var
        EncryptionErr: Label 'The secret cannot be stored. The encryption is not enabled.';
        EncryptedBuffer: Text;
    begin
        if not EncryptionEnabled() then begin
            Error(EncryptionErr);
        end;
        EncryptedBuffer := Encrypt(SecretValue);
        IsolatedStorage.Set(KeyName, EncryptedBuffer, DataScope::Module);
    end;

    [NonDebuggable]
    procedure GetSecret(KeyName: Text): Text
    var
        SecretValue: Text;
        PlainBuffer: Text;
        EncryptionErr: Label 'The secret cannot be stored. The encryption is not enabled.';
    begin
        if not EncryptionEnabled() then begin
            error(EncryptionErr);
        end;
        if not IsolatedStorage.Contains(KeyName, DataScope::Module) then begin
            InitSecret();
        end;
        if not IsolatedStorage.Get(KeyName, DataScope::Module, SecretValue) then begin
            exit('');
        end;

        PlainBuffer := Decrypt(SecretValue);
        exit(PlainBuffer);
    end;

    [NonDebuggable]
    procedure DeleteSecret(KeyName: Text)
    begin
        IsolatedStorage.Delete(KeyName, DataScope::Module);
    end;

    [NonDebuggable]
    procedure UpdateSecret()
    var
        SecretDemoSetup: Record "Secret Demo Setup";
        SecretInput: Page "Secret Input";
        SecretValue: Text;
    begin
        SecretDemoSetup.Get();
        SecretDemoSetup.Testfield("Function URL");
        SecretDemoSetup.TestField("Access Key Code");
        if SecretInput.RunModal() = Action::OK then begin
            SecretValue := SecretInput.GetSecret();
            SaveSecret(SecretDemoSetup."Access Key Code", SecretValue);
        end;
    end;

    [NonDebuggable]
    procedure InitSecret()
    var
        UrlForwarder: Page "Url Forwarder";
        DescriptionTxt: Label 'Dear Customer, our service uses cloud services. You need to register and retrieve an access key. Please store this key via the "Update Access Key" action on the setup window.';
        UrlLabelTxt: Label 'https://navrockclimber.github.io/';
        UrlTxt: Label 'https://navrockclimber.github.io/';
    begin
        UrlForwarder.Set(DescriptionTxt, UrlLabelTxt, UrlTxt);
        UrlForwarder.RunModal();
    end;
}