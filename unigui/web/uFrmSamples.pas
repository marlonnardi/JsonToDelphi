unit uFrmSamples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniSyntaxEditorBase, uniSyntaxEditor,
  uniGUIBaseClasses, uniLabel, uniButton, uniBitBtn, UniFSButton;

type
  TfrmSamples = class(TUniForm)
    lbl7: TUniLabel;
    SynDelphi: TUniSyntaxEdit;
    lbl8: TUniLabel;
    Syn: TUniSyntaxEdit;
    btnDownload: TUniFSButton;
    procedure UniFormAfterShow(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmSamples: TfrmSamples;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule;

function frmSamples: TfrmSamples;
begin
  Result := TfrmSamples(UniMainModule.GetFormInstance(TfrmSamples));
end;

procedure TfrmSamples.btnDownloadClick(Sender: TObject);
begin
  UniSession.SendFile(UniServerModule.StartPath+'files\sample_use.rar');
end;

procedure TfrmSamples.UniFormAfterShow(Sender: TObject);
begin
  UniSession.AddJS('ga(''set'',''page'', ''/'+Self.Name+'.html'');');
  UniSession.AddJS('ga(''send'',''pageview'');');
end;

end.
