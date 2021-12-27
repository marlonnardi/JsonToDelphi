unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, uniGUIBaseClasses, uniGUIClasses;

type
  TUniMainModule = class(TUniGUIMainModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetGA4(PageWiew: string; GA: string = 'G-VSH6WJS3B3');
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

{ TUniMainModule }

procedure TUniMainModule.SetGA4(PageWiew, GA: string);
begin
  UniSession.AddJS('gtag(''event'',''page_view'',{''page_title'': '''+PageWiew+''', ''send_to'': '''+GA+'''});');
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
