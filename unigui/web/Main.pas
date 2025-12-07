unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniLabel, uniGUIBaseClasses, uniPanel, uniMemo, uniHTMLFrame,
  uniSplitter, uniRadioGroup, uniButton, uniBitBtn, UniFSButton, uniImage,
  UniFSConfirm, UniFSPopup, Pkg.Json.Mapper, Pkg.Json.DTO, Pkg.Json.Settings,
  uniTimer, uniCheckBox, uniGroupBox, UniFSToast, uniPageControl, uniProgressBar,
  uniDBNavigator, Data.DB, Datasnap.DBClient, uniBasicGrid, uniDBGrid, System.DateUtils;

type
  TMainForm = class(TUniForm)
    pnlMaster: TUniPanel;
    pnlTop: TUniPanel;
    lblTitle: TUniLabel;
    lblSubTitle: TUniLabel;
    lblDeveloper: TUniLabel;
    lbl1: TUniLabel;
    lbl2: TUniLabel;
    lbl3: TUniLabel;
    lbl4: TUniLabel;
    lbl5: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    lbl6: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    lblJsonToPascal: TUniLabel;
    pnlBottom: TUniPanel;
    lblVersion: TUniLabel;
    lbl7: TUniLabel;
    lbl8: TUniLabel;
    tmr: TUniTimer;
    Confirm: TUniFSConfirm;
    btnCollaborators: TUniFSButton;
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
    Toast: TUniFSToast;
    pgcJson: TUniPageControl;
    tabJson: TUniTabSheet;
    tabDonate: TUniTabSheet;
    memJson: TUniMemo;
    lblDonate: TUniLabel;
    lblDonate1: TUniLabel;
    pgrWizardDonate: TUniProgressBar;
    tabConfig: TUniTabSheet;
    dbgDonate: TUniDBGrid;
    CDS: TClientDataSet;
    intgrfldCDSid: TIntegerField;
    strngfldCDSLat: TStringField;
    DS: TDataSource;
    fltfldCDSValue: TFloatField;
    AggregateCDSSumValue: TAggregateField;
    Navigator: TUniDBNavigator;
    dtfldCDSDate: TDateField;
    btnDonate: TUniFSButton;
    grpPartners: TUniGroupBox;
    lblPipedrive: TUniLabel;
    lblFalconFinancas: TUniLabel;
    lblFalconSistemas: TUniLabel;
    procedure UniFormAfterShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormAjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnSampleClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure tmrTimer(Sender: TObject);
    procedure lblDoacaoClick(Sender: TObject);
    procedure ToastButtonCustomClickPopup(Sender: TObject);
    procedure lblVersionClick(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCollaboratorsClick(Sender: TObject);
  protected
    Admin: Boolean;
    FIdMessage: Integer;
    procedure RandomNotification();
    procedure DonationNotification();

    procedure OnClickPopup(Sender: TObject);
  protected
    //Popup: TUniFSPopup;
    procedure LoadCoallaborators;

  private
    { Private declarations }
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

procedure TMainForm.btnCollaboratorsClick(Sender: TObject);
var
  vColab: string;
begin
  CDS.Last;
  while not CDS.Bof do
  begin
    vColab := vColab + CDS.FieldByName('Date').AsString+' | '+CDS.FieldByName('Name').AsString+' | <b>$'+CDS.FieldByName('Value').AsString+'</b></br>';
    CDS.Prior;
  end;

  Confirm.Alert('Collaborators', ''+vColab+'', 'far fa-thumbs-up', TTypeColor.green, TTheme.modern);
end;

procedure TMainForm.btnGenerateClick(Sender: TObject);
var
  vJson : string;
  LMapper: TPkgJsonMapper;
begin
  vJson := Trim(memJson.Lines.Text);

  if Length(vJson) <= 4 then
  begin
    Confirm.Alert('Enter JSON', 'Input Json to generate class', 'far fa-lightbulb', TTypeColor.green, TTheme.modern);
    Exit;
  end;

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

    LMapper := TPkgJsonMapper.Create;
    try
      LMapper.DestinationUnitName := 'RootUnit';
      LMapper.Parse(memJson.Text);
      frmGenerateUnit.synx.Text := LMapper.GenerateUnit;
      frmGenerateUnit.ShowModal;
    finally
      LMapper.Free;
    end;
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

  //lblJsonToPascal.Visible := False;
end;

procedure TMainForm.DonationNotification;
begin
  Confirm.boxWidth := '500px';
  Confirm.ButtonTextOK := 'No thank you';
  Confirm.Alert(
    'jsontodelphi',
    '<p>"If you like this site and use it frequently, <b>make a donation to keep it up and running !</b>"</p> </br> '+
    '<p><i class="fab fa-lg fa-github"></i><a href="https://github.com/marlonnardi/JsonToDelphi?tab=readme-ov-file#fixes--features-16th-june-2024" target="_blank"> News Fixes & Features</a></p></br> '+
    lblDoacao.Caption+'</br>',
    'fas fa-rocket',TTypeColor.green, TTheme.modern);
end;

procedure TMainForm.lblDoacaoClick(Sender: TObject);
begin
  UniSession.AddJS('gtag(''event'',''donation'',{"transaction_id": "paypal"});');
end;

procedure TMainForm.lblVersionClick(Sender: TObject);
begin
  if Admin then
    pgcJson.ActivePage := tabConfig;
end;

procedure TMainForm.LoadCoallaborators;
var
  SB: TStringBuilder;
begin
  SB := TStringBuilder.Create;
  try
    SB.Append('<div style=''margin:0px 0px 8px 0px'';>List of Contributors</div>');
    SB.Append('<div class=''list-group''> ');
    CDS.Last;
    while not CDS.Bof do
    begin
      SB.Append('<a class=''fs-group-item''><i class=''far fa-thumbs-up fa-lg text-green''></i>&nbsp; '+
      ''+CDS.FieldByName('Date').AsString+' | '+CDS.FieldByName('Name').AsString+' | <b>$'+CDS.FieldByName('Value').AsString+'</b> </a>');
      CDS.Prior;
    end;
    SB.Append('</div> ');

    //Popup.SetHtml(SB.ToString);
  finally
    FreeAndNil(SB);
  end;
end;

procedure TMainForm.OnClickPopup(Sender: TObject);
begin
  case FIdMessage of
    0: UniSession.UrlRedirect('https://store.falconsistemas.com.br');
    1: UniSession.UrlRedirect('https://financeiro.app/');
  end;
end;

procedure TMainForm.RandomNotification;
  procedure Message0();
  begin
    Toast.ButtonCustomActive := True;
    Toast.ButtonCustomText := 'Falcon Store';
    Toast.ButtonCustomURL := 'https://store.falconsistemas.com.br';
    Toast.Title := 'Components for uniGUI';
    Toast.Msg := 'Also check out beautiful components for uniGUI';
    Toast.Image := 'https://store.falconsistemas.com.br/imagens/falcon_store_200.png';
    Toast.ProgressBar := False;
    Toast.TimeOut := 0;
    Toast.OnClickPopup := OnClickPopup;
    Toast.Show();
  end;
  procedure Message1();
  begin
    Toast.ButtonCustomActive := True;
    Toast.ButtonCustomText := 'Falcon Finanças';
    Toast.ButtonCustomURL := 'https://financeiro.app/';
    Toast.Title := 'Gerenciador Financeiro';
    Toast.Msg := 'Tenha um controle eficiente de suas finanças ';
    Toast.Image := 'https://financeiro.app/imagens/falcon_financas_200_new.png';
    Toast.ProgressBar := False;
    Toast.TimeOut := 0;
    Toast.OnClickPopup := OnClickPopup;
    Toast.Show();
  end;
begin
  FIdMessage := Random(2);
  case FIdMessage of
    0: Message0();
    1: Message1();
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
  //DonationNotification();
  //RandomNotification();
end;

procedure TMainForm.ToastButtonCustomClickPopup(Sender: TObject);
begin
  case FIdMessage of
    0: Inc(UniServerModule.v1);
    1: Inc(UniServerModule.v2);
  end;
  Toast.CloseAll;
end;

procedure TMainForm.UniFormAfterShow(Sender: TObject);
begin
  DefineRegrasLayout;
  UniMainModule.SetGA4(Self.Name);
end;

procedure TMainForm.UniFormAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin
  if EventName = 'resize' then
    AlinhamentoCenter;
end;

procedure TMainForm.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
  CDS.Close;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
var
  Value: Float64;
begin
  JsonSettings := TSettings.Instance;

//  Popup := TUniFSPopup.Create(Self);
//  Popup.Width := 350;
//  Popup.RelativeY := 60;
//  Popup.RelativeX := -200;
//  Popup.RelativePosition := TRelativePosition.b_t;
//  Popup.ArrowLocation := TArrowLocation.right;
//  Popup.Target := btnCollaborators;

  CDS.FileName := UniServerModule.StartPath + '\dados.dat';
  if not FileExists(CDS.FileName) then
    CDS.CreateDataSet;
  CDS.LoadFromFile(CDS.FileName);
  CDS.Open;
  CDS.Filter := 'AND Year = ' + YearOf(Now).ToString;

  if AggregateCDSSumValue.AsVariant = Null then
    Value := 0
  else
    Value := AggregateCDSSumValue.AsVariant;

  if (Value < 175) and (MonthOf(Now) = 12) then
  begin
    pgcJson.ActivePage := tabDonate;
    pgrWizardDonate.Position := Round(Value);
    pgrWizardDonate.Text := 'Donated so far $' + Value.ToString;
  end
  else
    pgcJson.ActivePage := tabJson;

  LoadCoallaborators;
end;

procedure TMainForm.UniFormDestroy(Sender: TObject);
begin
  //FreeAndNil(Popup);
end;

procedure TMainForm.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    Admin := True;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
