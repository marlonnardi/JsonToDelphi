unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUITypes, uniGUIApplication;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
    procedure UniGUIServerModuleControlPanelLogin(ASession: TUniGUISession;
      const Auser, APassword: string; var LoginValid: Boolean;
      LoginAttempt: Integer);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

{
SessionTimeout
1s  - 1000
1m  - 60000
5m  - 300000
20m - 1200000
}

uses
  UniGUIVars, uniGUIDialogs, uniGUIClasses;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleBeforeInit(Sender: TObject);
var
  vJs, vCss: string;
begin
  {$IFDEF DEBUG}
  SuppressErrors := [];
  {$ELSE}
  SuppressErrors := [errObjectNotFound];
  {$ENDIF}

  {$REGION 'Habilitando os MimeTypes (Arquivos permitidos)'}
  MimeTable.AddMimeType('ttf', 'application/font', False);
  MimeTable.AddMimeType('woff', 'application/x-font-woff', False);
  MimeTable.AddMimeType('woff2', 'application/font', False);
  MimeTable.AddMimeType('eot', 'application/font', False);
  MimeTable.AddMimeType('svg', 'application/font', False);
  {$ENDREGION}
  {$REGION 'Carregando Custom Meta'}
  with CustomMeta do
  begin
    Add('<meta name="Author" content="Marlon Nardi">');
    Add('<meta name="copyright" content="'+FormatDateTime('YYYY',Now)+' Falcon Sistemas">');
    Add('<meta name="keywords" content="json, delphi, pascal, convert, generate, json to delphi, json to pascal, json to delphi object, json to delphi class">');
    Add('<meta name="description" content="generate delphi classes from a json."/>');

    Add('<meta property="og:url" content="https://jsontodelphi.com">');
    Add('<meta property="og:title" content="generate delphi classes from a json.">');
    Add('<meta property="og:site_name" content="Json To Delphi Class">');
    Add('<meta property="og:description" content="generate delphi classes from a json.">');
    Add('<meta property="og:image" content="https://jsontodelphi.com/imagens/json.png">');
    Add('<meta property="og:image:type" content="image/png">');
  end;
  {$ENDREGION}
  {$REGION 'Carregando JS e CSS'}
  {copy folder "falcon" into "c:\program files (x86)\fmsoft\framework\unigui\uni-VERSION"}
  vJs := '\uni-'+UniGUIVersion+'\falcon\js\';
  vCss := '\uni-'+UniGUIVersion+'\falcon\css\';

  CustomFiles.Add(vCss+'style\financas.css?v=2');
  UniAddJSLibrary('https://www.google-analytics.com/analytics.js', True, [upoAsync, upoPlatformBoth]);
  CustomFiles.Add(vJs+'falcon.google.ua.52856584-4.js?v=1');
  {$ENDREGION}
end;

procedure TUniServerModule.UniGUIServerModuleControlPanelLogin(
  ASession: TUniGUISession; const Auser, APassword: string;
  var LoginValid: Boolean; LoginAttempt: Integer);
begin
  LoginValid := (Auser = 'master') and (APassword = 'v8n1g2a1');
end;

initialization
  RegisterServerModuleClass(TUniServerModule);

end.
