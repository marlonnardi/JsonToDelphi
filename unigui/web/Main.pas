unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIRegClasses,
  uniGUIForm, uniLabel, uniGUIBaseClasses, uniPanel, uniMemo, uniHTMLFrame,
  uniSplitter, uniRadioGroup, uniButton, uniBitBtn, UniFSButton, uniImage,
  UniFSConfirm, UniFSPopup, Pkg.Json.Mapper, Pkg.Json.DTO, Pkg.Json.Settings,
  uniTimer, uniCheckBox, uniGroupBox, UniFSToast, uniPageControl, uniProgressBar,
  uniDBNavigator, Data.DB, Datasnap.DBClient, uniBasicGrid, uniDBGrid,
  System.DateUtils, System.NetEncoding;

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
    btnCollaborators1: TUniFSButton;
    lbl1Password: TUniLabel;
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
    FModernFrame: TUniHTMLFrame;

    procedure DefineRegrasLayout;
    procedure AlinhamentoCenter;
    procedure ApplyModernLayout;
    procedure BindModernHtml;
    function DecodeAjaxParam(const AValue: string): string;
    function HtmlEncode(const AValue: string): string;
    function ModernHtml: string;
    procedure ModernFrameAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);
    procedure RenderModernHtml;

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

procedure TMainForm.ApplyModernLayout;
begin
  pnlMaster.Visible := False;
  pnlBottom.Visible := False;
  RenderModernHtml;
end;

procedure TMainForm.BindModernHtml;
begin
  if not Assigned(FModernFrame) then
    Exit;

  UniSession.AddJS(
    '(function(){' +
    'function boot(){' +
    'var root=document.getElementById("jtd-app");if(!root){setTimeout(boot,80);return;}' +
    'var memo=document.getElementById("jtd-json");' +
    'function val(id){var el=document.getElementById(id);return el&&el.checked?"1":"0";}' +
    'function json(){return memo?memo.value:"";}' +
    'function loading(on){root.classList.toggle("is-loading",!!on);}' +
    'function send(ev){loading(true);ajaxRequest(' + FModernFrame.JSName + ',ev,["json="+encodeURIComponent(json()),"pascal="+val("jtd-pascal"),"attr="+val("jtd-attr"),"zero="+val("jtd-zero"),"postfix="+val("jtd-postfix")]);}' +
    'var generate=document.getElementById("jtd-generate");if(generate){generate.onclick=function(){send("modern_generate");};}' +
    'var sample=document.getElementById("jtd-sample");if(sample){sample.onclick=function(){send("modern_sample");};}' +
    'var collab=document.getElementById("jtd-collab");if(collab){collab.onclick=function(){send("modern_collaborators");};}' +
    'var validate=document.getElementById("jtd-validate");if(validate){validate.onclick=function(){window.open("https://jsonformatter.curiousconcept.com","_blank");};}' +
    'var paypalTop=document.getElementById("jtd-paypal-top");if(paypalTop){paypalTop.onclick=function(){ajaxRequest(' + FModernFrame.JSName + ',"modern_donate_paypal",[]);window.open("https://www.paypal.com/donate/?hosted_button_id=Z3JZ3GU9SGCLU","_blank");};}' +
    'var paypal=document.getElementById("jtd-paypal");if(paypal){paypal.onclick=function(){ajaxRequest(' + FModernFrame.JSName + ',"modern_donate_paypal",[]);window.open("https://www.paypal.com/donate/?hosted_button_id=Z3JZ3GU9SGCLU","_blank");};}' +
    'var brl=document.getElementById("jtd-brl");if(brl){brl.onclick=function(){window.open("https://www.asaas.com/c/909894685171","_blank");};}' +
    'var clear=document.getElementById("jtd-clear");if(clear){clear.onclick=function(){if(memo){memo.value="";memo.focus();}};}' +
    'var pretty=document.getElementById("jtd-pretty");if(pretty){pretty.onclick=function(){try{if(memo){memo.value=JSON.stringify(JSON.parse(memo.value),null,2);}}catch(e){send("modern_validate_local");}};}' +
    'window.jtdStopLoading=function(){var r=document.getElementById("jtd-app");if(r){r.classList.remove("is-loading");}};' +
    'root.classList.remove("is-loading");' +
    '}' +
    'setTimeout(boot,80);' +
    '})();');
