unit ServerModule;

interface

uses
  System.Classes,
  System.SysUtils,
  System.IniFiles,
  uniGUIServer,
  uniGUITypes,
  uniGUIApplication;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
    procedure UniGUIServerModuleControlPanelLogin(ASession: TUniGUISession;
      const Auser, APassword: string; var LoginValid: Boolean;
      LoginAttempt: Integer);
  private
    { Private declarations }
    FUser: string;
    FPassword: string;

    procedure LoadConfigIni();
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
    v1, v2: Integer;
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
  UniGUIVars, uniGUIDialogs, uniGUIClasses, UniFSCommon;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.LoadConfigIni;
var
  IniFile: TIniFile;
  vArqIni: string;
begin
  try
    vArqIni := ExtractFilePath(StartPath) + '\config.ini';

    if not(FileExists(vArqIni)) then
      Exit;

    IniFile := TIniFile.Create(vArqIni);
    try
      FUser := IniFile.ReadString('SERVER', 'USER', '');
      FPassword := IniFile.ReadString('SERVER', 'PASSWORD', '');
    finally
      FreeAndNil(IniFile);
    end;
  except
    on e: Exception do
      raise Exception.Create('LoadConfigIni '+ e.Message);
  end;
end;

procedure TUniServerModule.UniGUIServerModuleBeforeInit(Sender: TObject);
begin
  {$IFDEF DEBUG}
  SuppressErrors := [];
  {$ELSE}
  SuppressErrors := [errObjectNotFound];
  {$ENDIF}

  LoadConfigIni;

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
    Add('<meta name="viewport" content="width=device-width, initial-scale=1">');
    Add('<meta name="robots" content="index, follow, max-image-preview:large">');
    Add('<meta name="application-name" content="Json To Delphi Class">');
    Add('<meta name="keywords" content="json to delphi, json to pascal, json to delphi class, json to delphi object, delphi json class generator, delphi dto generator, pascal class generator, json dto, json mapper delphi, Delphi 12 Athens, uniGUI, FireMonkey">');
    Add('<meta name="description" content="Free online Json To Delphi Class generator. Paste JSON and generate Delphi Pascal DTO classes, JsonProperty attributes and clean PascalCase models for Delphi projects.">');
    Add('<link rel="canonical" href="https://jsontodelphi.com/">');
    Add('<meta name="theme-color" content="#0b67c2">');

    Add('<meta property="og:url" content="https://jsontodelphi.com/">');
    Add('<meta property="og:title" content="Json To Delphi Class - JSON to Delphi Pascal DTO generator">');
    Add('<meta property="og:site_name" content="Json To Delphi Class">');
    Add('<meta property="og:description" content="Generate Delphi classes from JSON online with PascalCase, JsonProperty attributes and DTO output for modern Delphi projects.">');
    Add('<meta property="og:image" content="https://jsontodelphi.com/imagens/json.png">');
    Add('<meta property="og:image:type" content="image/png">');
    Add('<meta name="twitter:card" content="summary_large_image">');
    Add('<meta name="twitter:title" content="Json To Delphi Class">');
    Add('<meta name="twitter:description" content="Online JSON to Delphi Pascal class and DTO generator.">');
    Add('<link rel="stylesheet" href="/files/jsontodelphi-modern.css?v=20260520-htmlframe">');
    Add('<script type="application/ld+json">{"@context":"https://schema.org","@graph":[{"@type":"WebSite","@id":"https://jsontodelphi.com/#website","name":"Json To Delphi Class","url":"https://jsontodelphi.com/","inLanguage":"en","potentialAction":{"@type":"SearchAction","target":"https://jsontodelphi.com/?q={search_term_string}","query-input":"required name=search_term_string"}},{"@type":"WebApplication","@id":"https://jsontodelphi.com/#app","name":"Json To Delphi Class","alternateName":["JSON to Delphi","JSON to Pascal","Delphi DTO Generator"],"url":"https://jsontodelphi.com/","isPartOf":{"@id":"https://jsontodelphi.com/#website"},"applicationCategory":"DeveloperApplication","operatingSystem":"Web","browserRequirements":"Requires JavaScript","description":"Free online JSON to Delphi Pascal class and DTO generator for Delphi developers.","creator":{"@type":"Person","name":"Marlon Nardi","url":"https://github.com/marlonnardi"},"publisher":{"@type":"Organization","name":"Falcon Sistemas","url":"https://www.falconsistemas.com.br/"},"offers":{"@type":"Offer","price":"0","priceCurrency":"USD"},"featureList":["Generate Delphi classes from JSON","Generate Pascal DTO models","PascalCase property names","Optional JsonProperty attributes","Suppress zero date values","Postfix generated class names"],"keywords":"json to delphi, json to pascal, delphi class generator, delphi dto generator, pascal dto"}]}</script>');
  end;
  {$ENDREGION}
  {$REGION 'Carregando JS e CSS'}
  UniAddCSSLibrary(CDN+'falcon/css/style/jsontodelphi.css?v=2', CDNENABLED, [upoFolderUni, upoPlatformBoth]);

  UniAddJSLibrary('https://www.googletagmanager.com/gtag/js?id=G-VSH6WJS3B3', True, [upoFolderUni, upoPlatformBoth]);
  UniAddJSLibrary(CDN+'falcon/js/jsontodelphi_google_ga4.js', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
  {$ENDREGION}
end;

procedure TUniServerModule.UniGUIServerModuleControlPanelLogin(
  ASession: TUniGUISession; const Auser, APassword: string;
  var LoginValid: Boolean; LoginAttempt: Integer);
begin
  LoginValid := (Auser = FUser) and (APassword = FPassword);
end;

initialization
  RegisterServerModuleClass(TUniServerModule);

end.
