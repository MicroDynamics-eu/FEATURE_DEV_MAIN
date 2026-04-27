codeunit 82000 E2E_POSTING
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler')]
    procedure TestHelloWorldMessage()
    var
        CustList: TestPage "Customer List";
    begin
        CustList.OpenView();
        CustList.Close();
        if (not MessageDisplayed) then
            ERROR('E2E:Message was not displayed!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        MessageDisplayed := MessageDisplayed or (Message = 'App published: Hello world');
    end;

    var
        MessageDisplayed: Boolean;
}