{*******************************************************************************
                                Falcon Sistemas

                           www.falconsistemas.com.br
                         suporte@falconsistemas.com.br
                 Written by Marlon Nardi - ALL RIGHTS RESERVED.

                   https://github.com/craftpip/jquery-confirm

*******************************************************************************}

{$IF CompilerVersion >= 24.0} // XE3 ou superior
  {$LEGACYIFEND ON}
{$IFEND}

unit UniFSConfirm;

interface

uses
  System.Classes,
  System.TypInfo, 
  System.SysUtils, 
  System.UITypes, 
  uniGUIApplication, 
  uniGUITypes,
  uniGUIClasses, 
  UniFSCommon;

const
  FSAbout = 'store.falconsistemas.com.br';
  PackageVersion = '1.1.3.85';

type
  TTypeConfirm = (Confirm, ConfirmOther, Alert, Dialog, Prompt, Video);
  TTypeColor = (blue, green, orange, purple, dark_, red);
  TTheme = (light, dark, modern, supervan, material, bootstrap);
  TConfirmButton = (Other, Yes, No, Ok);
  TTypePrompt = (text, password, number);
  TTypeCharCase = (LowerCase_, Normal_, UpperCase_);
  TFocusButton = (fbNone, fbConfirm, fbCancel, fbOther, fbOK);

  TButtonCallBack = reference to procedure(ConfirmButton: TConfirmButton);
  TPromptCallBack = reference to procedure(ConfirmButton: TConfirmButton; Result: string);
  TMaskCallBack = reference to procedure();

  TOnConfirm = procedure(Sender: TObject) of object;
  TOnCancel = procedure(Sender: TObject) of object;
  TOnOther = procedure(Sender: TObject) of object;

  TUniFSScreenMask = class(TPersistent)
  private
    FEnabled: Boolean;
    FText: string;
  public
    constructor Create;
  published
    property Enabled: Boolean read FEnabled write FEnabled;
    property Text: string read FText write FText;
  end;

  TUniFSPrompt = class(TPersistent)
  private
    FTypePrompt: TTypePrompt;
    FRequiredField: Boolean;
    FTextRequiredField: string;
    FCharCase: TTypeCharCase;
    FDefaultValue: string;
  public
    constructor Create;
  published
    property TypePrompt: TTypePrompt read FTypePrompt write FTypePrompt;
    property RequiredField: Boolean read FRequiredField write FRequiredField;
    property TextRequiredField: string read FTextRequiredField write FTextRequiredField;
    property CharCase: TTypeCharCase read FCharCase write FCharCase;
    property DefaultValue: string read FDefaultValue write FDefaultValue;
  end;

  {$IF CompilerVersion >= 23.0}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 {$IF CompilerVersion >= 34.0}or pidLinux64{$IFEND})]
  {$IFEND}
  TUniFSConfirm = class(TUniComponent)
  protected
    function GetVersion: string;
    function GetAbout: string;

    function GetStrTypeConfirm(TypeConfirm: TTypeConfirm): string;
    function GetStrTypeColor(TypeColor: TTypeColor): string;
    function GetStrTheme(Theme: TTheme): string;
    function GetStrTypePrompt(TypePrompt: TTypePrompt): string;
    function GetStrTypeCharCase(TypeCharCase: TTypeCharCase): string;

    procedure WebCreate; override;
    procedure DOHandleEvent(EventName: string; Params: TUniStrings); override;
    procedure LoadCompleted; override;

    procedure RemoveInvalidChar(var InputText: string); virtual;

    function BoolToStr(const value: boolean): string; {Versions Old Delphi}
    function BuildJS(TypeConfirm: TTypeConfirm): string;

    procedure ExecJS(JS: string);
  private
    FOnConfirm: TOnConfirm;
    FOnCancel: TOnCancel;
    FOnOther: TOnOther;

    FTitle: string;
    FContent: string;
    FTheme: TTheme;
    FTypeColor: TTypeColor;
    FTypeAnimated: Boolean;
    FDraggable: Boolean;
    FEscapeKey: Boolean;
    FCloseIcon: Boolean;
    FIcon: string;
    FRTL: Boolean;
    FboxWidth: string;
    FBackgroundDismiss: Boolean;
    FButtonTextConfirm: string;
    FButtonTextCancel: string;
    FButtonTextOther: string;
    FButtonTextOK: string;
    FButtonEnterConfirm: Boolean;
    FScreenMask: TUniFSScreenMask;
    FPromptType: TUniFSPrompt;
    FMsgPrompt: string;

    FAutoFocusButton: TFocusButton;
    FButtonIdCancel: string;
    FButtonIdConfirm: string;
    FButtonIdOK: string;
    FButtonIdOther: string;

    FButtonCallBack: TButtonCallBack;
    FPromptCallBack: TPromptCallBack;
  published
    property About : string read GetAbout;
    property Version : string read GetVersion;

    property Title: string read FTitle write FTitle;
    property Content: string read FContent write FContent;
    property Theme: TTheme read FTheme write FTheme;
    property TypeColor: TTypeColor read FTypeColor write FTypeColor;
    property TypeAnimated: Boolean read FTypeAnimated write FTypeAnimated;
    property Draggable: Boolean read FDraggable write FDraggable;
    property EscapeKey: Boolean read FEscapeKey write FEscapeKey;
    property CloseIcon: Boolean read FCloseIcon write FCloseIcon;
    property Icon: string read FIcon write FIcon;
    property RTL: Boolean read FRTL write FRTL;
    property boxWidth: string read FboxWidth write FboxWidth;
    property BackgroundDismiss: Boolean read FBackgroundDismiss write FBackgroundDismiss;

    property ButtonTextConfirm: string read FButtonTextConfirm write FButtonTextConfirm;
    property ButtonTextCancel: string read FButtonTextCancel write FButtonTextCancel;
    property ButtonTextOther: string read FButtonTextOther write FButtonTextOther;
    property ButtonTextOK: string read FButtonTextOK write FButtonTextOK;
    property ButtonEnterConfirm: Boolean read FButtonEnterConfirm write FButtonEnterConfirm;

    property ScreenMask: TUniFSScreenMask read FScreenMask write FScreenMask;
    property PromptType: TUniFSPrompt read FPromptType write FPromptType;

    property OnConfirm: TOnConfirm read FOnConfirm write FOnConfirm;
    property OnCancel: TOnCancel read FOnCancel write FOnCancel;
    property OnOther: TOnOther read FOnOther write FOnOther;

    property AutoFocusButton: TFocusButton read FAutoFocusButton write FAutoFocusButton;
    property ButtonIdConfirm: string read FButtonIdConfirm write FButtonIdConfirm;
    property ButtonIdCancel: string read FButtonIdCancel write FButtonIdCancel;
    property ButtonIdOther: string read FButtonIdOther write FButtonIdOther;
    property ButtonIdOK: string read FButtonIdOK write FButtonIdOK;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Clear;
    procedure ShowMask(Msg: string); overload;
    procedure ShowMask(Msg: string; Percent: Integer); overload;
    procedure ShowMask(Msg, JSName: string); overload;
    procedure ShowMaskUpdate(Msg: string; Percent: Integer); overload;
    procedure RemoveMask;

    procedure Alert(const Title, Content: string); overload;
    procedure Alert(const Title, Content, Icon: string; Color: TTypeColor; Theme: TTheme); overload;
    procedure Alert(const Title, Content, Icon: string; Color: TTypeColor; Theme: TTheme; BC: TButtonCallBack); overload;
    procedure Prompt(const Title, Msg: string; PC: TPromptCallBack); overload;
    procedure Prompt(const Title, Msg, Icon: string; Color: TTypeColor; Theme: TTheme; PC: TPromptCallBack); overload;
    procedure Question(const Title, Content: string; BC: TButtonCallBack; const TP: TTypeConfirm = Confirm); overload;
    procedure Question(const Title, Content, Icon: string; BC: TButtonCallBack; const TP: TTypeConfirm = Confirm); overload;
    procedure Question(const Title, Content, Icon: string; Color: TTypeColor; Theme: TTheme; BC: TButtonCallBack; const TP: TTypeConfirm = Confirm); overload;
    procedure Video(const Title, Content: string);
    procedure Mask(const Msg: string; M: TMaskCallBack);

    procedure SetFocusControl(Control: TUniControl; const Delay: Integer = 250);
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('uniGUI Falcon', [TUniFSConfirm]);
end;

