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
  uGitHub in 'classes\uGitHub.pas',
  uUpdate in 'classes\uUpdate.pas',
  Pkg.Json.JSONName in '..\Pkg.Json.JSONName.pas',
  Pkg.Json.JsonValueHelper in '..\Pkg.Json.JsonValueHelper.pas',
  Pkg.Json.Lists in '..\Pkg.Json.Lists.pas',
  Pkg.Json.ReservedWords in '..\Pkg.Json.ReservedWords.pas',
  Pkg.Json.StubField in '..\Pkg.Json.StubField.pas',
  Pkg.Json.Visualizer in '..\Pkg.Json.Visualizer.pas',
  Pkg.Json.Settings in '..\Pkg.Json.Settings.pas',
  Pkg.JSON.SubTypes in '..\Pkg.JSON.SubTypes.pas';

{$R *.res}

{$WEAKLINKRTTI OFF}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSaveUnitForm, SaveUnitForm);
  Application.CreateForm(TUpdateForm, UpdateForm);
  Application.Run;
end.
