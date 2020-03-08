unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmSampleUse = class(TForm)
    memSample: TMemo;
    btnJsonToObject: TButton;
    lbl1: TLabel;
    lblid: TLabel;
    lbl3: TLabel;
    lblvalue: TLabel;
    lbl2: TLabel;
    lblcount: TLabel;
    lbl4: TLabel;
    lblfirstonclick: TLabel;
    lbl6: TLabel;
    lbllastonclick: TLabel;
    procedure btnJsonToObjectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSampleUse: TfrmSampleUse;

implementation

uses
  RootUnit, Pkg.Json.DTO;

{$R *.dfm}

procedure TfrmSampleUse.btnJsonToObjectClick(Sender: TObject);
var
  Root: TRootDTO;
begin
  Root := TRootDTO.Create;
  try
    Root.AsJson := memSample.Lines.Text;

    lblid.Caption := Root.Menu.Id;
    lblvalue.Caption := Root.Menu.Value;
    lblcount.Caption := IntToStr(Length(Root.Menu.Popup.Menuitem));
    lblfirstonclick.Caption := Root.Menu.Popup.Menuitem[0].Onclick;
    lbllastonclick.Caption := Root.Menu.Popup.Menuitem[Length(Root.Menu.Popup.Menuitem)-1].Onclick;
  finally
    Root.Free;
  end;
end;

end.
