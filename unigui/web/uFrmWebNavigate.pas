unit uFrmWebNavigate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniURLFrame;

type
  TfrmWebNavigate = class(TUniForm)
    urlf: TUniURLFrame;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmWebNavigate: TfrmWebNavigate;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmWebNavigate: TfrmWebNavigate;
begin
  Result := TfrmWebNavigate(UniMainModule.GetFormInstance(TfrmWebNavigate));
end;

procedure TfrmWebNavigate.UniFormShow(Sender: TObject);
begin
  UniMainModule.SetGA4(Self.Name);
end;

end.