end;

function TMainForm.DecodeAjaxParam(const AValue: string): string;
begin
  try
    Result := TNetEncoding.URL.Decode(StringReplace(AValue, '+', '%2B', [rfReplaceAll]));
  except
    Result := AValue;
  end;
end;

function TMainForm.HtmlEncode(const AValue: string): string;
begin
  Result := AValue;
  Result := StringReplace(Result, '&', '&amp;', [rfReplaceAll]);
  Result := StringReplace(Result, '<', '&lt;', [rfReplaceAll]);
  Result := StringReplace(Result, '>', '&gt;', [rfReplaceAll]);
  Result := StringReplace(Result, '"', '&quot;', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '&#39;', [rfReplaceAll]);
end;

procedure TMainForm.btnCollaboratorsClick(Sender: TObject);
var
  vColab: string;
begin
  CDS.Last;
  while not CDS.Bof do
  begin
    vColab := vColab + CDS.FieldByName('Date').AsString+' | '+CDS.FieldByName('Name').AsString+' | <b>$'+FloatToStr(CDS.FieldByName('Value').AsFloat)+'</b></br>';
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
    '<p><i class="fab fa-lg fa-github"></i><a href="https://github.com/marlonnardi/JsonToDelphi/tree/master?tab=readme-ov-file#fixes--features-7th-december-2025" target="_blank"> News Fixes & Features</a></p></br> '+
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

procedure TMainForm.ModernFrameAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
begin
  try
    if SameText(EventName, 'modern_generate') then
    begin
      memJson.Lines.Text := DecodeAjaxParam(Params.Values['json']);
      chkUsePascalCase.Checked := Params.Values['pascal'] = '1';
      chkAddJsonPropertyAttributes.Checked := Params.Values['attr'] = '1';
      chkSuppressZeroDate.Checked := Params.Values['zero'] = '1';
      chkPostfixClassNames.Checked := Params.Values['postfix'] = '1';
      btnGenerateClick(Sender);
      UniSession.AddJS('if(window.jtdStopLoading){window.jtdStopLoading();}');
      Exit;
    end;

    if SameText(EventName, 'modern_sample') then
    begin
      btnSampleClick(Sender);
      UniSession.AddJS('if(window.jtdStopLoading){window.jtdStopLoading();}');
      Exit;
    end;

    if SameText(EventName, 'modern_collaborators') then
    begin
      btnCollaboratorsClick(Sender);
      UniSession.AddJS('if(window.jtdStopLoading){window.jtdStopLoading();}');
      Exit;
    end;

    if SameText(EventName, 'modern_donate_paypal') then
    begin
      lblDoacaoClick(Sender);
      Exit;
    end;

    if SameText(EventName, 'modern_validate_local') then
    begin
      ShowAlert('JSON Invalid, please check!', '');
      UniSession.AddJS('if(window.jtdStopLoading){window.jtdStopLoading();}');
      Exit;
    end;
  except
    on E: Exception do
    begin
      UniSession.AddJS('if(window.jtdStopLoading){window.jtdStopLoading();}');
      raise;
    end;
  end;
end;

function TMainForm.ModernHtml: string;
var
  HTML: TStringList;
  LJson: string;
