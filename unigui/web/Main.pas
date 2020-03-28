unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniLabel, uniGUIBaseClasses, uniPanel, uniMemo, uniHTMLFrame,
  uniSplitter, uniRadioGroup, uniButton, uniBitBtn, UniFSButton, uniImage,
  UniFSConfirm, Pkg.Json.Mapper, Pkg.Json.DTO;

type
  TMainForm = class(TUniForm)
    pnlMaster: TUniPanel;
    pnlTop: TUniPanel;
    lblTitle: TUniLabel;
    lblSubTitle: TUniLabel;
    lblDeveloper: TUniLabel;
    memJson: TUniMemo;
    lbl1: TUniLabel;
    pnlControl: TUniPanel;
    lbl2: TUniLabel;
    lbl3: TUniLabel;
    lbl4: TUniLabel;
    lbl5: TUniLabel;
    spl1: TUniSplitter;
    lblDoacao: TUniLabel;
    btnGenerate: TUniFSButton;
    btnValidate: TUniFSButton;
    btn1: TUniFSButton;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    lbl6: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    lblJsonToPascal: TUniLabel;
    btnSample: TUniFSButton;
    pnlBottom: TUniPanel;
    imgFalconSistemas: TUniImage;
    lblVersion: TUniLabel;
    lbl7: TUniLabel;
    lbl8: TUniLabel;
    lblVerionPrior: TUniLabel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure btnGenerateClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnSampleClick(Sender: TObject);
    procedure lblVerionPriorClick(Sender: TObject);
  private
    { Private declarations }
    jm : TPkgJsonMapper;

    procedure DefineRegrasLayout;
    procedure AlinhamentoCenter;

    procedure ShowAlert(Title, Msg: string);
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uFrmWebNavigate, uFrmGenerateUnit,
  FS.Sistema, ServerModule, uFrmSamples;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

{ TMainForm }

procedure TMainForm.AlinhamentoCenter;
begin
  pnlMaster.Left   := (Self.Width div 2) - (pnlMaster.Width div 2);
end;

procedure TMainForm.btn1Click(Sender: TObject);
var
  Confirm: TUniFSConfirm;
begin
  Confirm := TUniFSConfirm.Create(Self);
  try
    Confirm.Alert('About Donate',
      '*Project Open Source, disponible in github.</br>'+
      '*Project Open Source, disponible in github.</br>'+
      '*Help keep domain https://jsontodelphi.com online.</br>'+
      '*Help keep hosting server online. </br> '+
      '*Help get new features. </br></br> '+

      'All the amount collected will be kept for these purposes and others if they arise. </br></br>'+
      'suporte@falconsistemas.com.br </br></br>',
      'fa fa-handshake-o',TTypeColor.blue, TTheme.supervan);
  finally
    FreeAndNil(Confirm);
  end;
end;

procedure TMainForm.btnGenerateClick(Sender: TObject);
var
  vJson : string;
begin
  vJson := Trim(memJson.Lines.Text);

  if Length(vJson) <= 4 then
    Exit;

  try
    vJson := TJsonDTO.PrettyPrintJSON(vJson);
    memJson.Lines.Clear;
    memJson.Lines.Add(vJson)
  except
    on e: Exception do
    begin
      ShowAlert('JSON Invalid, please chek!','');
      Exit;
    end;
  end;

  try
    if jm = nil then
      jm := TPkgJsonMapper.Create();

    jm.DestinationUnitName := 'RootUnit';
    jm.Parse(memJson.Text);

    frmGenerateUnit.synx.Text := jm.GenerateUnit;
    frmGenerateUnit.ShowModal();
  except
    on e: Exception do
    begin
      ShowAlert('JSON Invalid','please chek. </br></br>'+ e.Message);
    end;
  end;
end;

procedure TMainForm.btnSampleClick(Sender: TObject);
begin
  frmSamples.Show();
end;

procedure TMainForm.DefineRegrasLayout;
begin
  AlinhamentoCenter;

  lblDoacao.Caption :=
  '<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank"> '+
  '<input type="hidden" name="cmd" value="_s-xclick" /> '+
  '<input type="hidden" name="hosted_button_id" value="Z3JZ3GU9SGCLU" /> '+
  '<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" /> '+
  '<img alt="" border="0" src="https://www.paypal.com/en_BR/i/scr/pixel.gif" width="1" height="1" /> '+
  '</form> ';

  lblVersion.Caption := TSistema.GetVersao(UniServerModule.StartPath + '\jsontodelphi.dll');

  lblJsonToPascal.Visible := False;
end;

procedure TMainForm.lblVerionPriorClick(Sender: TObject);
begin
  UniSession.UrlRedirect('https://x_versionprior_x.jsontodelphi.com/');
end;

procedure TMainForm.ShowAlert(Title, Msg: string);
var
  Confirm: TUniFSConfirm;
begin
  Confirm := TUniFSConfirm.Create(Self);
  try
    Confirm.Alert(Title, Msg, 'fa fa-alert',TTypeColor.orange, TTheme.modern);
  finally
    FreeAndNil(Confirm);
  end;
end;

procedure TMainForm.UniFormAfterShow(Sender: TObject);
begin
  DefineRegrasLayout;
  UniSession.AddJS('ga(''set'',''page'', ''/'+Self.Name+'.html'');');
  UniSession.AddJS('ga(''send'',''pageview'');');
end;

procedure TMainForm.UniFormAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin
  if EventName = 'resize' then
    AlinhamentoCenter;
end;

procedure TMainForm.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(jm) then
    FreeAndNil(jm);
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
