unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniLabel, uniGUIBaseClasses, uniPanel, uniMemo, uniHTMLFrame,
  uniSplitter, uniRadioGroup, uniButton, uniBitBtn, UniFSButton, uniImage,
  UniFSConfirm, UniFSPopup, Pkg.Json.Mapper, Pkg.Json.DTO, Pkg.Json.Settings,
  uniTimer, uniCheckBox, uniGroupBox;

type
  TMainForm = class(TUniForm)
    pnlMaster: TUniPanel;
    pnlTop: TUniPanel;
    lblTitle: TUniLabel;
    lblSubTitle: TUniLabel;
    lblDeveloper: TUniLabel;
    memJson: TUniMemo;
    lbl1: TUniLabel;
    lbl2: TUniLabel;
    lbl3: TUniLabel;
    lbl4: TUniLabel;
    lbl5: TUniLabel;
    spl1: TUniSplitter;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    lbl6: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    lblJsonToPascal: TUniLabel;
    pnlBottom: TUniPanel;
    imgFalconSistemas: TUniImage;
    lblVersion: TUniLabel;
    lbl7: TUniLabel;
    lbl8: TUniLabel;
    tmr: TUniTimer;
    Confirm: TUniFSConfirm;
    btnCollaborators: TUniFSButton;
    btn1: TUniFSButton;
    lblNews: TUniLabel;
    btnGenerate: TUniFSButton;
    btnValidate: TUniFSButton;
    btnSample: TUniFSButton;
    grpSettings: TUniGroupBox;
    chkUsePascalCase: TUniCheckBox;
    chkAddJsonPropertyAttributes: TUniCheckBox;
    chkSuppressZeroDate: TUniCheckBox;
    chkPostfixClassNames: TUniCheckBox;
    lblDoacao: TUniLabel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure btnGenerateClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnSampleClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure tmrTimer(Sender: TObject);
  protected
    Popup: TUniFSPopup;
    procedure LoadCoallaborators;
  private
    { Private declarations }
    JsonMapper : TPkgJsonMapper;
    JsonSettings : TSettings;

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
      '*Help keep domain https://jsontodelphi.com online.</br>'+
      '*Help keep hosting server online. </br> '+
      '*Help get new features. </br></br> '+

      'All the amount collected will be kept for these purposes and others if they arise. </br></br>'+
      'suporte@falconsistemas.com.br </br></br>',
      'fas fa-hands-helping',TTypeColor.blue, TTheme.supervan);
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
    JsonSettings.UsePascalCase := chkUsePascalCase.Checked;
    JsonSettings.SuppressZeroDate := chkSuppressZeroDate.Checked;
    JsonSettings.AddJsonPropertyAttributes := chkAddJsonPropertyAttributes.Checked;
    JsonSettings.PostFixClassNames := chkPostfixClassNames.Checked;

    if JsonMapper = nil then
      JsonMapper := TPkgJsonMapper.Create();

    JsonMapper.DestinationUnitName := 'RootUnit';
    JsonMapper.Parse(memJson.Text);

    frmGenerateUnit.synx.Text := JsonMapper.GenerateUnit;
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
  '</form> ';

  lblVersion.Caption := TSistema.GetVersao(UniServerModule.StartPath + '\jsontodelphi.dll');

  lblJsonToPascal.Visible := False;
end;

procedure TMainForm.LoadCoallaborators;
var
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create;
  try
    SB.Append('<div style=''margin:0px 0px 8px 0px'';>List of Contributors</div>');
    SB.Append('<div class=''list-group''> ');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2021-12-05 - Leon Siepman <b>U$ 25,00</b> </a>');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2021-11-06 - Samuel Herzog <b>U$ 20,00</b> </a>');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2021-10-30 - Christian Späth <b>U$ 15,00</b> </a>');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2021-08-06 - Валерий Шабаков <b>U$ 10,00</b> </a>');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2021-07-24 - Геннадий Малинин <b>U$ 5,00</b> </a>');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2021-06-25 - Pierre Demers <b>U$ 30,00</b> </a>');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2021-06-16 - Christian Späth <b>U$ 15,00</b> </a>');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2020-07-06 - DEMORSOFT  <b>U$ 10,00</b> </a>');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2020-05-31 - Gordon Niessen <b>U$ 10,00</b> </a>');
    SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; 2018-08-30 - Toni Puhakka <b>U$ 10,00</b> </a>');
    SB.Append('</div> ');

    Popup.SetHtml(SB.ToString);
  finally
    FreeAndNil(SB);
  end;
end;

procedure TMainForm.ShowAlert(Title, Msg: string);
var
  Confirm: TUniFSConfirm;
begin
  Confirm := TUniFSConfirm.Create(Self);
  try
    Confirm.Alert(Title, Msg, 'fas fa-exclamation-triangle',TTypeColor.orange, TTheme.modern);
  finally
    FreeAndNil(Confirm);
  end;
end;

procedure TMainForm.tmrTimer(Sender: TObject);
begin
  Confirm.boxWidth := '500px';
  Confirm.Alert(
    'jsontodelphi',
    '<p>"If you like this site and use it frequently, <b>make a donation to keep it up and running !</b>"</p> </br> '+
    '<p><i class="fab fa-lg fa-github"></i><a href="https://github.com/marlonnardi/JsonToDelphi#fixes--features-03h-october-2021" target="_blank"> News Fixes & Features: 03h October 2021</a></p></br> '+
    lblDoacao.Caption+'</br>',
    'fas fa-rocket',TTypeColor.green, TTheme.modern);
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
  if Assigned(JsonMapper) then
    FreeAndNil(JsonMapper);
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  JsonSettings := TSettings.Instance;

  Popup := TUniFSPopup.Create(Self);
  Popup.Width := 350;
  Popup.RelativeY := -15;
  Popup.RelativeX := 0;
  Popup.RelativePosition := TRelativePosition.b_t;
  Popup.ArrowLocation := TArrowLocation.bottom;
  Popup.Target := btnCollaborators;
  LoadCoallaborators;
end;

procedure TMainForm.UniFormDestroy(Sender: TObject);
begin
  FreeAndNil(Popup);
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