begin
  LJson := HtmlEncode(memJson.Lines.Text);

  HTML := TStringList.Create;
  try
    HTML.Add('<div id="jtd-app" class="jtd-html-app">');
    HTML.Add('  <div class="jtd-page-bg"></div>');
    HTML.Add('  <main class="jtd-workspace">');
    HTML.Add('    <section class="jtd-hero-panel">');
    HTML.Add('      <div class="jtd-brand">');
    HTML.Add('        <span class="jtd-logo"><i class="fas fa-code"></i></span>');
    HTML.Add('        <div><h1>Json To Delphi Class</h1><p>Generate Delphi, Pascal and DTO classes from JSON online.</p></div>');
    HTML.Add('      </div>');
    HTML.Add('      <div class="jtd-hero-actions">');
    HTML.Add('        <button type="button" id="jtd-paypal-top"><i class="fab fa-paypal"></i> Donate</button>');
    HTML.Add('        <a href="https://github.com/marlonnardi/JsonToDelphi" target="_blank" rel="noopener"><i class="fab fa-github"></i> GitHub</a>');
    HTML.Add('        <a href="https://store.falconsistemas.com.br" target="_blank" rel="noopener"><i class="fas fa-star"></i> Delphi components</a>');
    HTML.Add('      </div>');
    HTML.Add('      <div class="jtd-hero-copy">');
    HTML.Add('        <span>JSON to Delphi class generator</span>');
    HTML.Add('        <h2>Paste JSON. Get clean Delphi DTO code.</h2>');
    HTML.Add('        <p>Build PascalCase models, optional JsonProperty attributes and ready-to-use classes for Delphi projects.</p>');
    HTML.Add('      </div>');
    HTML.Add('      <div class="jtd-mini-stats">');
    HTML.Add('        <div><b>DTO</b><span>Serializable models</span></div>');
    HTML.Add('        <div><b>JSON</b><span>Pretty validation</span></div>');
    HTML.Add('        <div><b>Pascal</b><span>Delphi friendly</span></div>');
    HTML.Add('      </div>');
    HTML.Add('    </section>');
    HTML.Add('    <section class="jtd-editor-card">');
    HTML.Add('      <div class="jtd-editor-top">');
    HTML.Add('        <div><strong>Input JSON</strong><span>Paste an object, array or API response.</span></div>');
    HTML.Add('        <div class="jtd-editor-tools">');
    HTML.Add('          <button type="button" id="jtd-pretty"><i class="fas fa-align-left"></i> Pretty</button>');
    HTML.Add('          <button type="button" id="jtd-clear"><i class="far fa-trash-alt"></i> Clear</button>');
    HTML.Add('        </div>');
    HTML.Add('      </div>');
    HTML.Add('      <textarea id="jtd-json" spellcheck="false" placeholder="{&#10;  &quot;id&quot;: 1,&#10;  &quot;name&quot;: &quot;Delphi&quot;&#10;}">' + LJson + '</textarea>');
    HTML.Add('    </section>');
    HTML.Add('    <section class="jtd-command-row">');
    HTML.Add('      <button type="button" id="jtd-generate" class="jtd-btn-primary"><i class="fas fa-bolt"></i><span>Generate Unit</span></button>');
    HTML.Add('      <button type="button" id="jtd-validate" class="jtd-btn-muted"><i class="fas fa-check-double"></i><span>Validate JSON</span></button>');
    HTML.Add('      <button type="button" id="jtd-sample" class="jtd-btn-muted"><i class="far fa-file-code"></i><span>Sample Use</span></button>');
    HTML.Add('      <a class="jtd-news" href="https://github.com/marlonnardi/JsonToDelphi/tree/master?tab=readme-ov-file#fixes--features-7th-december-2025" target="_blank" rel="noopener"><i class="fab fa-github"></i> News, fixes and features</a>');
    HTML.Add('    </section>');
    HTML.Add('    <section class="jtd-lower-grid">');
    HTML.Add('      <article class="jtd-options-card">');
    HTML.Add('        <div class="jtd-card-title"><span>Generation options</span><small>Configure the generated Delphi unit</small></div>');
    HTML.Add('        <label><input id="jtd-pascal" type="checkbox" checked><span>Use Pascal Case</span></label>');
    HTML.Add('        <label><input id="jtd-attr" type="checkbox"><span>Add JsonProperty Attributes</span></label>');
    HTML.Add('        <label><input id="jtd-zero" type="checkbox" checked><span>Suppress Zero Date</span></label>');
    HTML.Add('        <label><input id="jtd-postfix" type="checkbox"><span>Postfix class names</span></label>');
    HTML.Add('      </article>');
    HTML.Add('      <article class="jtd-partners-card">');
    HTML.Add('        <div class="jtd-card-title"><span>Support the project</span><small>Partners, donations and contributors</small></div>');
    HTML.Add('        <div class="jtd-donate-row">');
    HTML.Add('          <button type="button" id="jtd-paypal"><i class="fab fa-paypal"></i> Donate</button>');
    HTML.Add('          <button type="button" id="jtd-brl"><i class="fas fa-coins"></i> Donate in BRL</button>');
    HTML.Add('          <button type="button" id="jtd-collab" aria-label="Collaborators"><i class="fas fa-comment-dollar"></i></button>');
    HTML.Add('        </div>');
    HTML.Add('        <div class="jtd-partners">');
    HTML.Add('          <a href="https://www.financeiro.app" target="_blank" rel="noopener">Falcon Finanças</a>');
    HTML.Add('          <a href="https://aff.trypipedrive.com/23yha0go7t8z" target="_blank" rel="noopener">pipedrive</a>');
    HTML.Add('          <a href="https://1password.partnerlinks.io/tzvgyyqd3rr3" target="_blank" rel="noopener">1Password</a>');
    HTML.Add('        </div>');
    HTML.Add('      </article>');
    HTML.Add('    </section>');
    HTML.Add('    <footer class="jtd-footer-html"><span>' + HtmlEncode(lblVersion.Caption) + '</span><a href="https://www.falconsistemas.com.br" target="_blank" rel="noopener">Powered by Falcon Sistemas</a></footer>');
    HTML.Add('  </main>');
    HTML.Add('  <div class="jtd-loading"><span></span><b>Generating Delphi unit...</b></div>');
    HTML.Add('</div>');

    Result := HTML.Text;
  finally
    FreeAndNil(HTML);
  end;
