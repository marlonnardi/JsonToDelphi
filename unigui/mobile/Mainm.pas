unit Mainm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniMemo, unimMemo, unimScrollBox, uniButton, unimButton,
  uniPanel, uniHTMLFrame, unimHTMLFrame, uniImage, unimImage, unimPanel, Pkg.Json.DTO, Pkg.Json.Mapper,
  uniLabel, unimLabel, UniFSConfirm, uniTimer;

type
  TMainmForm = class(TUnimForm)
    memJson: TUnimMemo;
    scrMaster: TUnimScrollBox;
    btnGenerate: TUnimButton;
    btnValidate: TUnimButton;
    btnSample: TUnimButton;
    pnlFalcon: TUnimPanel;
    imgFalcon: TUnimImage;
    lblDoacao: TUnimLabel;
    Confirm: TUniFSConfirm;
    tmr: TUniTimer;
    procedure UnimFormShow(Sender: TObject);
    procedure UnimFormTitleButtonClick(Sender: TUnimTitleButton);
    procedure UnimFormResize(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure imgFalconClick(Sender: TObject);
    procedure btnSampleClick(Sender: TObject);
    procedure tmrTimer(Sender: TObject);
  private
    { Private declarations }
    jm : TPkgJsonMapper;

    procedure DefineRegrasLayout;
  public
    { Public declarations }
    procedure ShowMessageAlert(Title, Msg: string);
  end;

function MainmForm: TMainmForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, uFrmmGenerateUnit, uFrmmNavigation, uFrmmSamples;

function MainmForm: TMainmForm;
begin
  Result := TMainmForm(UniMainModule.GetFormInstance(TMainmForm));
end;

procedure TMainmForm.btnGenerateClick(Sender: TObject);
var
  vJson : string;
begin
  vJson := Trim(memJson.Lines.Text);

  if Length(vJson) <= 4 then
  begin
    ShowMessageAlert('Enter JSON','Input Json to generate class');
    Exit;
  end;

  try
    vJson := TJsonDTO.PrettyPrintJSON(vJson);
    memJson.Lines.Clear;
    memJson.Lines.Add(vJson)
  except
    on e: Exception do
    begin
      ShowMessage('JSON Invalid, please chek!');
      Exit;
    end;
  end;

  try
    if jm = nil then
      jm := TPkgJsonMapper.Create();

    jm.DestinationUnitName := 'RootUnit';
    jm.Parse(memJson.Text);

    frmmGenerateUnit.memSyntax.Text := jm.GenerateUnit;
    frmmGenerateUnit.Show();
  except
    on e: Exception do
    begin
      ShowMessage('JSON Invalid, please chek. </br></br>'+ e.Message);
    end;
  end;

end;

procedure TMainmForm.btnSampleClick(Sender: TObject);
begin
  frmmSamples.Show();
end;

procedure TMainmForm.DefineRegrasLayout;
begin
  lblDoacao.Caption :=
  '<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank"> '+
  '<input type="hidden" name="cmd" value="_s-xclick" /> '+
  '<input type="hidden" name="hosted_button_id" value="Z3JZ3GU9SGCLU" /> '+
  '<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" /> '+
  '</form> ';
end;

procedure TMainmForm.imgFalconClick(Sender: TObject);
begin
  frmmNavigation.Caption := 'About Marlon Nardi';
  frmmNavigation.url.URL := 'https://falconsistemas.com.br';
  frmmNavigation.Show();
end;

procedure TMainmForm.ShowMessageAlert(Title, Msg: string);
var
  Confirm: TUniFSConfirm;
begin
  Confirm := TUniFSConfirm.Create(Self);
  try
    Confirm.boxWidth := '90%';
    Confirm.Alert(Title, Msg,'fa fa-smile-o',TTypeColor.green, TTheme.modern);
  finally
    FreeAndNil(Confirm);
  end;
end;

procedure TMainmForm.tmrTimer(Sender: TObject);
begin
  Confirm.boxWidth := '90%';
  Confirm.Alert(
    'Thanks for the donations',
    'If you like this site and use it frequently, <b>make a donation to keep it up and running !</b> <br> <br>'+
    lblDoacao.Caption+'</br>'+
    'Thanks</br>'+
    '<i class=''fas fa-medal''></i> <b>Валерий Шабаков</b> $10,00 USD</br> '+
    '<i class=''fas fa-medal''></i> <b>Геннадий Малинин</b> $5,00 USD</br> '+
    '<i class=''fas fa-medal''></i> <b>Pierre Demers</b> $30,00 USD</br> '+
    '<i class=''fas fa-medal''></i> <b>Christian Späth</b> $15,00 USD',
    'fas fa-hands-helping',TTypeColor.blue, TTheme.modern);
end;

procedure TMainmForm.UnimFormResize(Sender: TObject);
begin
  imgFalcon.Left := (Self.Width div 2) - (imgFalcon.Width div 2);
end;

procedure TMainmForm.UnimFormShow(Sender: TObject);
begin
  DefineRegrasLayout;
  UniSession.AddJS('ga(''set'',''page'', ''/'+Self.Name+'.html'');');
  UniSession.AddJS('ga(''send'',''pageview'');');
end;

procedure TMainmForm.UnimFormTitleButtonClick(Sender: TUnimTitleButton);
var
  Confirm: TUniFSConfirm;
begin
  if Sender.ButtonId = 1 then
  begin
    Confirm := TUniFSConfirm.Create(Self);
    try
      Confirm.boxWidth := '100%';
      Confirm.Alert('About Donate',
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

  if Sender.ButtonId = 2 then
  begin
    Confirm := TUniFSConfirm.Create(Self);
    try
      Confirm.boxWidth := '100%';
      Confirm.Alert('Thank you all',
        'Petar Georgiev Project initial</br>'+
        'Jens Borrisholt Several New Features</br></br>'+
        'by Marlon Nardi </br></br> '+

        'I hope this list grows even more.</br>',
        'fa fa-smile-o',TTypeColor.green, TTheme.supervan);
    finally
      FreeAndNil(Confirm);
    end;
  end;

end;

initialization
  RegisterAppFormClass(TMainmForm);

end.
