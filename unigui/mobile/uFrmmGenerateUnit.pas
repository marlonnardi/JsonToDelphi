unit uFrmmGenerateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniSyntaxEditorBase, uniSyntaxEditor, uniButton,
  unimButton, uniMemo, unimMemo;

type
  TfrmmGenerateUnit = class(TUnimForm)
    memSyntax: TUnimMemo;
    btnGenerate: TUnimButton;
    procedure UnimFormShow(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmmGenerateUnit: TfrmmGenerateUnit;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule;

function frmmGenerateUnit: TfrmmGenerateUnit;
begin
  Result := TfrmmGenerateUnit(UniMainModule.GetFormInstance(TfrmmGenerateUnit));
end;

procedure TfrmmGenerateUnit.btnGenerateClick(Sender: TObject);
var
  vTempFile: string;
begin
  vTempFile := UniServerModule.LocalCachePath+'RootUnit.pas';
  memSyntax.Lines.SaveToFile(vTempFile);

  UniSession.SendFile(vTempFile);

  CopyFile(PwideChar(UniServerModule.StartPath+'files\Pkg.Json.DTO.pas'),
    PWideChar(UniServerModule.LocalCachePath+'Pkg.Json.DTO.pas'),False);
  UniSession.SendFile(UniServerModule.LocalCachePath+'Pkg.Json.DTO.pas');
end;

procedure TfrmmGenerateUnit.UnimFormShow(Sender: TObject);
begin
  UniMainModule.SetGA4(Self.Name);
end;

end.