{ TUniFSConfirm }

procedure TUniFSConfirm.Alert(const Title, Content: string);
begin
  FTitle := Title;
  FContent := Content;
  ExecJS('$.alert({'+BuildJS(TTypeConfirm.Alert)+'});');
end;

procedure TUniFSConfirm.Alert(const Title, Content, Icon: string;
  Color: TTypeColor; Theme: TTheme);
begin
  FIcon := Icon;
  FTypeColor := Color;
  FTheme := Theme;
  Alert(Title, Content);
end;

procedure TUniFSConfirm.Alert(const Title, Content, Icon: string;
  Color: TTypeColor; Theme: TTheme; BC: TButtonCallBack);
begin
  FButtonCallBack := BC;
  Alert(Title, Content, Icon, Color, Theme);
end;

function TUniFSConfirm.BoolToStr(const value: boolean): string;
begin
  if value then Result := 'true' else Result := 'false';
end;

function TUniFSConfirm.BuildJS(TypeConfirm: TTypeConfirm): string;
  function JSStr(const S: string): string;
  begin
    Result := '''' + StringReplace(StringReplace(S, '\', '\\', [rfReplaceAll]),
                                  '''', '\''', [rfReplaceAll]) + '''';
  end;
var
  StrBuilder: TStringBuilder;
  TargetKey: string;
