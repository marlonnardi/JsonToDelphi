unit Mainm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniMemo, unimMemo, unimScrollBox, uniButton, unimButton,
  uniPanel, uniHTMLFrame, unimHTMLFrame, uniImage, unimImage, unimPanel;

type
  TMainmForm = class(TUnimForm)
    memJson: TUnimMemo;
    scrMaster: TUnimScrollBox;
    btnGenerate: TUnimButton;
    btnValidate: TUnimButton;
    btnSample: TUnimButton;
    btnDonate: TUnimButton;
    pnlFalcon: TUnimPanel;
    imgFalcon: TUnimImage;
    procedure UnimFormShow(Sender: TObject);
    procedure UnimFormTitleButtonClick(Sender: TUnimTitleButton);
    procedure UnimFormResize(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnDonateClick(Sender: TObject);
    procedure btnValidateClick(Sender: TObject);
    procedure imgFalconClick(Sender: TObject);
  private
    { Private declarations }
    procedure DefineRegrasLayout;
  public
    { Public declarations }
  end;

function MainmForm: TMainmForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, UniFSConfirm, uFrmmGenerateUnit, uFrmmNavigation;

function MainmForm: TMainmForm;
begin
  Result := TMainmForm(UniMainModule.GetFormInstance(TMainmForm));
end;

procedure TMainmForm.btnDonateClick(Sender: TObject);
begin
  frmmNavigation.Caption := 'Donate PayPal';
  frmmNavigation.url.URL := 'https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=Z3JZ3GU9SGCLU&source=url';
  frmmNavigation.Show();
end;

procedure TMainmForm.btnGenerateClick(Sender: TObject);
begin
  frmmGenerateUnit.Show();
end;

procedure TMainmForm.btnValidateClick(Sender: TObject);
begin
  frmmNavigation.Caption := 'Validate JSON';
  frmmNavigation.url.URL := 'https://jsonformatter.curiousconcept.com';
  frmmNavigation.Show();
end;

procedure TMainmForm.DefineRegrasLayout;
begin
end;

procedure TMainmForm.imgFalconClick(Sender: TObject);
begin
  frmmNavigation.Caption := 'About Marlon Nardi';
  frmmNavigation.url.URL := 'https://falconsistemas.com.br';
  frmmNavigation.Show();
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
