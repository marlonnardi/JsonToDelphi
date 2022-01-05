{$DEFINE WEB_UNIGUI} // Diretiva Interna

//{$define UNIGUI_VCL} // Diretiva Gera EXE
{$define UNIGUI_DLL} // Diretiva Gera DLL
//{$define UNIGUI_SERVICE} // Diretiva Service

  {$IFDEF UNIGUI_VCL}
    program {$E exe}
  {$ENDIF}
  {$IFDEF UNIGUI_DLL}
    library {$E dll}
  {$ENDIF}
  {$IFDEF UNIGUI_SERVICE}
    program
  {$ENDIF}

  JsonToDelphi;

uses
  {$IFDEF UNIGUI_VCL}
  Forms,
  {$ENDIF }
  {$IFDEF UNIGUI_DLL}
  uniGUIISAPI,
  {$ENDIF }
  {$IFDEF UNIGUI_SERVICE}
  SvcMgr,
  {$ENDIF }
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  FS.Sistema in 'classes\FS.Sistema.pas',
  Pkg.Json.DTO in '..\Pkg.Json.DTO.pas',
  Pkg.Json.Mapper in '..\Pkg.Json.Mapper.pas',
  UniFSButton in 'classes\UniFSButton.pas',
  UniFSConfirm in 'classes\UniFSConfirm.pas',
  UniFSCommon in 'classes\UniFSCommon.pas',
  UniFSBadgeText in 'classes\UniFSBadgeText.pas',
  Mainm in 'mobile\Mainm.pas' {MainmForm: TUnimForm},
  uFrmmGenerateUnit in 'mobile\uFrmmGenerateUnit.pas' {frmmGenerateUnit: TUnimForm},
  uFrmmNavigation in 'mobile\uFrmmNavigation.pas' {frmmNavigation: TUnimForm},
  Main in 'web\Main.pas' {MainForm: TUniForm},
  uFrmGenerateUnit in 'web\uFrmGenerateUnit.pas' {frmGenerateUnit: TUniForm},
  uFrmSamples in 'web\uFrmSamples.pas' {frmSamples: TUniForm},
  uFrmWebNavigate in 'web\uFrmWebNavigate.pas' {frmWebNavigate: TUniForm},
  uFrmmSamples in 'mobile\uFrmmSamples.pas' {frmmSamples: TUnimForm},
  UniFSPopup in 'classes\UniFSPopup.pas',
  Pkg.Json.JSONName in '..\Pkg.Json.JSONName.pas',
  Pkg.Json.JsonValueHelper in '..\Pkg.Json.JsonValueHelper.pas',
  Pkg.Json.Settings in '..\Pkg.Json.Settings.pas',
  Pkg.Json.Lists in '..\Pkg.Json.Lists.pas',
  Pkg.Json.ReservedWords in '..\Pkg.Json.ReservedWords.pas',
  Pkg.Json.StubField in '..\Pkg.Json.StubField.pas',
  Pkg.JSON.SubTypes in '..\Pkg.JSON.SubTypes.pas';

{$R *.res}

{$ifndef UNIGUI_VCL}
exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$endif}

begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown  := True;
  {$ENDIF}

  {$IFDEF UNIGUI_VCL}
    Application.Initialize;
    TUniServerModule.Create(Application);
    Application.Title := 'Json To Delphi Class';
    Application.Run;
  {$ENDIF}

  {$IFDEF UNIGUI_SERVICE}
    if not Application.DelayInitialize or Application.Installing then
      Application.Initialize;
    Application.CreateForm(TJsonToDelphiService, JsonToDelphiService);
  Application.Run;
  {$ENDIF}
end.