begin
  RemoveInvalidChar(FTitle);
  RemoveInvalidChar(FContent);
  StrBuilder := TStringBuilder.Create;
  try
    case FAutoFocusButton of
      fbConfirm: TargetKey := 'confirm';
      fbCancel:  TargetKey := 'cancel';
      fbOther:   TargetKey := 'other';
      fbOK:      TargetKey := 'ok';
    else
      TargetKey := '';
    end;

    with StrBuilder do
    begin
      Append('title: '''+FTitle+''',');
      Append('content: '''+FContent+''', ');
      Append('icon: '''+FIcon+''',  ');

      Append(
        'onContentReady:function(){ if(window.FFTrap) window.FFTrap.init(this,' +
          '{targetKey:'+JSStr(TargetKey)+','+
          ' labels:{'+
            'confirm:'+JSStr(ButtonTextConfirm)+','+
            'cancel:'+JSStr(ButtonTextCancel)+','+
            'ok:'+JSStr(ButtonTextOK)+','+
            'other:'+JSStr(ButtonTextOther)+
          '}}); },'
      );
      Append('onClose:function(){ if(window.FFTrap) window.FFTrap.clean(this); },');

      Append('type: '''+GetStrTypeColor(FTypeColor)+''', ');
      Append('theme: '''+GetStrTheme(FTheme)+''', ');
      Append('closeIcon: '+BoolToStr(FCloseIcon)+', ');
      Append('typeAnimated: '+BoolToStr(FTypeAnimated)+', ');
      Append('draggable: '+BoolToStr(FDraggable)+', ');
      Append('escapeKey: '+BoolToStr(FEscapeKey)+', ');
      Append('backgroundDismiss: '+BoolToStr(FBackgroundDismiss)+', ');
      Append('rtl: '+BoolToStr(FRTL)+', ');
      Append('useBootstrap: false, ');
      Append('boxWidth: '''+FboxWidth+''', ');

      if (TypeConfirm = TTypeConfirm.Confirm) or (TypeConfirm = TTypeConfirm.ConfirmOther) then
      begin
        Append('buttons: {');
        Append('  confirma: { ');
        if FButtonEnterConfirm then
          Append('   keys: ["enter"], ');
        Append('     text: '''+FButtonTextConfirm+''', ');
        Append('     action: function() {');
        if ScreenMask.Enabled then
          Append('      $(''body'').preloader({text: '''+ScreenMask.Text+'''});  ');
        Append('        if (typeof '+Self.JSName+' !== ''undefined'') { ajaxRequest('+Self.JSName+', "Confirm", ["Button="+"Yes"]) } ');
        Append('     } ');
        Append('  },');

        Append('  cancela: { ');
        Append('     text: '''+FButtonTextCancel+''', ');
        Append('     action: function() {');
        if ScreenMask.Enabled then
          Append('      $(''body'').preloader({text: '''+ScreenMask.Text+'''});  ');
        Append('        if (typeof '+Self.JSName+' !== ''undefined'') { ajaxRequest('+Self.JSName+', "Confirm", ["Button="+"No"]) } ');
        Append('     } ');
        Append('  },');

        if TypeConfirm = TTypeConfirm.ConfirmOther then
        begin
          Append('  outro: { ');
          Append('     text: '''+FButtonTextOther+''', ');
          Append('     action: function() {');
          if ScreenMask.Enabled then
            Append('      $(''body'').preloader({text: '''+ScreenMask.Text+'''});  ');
          Append('        if (typeof '+Self.JSName+' !== ''undefined'') { ajaxRequest('+Self.JSName+', "Confirm", ["Button="+"Other"]) } ');
          Append('     } ');
          Append('  }');
        end;

        Append('}');
      end;

      if TypeConfirm = TTypeConfirm.Prompt then
      begin
        Append('content: ');
        Append('  ''<form action="" class="formName">'' + ');
        Append('  ''<div class="fs-form-group">'' + ');
        Append('  ''<label class="fs-label">'+FMsgPrompt+'</label>'' + ');
        if FPromptType.RequiredField then
          Append('  ''<input style="text-transform: '+GetStrTypeCharCase(FPromptType.CharCase)+
            '" type="'+GetStrTypePrompt(FPromptType.TypePrompt)+'" value="'+FPromptType.DefaultValue+'" class="name fs-form-control" autofocus required />'' + ')
        else
          Append('  ''<input style="text-transform: '+GetStrTypeCharCase(FPromptType.CharCase)+
            '" type="'+GetStrTypePrompt(FPromptType.TypePrompt)+'" value="'+FPromptType.DefaultValue+'" class="name fs-form-control" autofocus />'' + ');
        Append('  ''</div>'' + ');
        Append('  ''</form>'', ');

        Append('buttons: {');
        Append('  formSubmit: { ');
        if FButtonEnterConfirm then
          Append('   keys: ["enter"], ');
        Append('     text: '''+FButtonTextConfirm+''', ');
        Append('     action: function() {');
        if FPromptType.RequiredField then
        begin
          Append('if (this.$content.find(''.name'').val() === "") { ');
          Append('   $.alert({title:'''+FPromptType.TextRequiredField+''', content:'' '',  useBootstrap: false, boxWidth: '''+FboxWidth+'''}); ');
          Append('   return false; ');
          Append('}');
        end;
        if ScreenMask.Enabled then
          Append('   $(''body'').preloader({text: '''+ScreenMask.Text+'''});  ');

        if FPromptType.CharCase = TTypeCharCase.Normal_ then
          Append('   if (typeof '+Self.JSName+' !== ''undefined'') { ajaxRequest('+Self.JSName+', "Prompt", ["Button="+"Yes","result="+this.$content.find(''.name'').val()])} ')
        else
          Append('   if (typeof '+Self.JSName+' !== ''undefined'') { ajaxRequest('+Self.JSName+', "Prompt", ["Button="+"Yes","result="+this.$content.find(''.name'').val().to'+
            GetStrTypeCharCase(FPromptType.CharCase)+'()]) } ');

        Append('     } ');
        Append('  },');

        Append('  cancel: { ');
        Append('     text: '''+FButtonTextCancel+''', ');
        Append('     action: function() {');
        if ScreenMask.Enabled then
          Append('      $(''body'').preloader({text: '''+ScreenMask.Text+'''});  ');
        Append('        if (typeof '+Self.JSName+' !== ''undefined'') { ajaxRequest('+Self.JSName+', "Prompt", ["Button="+"No"]) } ');
        Append('     } ');
        Append('  }');
        Append('},');

        Append('onContentReady: function () { ');
        Append('    var jc = this; ');
        Append('    this.$content.find(''form'').on(''submit'', function (e) { ');
        Append('        e.preventDefault(); ');
        Append('        jc.$$formSubmit.trigger(''click''); ');
        Append('    }); ');
        Append('} ');
      end;

      if (TypeConfirm = TTypeConfirm.Alert) and (Assigned(FButtonCallBack)) then
      begin
        Append('buttons: {');
        Append('  specialKey: { ');
        Append('     text: '''+Self.ButtonTextOK+''', ');
        if FButtonEnterConfirm then
          Append('   keys: ["enter"], ');
        Append('     action: function() {');
        if ScreenMask.Enabled then
          Append('      $(''body'').preloader({text: '''+ScreenMask.Text+'''});  ');
        Append('        if (typeof '+Self.JSName+' !== ''undefined'') { ajaxRequest('+Self.JSName+', "Alert", ["Button="+"Ok"]) } ');
        Append('     } ');
        Append('  }');
        Append('}');
      end else if TypeConfirm = TTypeConfirm.Alert then
      begin
        Append('buttons: {');
        Append('  specialKey: { ');
        Append('     text: '''+Self.ButtonTextOK+''', ');
        Append('     keys: ["enter"], ');
        Append('     action: function() {');
        Append('        if (typeof '+Self.JSName+' !== ''undefined'') { ajaxRequest('+Self.JSName+', "Alert", ["Button="+"Ok"]) } ');
        Append('     } ');
        Append('  }');
        Append('}');
      end;

      if (TypeConfirm = TTypeConfirm.Video) then
      begin
        Append('buttons: {}');
      end;

    end;

    Result := StrBuilder.ToString;
  finally
    FreeAndNil(StrBuilder);
  end;

end;

procedure TUniFSConfirm.Clear;
begin
  FTitle := EmptyStr;
  FContent := EmptyStr;
  FIcon := EmptyStr;
  FCloseIcon := False;
end;

constructor TUniFSConfirm.Create(AOwner: TComponent);
begin
  inherited;
  FScreenMask := TUniFSScreenMask.Create;
  FPromptType := TUniFSPrompt.Create;

  FTheme := TTheme.modern;
  FButtonTextConfirm := 'Confirma';
  FButtonTextCancel := 'Cancela';
  FButtonTextOther := 'Outro';
  FButtonTextOK := 'Ok';
  FButtonEnterConfirm := True;
  FboxWidth := '420px';
  FIcon := 'far fa-smile-wink';
end;

destructor TUniFSConfirm.Destroy;
begin
  inherited;
  FreeAndNil(FScreenMask);
  FreeAndNil(FPromptType);
end;

procedure TUniFSConfirm.DOHandleEvent(EventName: string; Params: TUniStrings);
var
  vPar: string;
begin
  inherited;
  vPar := Params.Values['Button'];

  if EventName = 'Confirm' then
  begin
    if Assigned(FButtonCallBack) then
    begin
      if vPar = 'Yes' then
        FButtonCallBack(TConfirmButton.Yes);
      if vPar = 'No' then
        FButtonCallBack(TConfirmButton.No);
      if vPar = 'Ok' then
        FButtonCallBack(TConfirmButton.Ok);
      if vPar = 'Other' then
        FButtonCallBack(TConfirmButton.Other);
    end;
  end;
  if EventName = 'Prompt' then
  begin
    if Assigned(FPromptCallBack) then
    begin
      if vPar = 'Yes' then
        FPromptCallBack(TConfirmButton.Yes, Params.Values['result']);
      if vPar = 'No' then
        FPromptCallBack(TConfirmButton.No, EmptyStr);
      if vPar = 'Ok' then
        FButtonCallBack(TConfirmButton.Ok);
      if vPar = 'Other' then
        FButtonCallBack(TConfirmButton.Other);
    end;
  end;
  if EventName = 'Alert' then
  begin
    if Assigned(FButtonCallBack) then
    begin
      if vPar = 'Ok' then
        FButtonCallBack(TConfirmButton.Ok);

      FButtonCallBack := nil;
    end;
  end;

  if (EventName <> EmptyStr) and (vPar <> EmptyStr) then
    ExecJS('$(''body'').preloader(''remove'');');

  if (Assigned(FOnConfirm)) and ((vPar = 'Yes') or (vPar = 'Ok')) then
    FOnConfirm(Self);
  if (Assigned(FOnCancel)) and (vPar = 'No')  then
    FOnCancel(Self);
  if (Assigned(FOnOther)) and (vPar = 'Other')  then
    FOnOther(Self);
end;

procedure TUniFSConfirm.ExecJS(JS: string);
begin
  UniSession.AddJS(JS);
end;

function TUniFSConfirm.GetAbout: string;
begin
  Result := FSAbout;
end;

function TUniFSConfirm.GetStrTypePrompt(TypePrompt: TTypePrompt): string;
begin
  Result := GetEnumName(TypeInfo(TTypePrompt), Integer(TypePrompt));
end;

function TUniFSConfirm.GetStrTheme(Theme: TTheme): string;
begin
  Result := GetEnumName(TypeInfo(TTheme), Integer(Theme));
end;

function TUniFSConfirm.GetStrTypeCharCase(TypeCharCase: TTypeCharCase): string;
begin
  Result := GetEnumName(TypeInfo(TTypeCharCase), Integer(TypeCharCase));
  Result := StringReplace(Result, '_','',[rfReplaceAll]);
end;

function TUniFSConfirm.GetStrTypeColor(TypeColor: TTypeColor): string;
begin
  Result := GetEnumName(TypeInfo(TTypeColor), Integer(TypeColor));
  Result := StringReplace(Result, '_','',[rfReplaceAll]);
end;

function TUniFSConfirm.GetStrTypeConfirm(TypeConfirm: TTypeConfirm): string;
begin
  Result := GetEnumName(TypeInfo(TTypeConfirm), Integer(TypeConfirm));
end;

function TUniFSConfirm.GetVersion: string;
begin
  Result := PackageVersion;
end;

procedure TUniFSConfirm.LoadCompleted;
begin
  inherited;
end;

procedure TUniFSConfirm.Mask(const Msg: string; M: TMaskCallBack);
begin
  Self.ExecJS('$(''body'').preloader({text: '''+Msg+'''});');

  if Assigned(M) then
    RemoveMask;
end;

procedure TUniFSConfirm.Prompt(const Title, Msg, Icon: string;
  Color: TTypeColor; Theme: TTheme; PC: TPromptCallBack);
begin
  FIcon := Icon;
  FTypeColor := Color;
  FTheme := Theme;
  Prompt(Title, Msg, PC);
end;

procedure TUniFSConfirm.Prompt(const Title, Msg: string; PC: TPromptCallBack);
begin
  FPromptCallBack := PC;
  FTitle := Title;
  FMsgPrompt := Msg;
  FContent := EmptyStr;
  Self.ExecJS('$.confirm({'+BuildJS(TTypeConfirm.Prompt)+'});');
end;

procedure TUniFSConfirm.RemoveInvalidChar(var InputText: string);
begin
  InputText := StringReplace(InputText,#$D,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$A,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$D#$A,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13#10,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,'"','',[rfReplaceAll]);
  InputText := StringReplace(InputText,'''','',[rfReplaceAll]);
end;

procedure TUniFSConfirm.RemoveMask;
begin
  ExecJS('$(''body'').preloader(''remove'');');
  UniSession.Synchronize();
end;

procedure TUniFSConfirm.SetFocusControl(Control: TUniControl;
  const Delay: Integer);
begin
  if not Assigned(Control) then
    Exit;

  Self.ExecJS(Format('try{Ext.defer(function(){ %s.focus(true,10); }, %d);}catch(e){} ',
    [Control.JSName, Delay]));
end;

procedure TUniFSConfirm.ShowMask(Msg, JSName: string);
begin
  Self.ExecJS('$('''+JSName+''').preloader({text: '''+Msg+'''});');
  UniSession.Synchronize();
end;

procedure TUniFSConfirm.ShowMask(Msg: string; Percent: Integer);
begin
  Self.ExecJS('$(''body'').preloader({text: '''+Msg+''',percent:'''+IntToStr(Percent)+'''});');
  UniSession.Synchronize();
end;

procedure TUniFSConfirm.ShowMaskUpdate(Msg: string; Percent: Integer);
begin
  Self.ExecJS('$(''body'').preloader(''update'',{text: '''+Msg+''',percent:'''+IntToStr(Percent)+'''});');
  UniSession.Synchronize();
end;

procedure TUniFSConfirm.Video(const Title, Content: string);
begin
  FTitle := Title;
  FContent := Content;
  FIcon := EmptyStr;
  ExecJS('$.dialog({'+BuildJS(TTypeConfirm.Video)+'});');
end;

procedure TUniFSConfirm.ShowMask(Msg: string);
begin
  Self.ExecJS('$(''body'').preloader({text: '''+Msg+'''});');
  UniSession.Synchronize();
end;

procedure TUniFSConfirm.Question(const Title, Content, Icon: string;
  BC: TButtonCallBack; const TP: TTypeConfirm);
begin
  FIcon := Icon;
  Question(Title, Content, BC, TP);
end;

procedure TUniFSConfirm.Question(const Title, Content, Icon: string;
  Color: TTypeColor; Theme: TTheme; BC: TButtonCallBack; const TP: TTypeConfirm);
begin
  FIcon := Icon;
  FTypeColor := Color;
  FTheme := Theme;
  Question(Title, Content, BC, TP);
end;

procedure TUniFSConfirm.Question(const Title, Content: string; BC: TButtonCallBack;
  const TP: TTypeConfirm);
begin
  FButtonCallBack := BC;
  FTitle := Title;
  FContent := Content;

  Self.ExecJS('$.confirm({'+BuildJS(TP)+'});');
end;

procedure TUniFSConfirm.WebCreate;
begin
  inherited;
  JSComponent := TJSObject.JSCreate('Object');
end;

{ TUniFSScreenMask }

constructor TUniFSScreenMask.Create;
begin
  FText := 'Processing';
end;

{ TUniFSPrompt }

constructor TUniFSPrompt.Create;
begin
  FTextRequiredField := 'Field riquired';
  FCharCase := TTypeCharCase.Normal_;
end;

initialization
  UniAddCSSLibrary(CDN+'falcon/css/jquery-confirm.min.css?v=3', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
  UniAddCSSLibrary(CDN+'falcon/css/preloader.css?v=4', CDNENABLED, [upoAsync, upoFolderUni, upoPlatformBoth]);
  UniAddCSSLibrary(CDN+'falcon/css/jquery-confirm-style.css?v=1', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
  UniAddJSLibrary(CDN+'falcon/js/jquery-confirm.min.js?v=3', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
  UniAddJSLibrary(CDN+'falcon/js/jquery.preloader.js?v=1', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
  UniAddJSLibrary(CDN+'falcon/js/fftrap.min.js?v=5', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
end.