end;

procedure TMainForm.OnClickPopup(Sender: TObject);
begin
  case FIdMessage of
    0: UniSession.UrlRedirect('https://store.falconsistemas.com.br');
    1: UniSession.UrlRedirect('https://financeiro.app/');
  end;
end;

procedure TMainForm.RenderModernHtml;
begin
  if not Assigned(FModernFrame) then
  begin
    FModernFrame := TUniHTMLFrame.Create(Self);
    FModernFrame.Parent := Self;
    FModernFrame.Align := alClient;
    FModernFrame.AutoScroll := True;
    FModernFrame.OnAjaxEvent := ModernFrameAjaxEvent;
  end;

  FModernFrame.HTML.Text := ModernHtml;
  FModernFrame.BringToFront;
  BindModernHtml;
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
  ApplyModernLayout;
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

  CDS.FileName := UniServerModule.StartPath + '\dados.dat';
  if not FileExists(CDS.FileName) then
    CDS.CreateDataSet;
  CDS.LoadFromFile(CDS.FileName);
  CDS.Open;
  CDS.Filter := 'AND Year in (' + YearOf(Now).ToString + ',' + (YearOf(Now)-1).ToString + ')';

  if AggregateCDSSumValue.AsVariant = Null then
    Value := 0
  else
    Value := AggregateCDSSumValue.AsVariant;

  if (Value < 80) and ((MonthOf(Now) = 12) or (MonthOf(Now) = 1)) then
  begin
    pgcJson.ActivePage := tabDonate;
    pgrWizardDonate.Position := Round(Value);
    pgrWizardDonate.Text := 'Donations so far';
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
