program JsonToDelphiClass;

{$R 'JSON_PAS.res' 'JSON_PAS.rc'}

uses
  System.StartUpCopy,
  FMX.Forms,
  uMainForm in 'uMainForm.pas' {MainForm},
  uSaveUnitForm in 'uSaveUnitForm.pas' {SaveUnitForm},
  FMX.ConstrainedForm in 'FMX.ConstrainedForm.pas' {ConstrainedForm},
  uUpdateForm in 'uUpdateForm.pas' {UpdateForm},
  Pkg.Json.DTO in '..\Pkg.Json.DTO.pas',
  Pkg.Json.Mapper in '..\Pkg.Json.Mapper.pas',
  Pkg.Json.Visualizer in '..\Pkg.Json.Visualizer.pas',
  uGitHub in 'classes\uGitHub.pas',
  uUpdate in 'classes\uUpdate.pas';

{$R *.res}

{$WEAKLINKRTTI OFF}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSaveUnitForm, SaveUnitForm);
  Application.CreateForm(TUpdateForm, UpdateForm);
  Application.Run;
end.
