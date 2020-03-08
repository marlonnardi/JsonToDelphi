unit uFrmGenerateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniTreeView,
  uniSyntaxEditor, uniEdit, uniLabel, uniButton, uniBitBtn, UniFSButton,
  uniSyntaxEditorBase;

type
  TfrmGenerateUnit = class(TUniForm)
    pnlUnit: TUniPanel;
    synx: TUniSyntaxEdit;
    pnlBottom: TUniPanel;
    lblUnitName: TUniLabel;
    edtUnitName: TUniEdit;
    lbl1: TUniLabel;
    btnDownload: TUniFSButton;
    procedure btnDownloadClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmGenerateUnit: TfrmGenerateUnit;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule;

function frmGenerateUnit: TfrmGenerateUnit;
begin
  Result := TfrmGenerateUnit(UniMainModule.GetFormInstance(TfrmGenerateUnit));
end;

{ TfrmGenerateUnit }

procedure TfrmGenerateUnit.btnDownloadClick(Sender: TObject);
var
  vTempFile: string;
begin
  vTempFile := UniServerModule.LocalCachePath+edtUnitName.Text+'.pas';
  synx.Lines.SaveToFile(vTempFile);

  UniSession.SendFile(vTempFile);
  UniSession.SendFile(UniServerModule.StartPath+'files\Pkg.Json.DTO.pas');
end;

procedure TfrmGenerateUnit.UniFormShow(Sender: TObject);
begin
  UniSession.AddJS('ga(''set'',''page'', ''/'+Self.Name+'.html'');');
  UniSession.AddJS('ga(''send'',''pageview'');');
end;

end.
