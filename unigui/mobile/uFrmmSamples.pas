unit uFrmmSamples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniLabel, unimLabel, uniMemo, unimMemo, uniButton,
  unimButton;

type
  TfrmmSamples = class(TUnimForm)
    lbl1: TUnimLabel;
    memJSON: TUnimMemo;
    lbl2: TUnimLabel;
    memDelphi: TUnimMemo;
    btnGenerate: TUnimButton;
    procedure btnGenerateClick(Sender: TObject);
    procedure UnimFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmmSamples: TfrmmSamples;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule;

function frmmSamples: TfrmmSamples;
begin
  Result := TfrmmSamples(UniMainModule.GetFormInstance(TfrmmSamples));
end;

procedure TfrmmSamples.btnGenerateClick(Sender: TObject);
begin
  CopyFile(PwideChar(UniServerModule.StartPath+'files\sample_use.rar'),
    PWideChar(UniServerModule.LocalCachePath+'sample_use.rar'),False);
  UniSession.SendFile(UniServerModule.LocalCachePath+'sample_use.rar');
end;

procedure TfrmmSamples.UnimFormShow(Sender: TObject);
begin
  UniMainModule.SetGA4(Self.Name);
end;

end.
