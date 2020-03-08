program SampleUse;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmSampleUse},
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  RootUnit in 'RootUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSampleUse, frmSampleUse);
  Application.Run;
end.
