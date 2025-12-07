{*******************************************************************************
                                 Falcon Sistemas

                          www.falconsistemas.com.br
                         suporte@falconsistemas.com.br
                 Written by Marlon Nardi - ALL RIGHTS RESERVED.

*******************************************************************************}

unit UniFSBadgeText;

interface

uses
  System.Classes, 
  System.SysUtils, 
  uniGUIApplication, 
  uniGUIClasses, 
  uniGUITypes,
  uniBitBtn, 
  UniFSCommon;

type
  TUniFSBadgeText = class(TPersistent)
  private
    FControl: TUniControl;

    FText: string;
    FTextColor: string;
    FTextSize: Integer;
    FBackGroundColor: string;
    FVisible: Boolean;
    FTextStyle: string;

    procedure SetText(Value: string);
    procedure SetTextColor(Value: string);
    procedure SetTextStyle(Value: string);
    procedure SetVisible(Value: Boolean);
    procedure SetBackGroundColor(Value: string);
    procedure SetFontSize(Value: Integer);
  protected
    procedure ExecJS(JS: string);
  public
    constructor Create(Control: TUniControl);
  published
    property Text: string read FText write SetText;
    property TextColor: string read FTextColor write SetTextColor;
    property TextSize: Integer read FTextSize write SetFontSize;
    property TextStyle: string read FTextStyle write SetTextStyle;
    property BackgroundColor: string read FBackGroundColor write SetBackGroundColor;
    property Visible: Boolean read FVisible write SetVisible default False;
  end;

implementation

{ TUniFSBadgeText }

constructor TUniFSBadgeText.Create(Control: TUniControl);
begin
  FControl := Control;

  Self.FText := '0';
  Self.FTextColor := '#FFFFFF';
  Self.FTextSize := 10;
  Self.FTextStyle := 'bold';
  Self.FBackGroundColor := '#D50000';

  if FControl.WebMode then
    TUniBitBtn(FControl).ClientEvents.UniEvents.Values['beforeInit'] :=
      'function(sender, config){'+
      ' config.style={''overflow'': ''visible''};'+
      ' sender.action = ''badgetext'';'+
      ' sender.plugins = [{'+
      '  ptype:''badgetext'','+
      '  defaultText: 0,'+
      '  disableOpacity:1,'+
      '  disableBg: ''#CC4C33'','+
      '  align:''right'' '+
      ' }];'+
      '}';
end;

procedure TUniFSBadgeText.ExecJS(JS: string);
begin
  if (FControl.WebMode) and (not FControl.IsLoading) then
    UniSession.AddJS(JS);
end;

procedure TUniFSBadgeText.SetBackGroundColor(Value: string);
begin
  FBackGroundColor := Value;
  ExecJS('if (typeof ('+FControl.JSName+'.badgeEl) != "undefined") {'+
    FControl.JSName+'.badgeEl.setStyle(''background-color'', "'+Value+'");}');
end;

procedure TUniFSBadgeText.SetFontSize(Value: Integer);
begin
  FTextSize := Value;
  ExecJS('if (typeof ('+FControl.JSName+'.badgeEl) != "undefined") {'+
    FControl.JSName+'.badgeEl.setStyle(''font-size'', "'+IntToStr(Value)+'px");}');
end;

procedure TUniFSBadgeText.SetText(Value: string);
begin
  FText := Value;
  ExecJS('if (typeof ('+FControl.JSName+'.badgeEl) != "undefined") {'+
    FControl.JSName+'.setBadgeText("'+Value+'");}');
end;

procedure TUniFSBadgeText.SetTextColor(Value: string);
begin
  FTextColor := Value;
  ExecJS('if (typeof ('+FControl.JSName+'.badgeEl) != "undefined") {'+
    FControl.JSName+'.badgeEl.setStyle(''color'', "'+Value+'");}');
end;

procedure TUniFSBadgeText.SetTextStyle(Value: string);
begin
  FTextStyle := Value;
  ExecJS('if (typeof ('+FControl.JSName+'.badgeEl) != "undefined") {'+
    FControl.JSName+'.badgeEl.setStyle(''font-weight'', "'+Value+'");}');
end;

procedure TUniFSBadgeText.SetVisible(Value: Boolean);
begin
  FVisible := Value;
  if FVisible then
  begin
    ExecJS('if (typeof ('+FControl.JSName+'.badgeEl) != "undefined") {'+
      FControl.JSName+'.badgeEl.show();}');
  end
  else
  begin
    ExecJS('if (typeof ('+FControl.JSName+'.badgeEl) != "undefined") {'+
      FControl.JSName+'.badgeEl.hide();}');
  end;
end;

initialization
  UniAddJSLibrary(CDN+'falcon/js/falcon.components.min.js?v=7', CDNENABLED, [upoFolderUni, upoPlatformBoth]);

end.
