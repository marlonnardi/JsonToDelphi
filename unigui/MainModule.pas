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

const
  // Descontinuacao do jsontodelphi.com: aviso exibido nas versoes web e mobile.
  JTD_DISCONTINUE_DATE = 'December 1, 2026';
  JTD_ALTERNATIVE_URL = 'https://github.com/JensBorrisholt/Delphi-JsonToDelphiClass';

function UniMainModule: TUniMainModule;
function DiscontinueNoticeHtml: string;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

function DiscontinueNoticeHtml: string;
begin
  Result :=
    '<b>jsontodelphi.com will be discontinued on ' + JTD_DISCONTINUE_DATE + '.</b> ' +
    'Thank you for using and supporting this project. ' +
    'To keep generating Delphi classes from JSON, we recommend the open-source ' +
    '<a href="' + JTD_ALTERNATIVE_URL + '" target="_blank" rel="noopener">Delphi-JsonToDelphiClass</a> ' +
    'by Jens Borrisholt.';
end;

{ TUniMainModule }

procedure TUniMainModule.SetGA4(PageWiew, GA: string);
begin
  UniSession.AddJS('gtag(''event'',''page_view'',{''page_title'': '''+PageWiew+''', ''send_to'': '''+GA+'''});');
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
