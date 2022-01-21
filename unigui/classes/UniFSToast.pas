{*******************************************************************************
                                 Falcon Sistemas

                           www.falconsistemas.com.br
                         suporte@falconsistemas.com.br
                 Written by Marlon Nardi - ALL RIGHTS RESERVED.

                       https://izitoast.marcelodolza.com
                           https://material.io/icons
                         https://fontawesome.com/icons

*******************************************************************************}

{$IF CompilerVersion >= 24.0} // XE3 ou superior
  {$LEGACYIFEND ON}
{$IFEND}

unit UniFSToast;

interface

uses
  System.Classes, 
  System.TypInfo, 
  System.SysUtils, 
  Controls, 
  uniGUIApplication, 
  uniGUITypes, 
  uniGUIClasses, 
  UniFSCommon;

const
  FSAbout = 'store.falconsistemas.com.br';
  PackageVersion = '1.2.3.50';

type
  TToastTheme = (Dark, Light);
  TToastLayout = (SmallInt, Medium);
  TToastPosition = (bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter, center);
  TToastTransitionIn = (bounceInLeft, bounceInRight, bounceInUp, bounceInDown, fadeIn, fadeInDown, fadeInUp, fadeInLeft, fadeInRight, flipInX);
  TToastTransitionOut = (fadeOut, fadeOutUp, fadeOutDown, fadeOutLeft, fadeOutRight, flipIntX, flipOutX);
  TToastType = (Sucess, Info, Warning, Error, Show, Question, Settings);

  TButtonCallBack = reference to procedure(ToastButton: Integer);

  TOnClosePopup = procedure(Sender: TObject) of object;
  TOnShowPopup = procedure(Sender: TObject) of object;
  TOnClickPopup = procedure(Sender: TObject) of object;
  TOnButtonCustomClickPopup = procedure(Sender: TObject) of object;

  TUniFSScreenMask = class(TPersistent)
  private
    FEnabled: Boolean;
    FText: string;
  published
    property Enabled: Boolean read FEnabled write FEnabled;
    property Text: string read FText write FText;
  end;

  {$IF CompilerVersion >= 23.0}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 {$IF CompilerVersion >= 34.0}or pidLinux64{$IFEND})]
  {$IFEND}
  TUniFSToast = class(TUniComponent)
  protected
    function GetVersion: string;
    function GetAbout: string;

    function GetStrToastTheme(ToastTheme: TToastTheme): string;
    function GetStrToastLayout(ToastLayout: TToastLayout): string;
    function GetStrToastPosition(ToastPosition: TToastPosition): string;
    function GetStrToastTransitionIn(ToastTransition: TToastTransitionIn): string;
    function GetStrToastTransitionOut(ToastTransition: TToastTransitionOut): string;

    procedure WebCreate; override;
    procedure DOHandleEvent(EventName: string; Params: TUniStrings); override;
    procedure LoadCompleted; override;

    procedure RemoveInvalidChar(var InputText: string);

    function BoolToStr(const value: boolean): string; {Versions Old Delphi}
    function BuildJS(Type_: TToastType): string;

    procedure ExecJS(JS: string);
  private
    FId: string;
    FTheme: TToastTheme;
    FLayout: TToastLayout;
    FPosition: TToastPosition;
    FTransitionIn: TToastTransitionIn;
    FTransitionOut: TToastTransitionOut;
    FTitleColor: string;
    FTitleSize: Integer;
    FTitleLineHeight: Integer;
    FTitle: string;
    FMsg: string;
    FMsgColor: string;
    FMsgSize: Integer;
    FMsgLineHeight: Integer;
    FColor: string;
    FButtonTextYes: string;
    FButtonTextNo: string;
    FTimeOut: Integer;
    FIcon: string;
    FIconText: string;
    FiconColor: string;
    FBackgroundColor: string;
    FImage: string;
    FImageWidth: Integer;
    FMaxWidth: Integer;
    FzIndex: Integer;
    FBalloon: Boolean;
    FClose: Boolean;
    FCloseOnEscape: Boolean;
    FCloseOnClick: Boolean;
    FRTL: Boolean;
    FTarget: string;
    FDrag: Boolean;
    FOverlay: Boolean;
    FPauseOnHover: Boolean;
    FResetOnHover: Boolean;
    FProgressBar: Boolean;
    FProgressBarColor: string;
    FScreenMask: TUniFSScreenMask;
    FAnimateinside: Boolean;
    FTransitionInMobile: TToastTransitionIn;
    FTransitionOutMobile: TToastTransitionOut;
    FButtonCallBack: TButtonCallBack;
    FToastOnce: Boolean;
    FOnClosePopup: TOnClosePopup;
    FOnShowPopup: TOnShowPopup;
    FOnClickPopup: TOnClickPopup;
    FOnButtonCustomClickPopup: TOnButtonCustomClickPopup;
    FButtonCustomActive: Boolean;
    FButtonCustomText: string;
  published
    property Id: string read FId write FId;
    property Title: string read FTitle write FTitle;
    property TitleColor: string read FTitleColor write FTitleColor;
    property TitleSize: Integer read FTitleSize write FTitleSize;
    property TitleLineHeight: Integer read FTitleLineHeight write FTitleLineHeight;
    property Msg: string read FMsg write FMsg;
    property MsgColor: string read FMsgColor write FMsgColor;
    property MsgSize: Integer read FMsgSize write FMsgSize;
    property MsgLineHeight: Integer read FMsgLineHeight write FMsgLineHeight;
    property BackgroundColor: string read FBackgroundColor write FBackgroundColor;
    property Theme: TToastTheme read FTheme write FTheme;
    property Color: string read FColor write FColor;
    property Icon: string read FIcon write FIcon; //(font-icon of your choice, Icomoon, Fontawesome etc.)
    property IconText: string read FIconText write FIconText; //(font-icon using text, Material Icons, etc.)
    property iconColor: string read FiconColor write FiconColor;
    property Image: string read FImage write FImage;
    property ImageWidth: Integer read FImageWidth write FImageWidth;
    property MaxWidth: Integer read FMaxWidth write FMaxWidth;
    property zIndex: Integer read FzIndex write FzIndex;
    property Layout: TToastLayout read FLayout write FLayout;
    property Balloon: Boolean read FBalloon write FBalloon;
    property Close: Boolean read FClose write FClose;
    property CloseOnEscape: Boolean read FCloseOnEscape write FCloseOnEscape;
    property CloseOnClick: Boolean read FCloseOnClick write FCloseOnClick;
    property RTL: Boolean read FRTL write FRTL;
    property Position: TToastPosition read FPosition write FPosition;
    property Target: string read FTarget write FTarget;
    property TimeOut: Integer read FTimeOut write FTimeOut;
    property Drag: Boolean read FDrag write FDrag;
    property Overlay: Boolean read FOverlay write FOverlay;
    property ToastOnce: Boolean read FToastOnce write FToastOnce;
    property PauseOnHover: Boolean read FPauseOnHover write FPauseOnHover;
    property ResetOnHover: Boolean read FResetOnHover write FResetOnHover;
    property ProgressBar: Boolean read FProgressBar write FProgressBar;
    property ProgressBarColor: string read FProgressBarColor write FProgressBarColor;
    property ScreenMask: TUniFSScreenMask read FScreenMask write FScreenMask;

    property Animateinside: Boolean read FAnimateinside write FAnimateinside;
    property TransitionIn: TToastTransitionIn read FTransitionIn write FTransitionIn;
    property TransitionOut: TToastTransitionOut read FTransitionOut write FTransitionOut;
    property TransitionInMobile: TToastTransitionIn read FTransitionInMobile write FTransitionInMobile;
    property TransitionOutMobile: TToastTransitionOut read FTransitionOutMobile write FTransitionOutMobile;

    property ButtonTextYes: string read FButtonTextYes write FButtonTextYes;
    property ButtonTextNo: string read FButtonTextNo write FButtonTextNo;
    property ButtonCustomActive: Boolean read FButtonCustomActive write FButtonCustomActive;
    property ButtonCustomText: string read FButtonCustomText write FButtonCustomText;

    property About : string read GetAbout;
    property Version : string read GetVersion;

    property OnClosePopup: TOnClosePopup read FOnClosePopup write FOnClosePopup;
    property OnShowPopup: TOnShowPopup read FOnShowPopup write FOnShowPopup;
    property OnClickPopup: TOnClickPopup read FOnClickPopup write FOnClickPopup;
    property OnButtonCustomClickPopup: TOnButtonCustomClickPopup read FOnButtonCustomClickPopup write FOnButtonCustomClickPopup;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Clear;

    procedure Success(Title, Msg: string) overload;
    procedure Success(Title, Msg: string; Position: TToastPosition) overload;
    procedure Info(Title, Msg: string) overload;
    procedure Info(Title, Msg: string; Position: TToastPosition) overload;
    procedure Warning(Title, Msg: string) overload;
    procedure Warning(Title, Msg: string; Position: TToastPosition) overload;
    procedure Error(Title, Msg: string) overload;
    procedure Error(Title, Msg: string; Position: TToastPosition) overload;
    procedure Error(Title, Msg, Icon: string; Position: TToastPosition) overload;
    procedure Show();
    procedure CloseAll();
    procedure Question(const Title, Msg: string; ButtonCallBack: TButtonCallBack);
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('uniGUI Falcon', [TUniFSToast]);
end;

{ TFSToast }

function TUniFSToast.BoolToStr(const value: boolean): string;
begin
  if value then Result := 'true' else Result := 'false';
end;

function TUniFSToast.BuildJS(Type_: TToastType): string;
var
  StrBuilder: TStringBuilder;
begin
  RemoveInvalidChar(FTitle);
  RemoveInvalidChar(FMsg);
  StrBuilder := TStringBuilder.Create;
  try
    with StrBuilder do
    begin
      if Type_ = TToastType.Show then
      begin
        Append(' title: '''+FTitle+''',');
        Append(' titleColor: '''+FTitleColor+''',');
        if FTitleSize > 0 then
          Append(' titleSize: '''+IntToStr(FTitleSize)+''',');
        if FTitleLineHeight > 0 then
          Append(' titleLineHeight: '''+IntToStr(FTitleLineHeight)+''',');
        Append(' message: '''+FMsg+''',');
        Append(' messageColor: '''+FMsgColor+''',');
        if FMsgSize > 0 then
          Append(' messageSize: '''+IntToStr(FMsgSize)+''',');
        if FMsgLineHeight > 0 then
          Append(' messageLineHeight: '''+IntToStr(FMsgLineHeight)+''',');
        Append(' backgroundColor: '''+FBackgroundColor+''',');
        Append(' theme: '''+GetStrToastTheme(FTheme)+''',');
        Append(' color: '''+FColor+''',');
        Append(' position: '''+GetStrToastPosition(FPosition)+''',');
        Append(' image: '''+FImage+''',');
        if (FImage <> EmptyStr) and (FImageWidth > 0) then
          Append(' imageWidth: '''+IntToStr(FImageWidth)+''',');
        if FMaxWidth > 0 then
          Append(' maxWidth: '''+IntToStr(FMaxWidth)+''',');
        Append(' layout: '''+IntToStr(Integer(FLayout)+1)+''',');
        Append(' balloon: '+BoolToStr(FBalloon)+',');
        Append(' close: '+BoolToStr(FClose)+',');
        Append(' closeOnEscape: '+BoolToStr(FCloseOnEscape)+',');
        Append(' closeOnClick: '+BoolToStr(FCloseOnClick)+',');
        Append(' rtl: '+BoolToStr(FRTL)+',');
        Append(' position: '''+GetStrToastPosition(FPosition)+''',');
        Append(' timeout: '+IntToStr(FTimeOut)+',');
        Append(' drag: '+BoolToStr(FDrag)+',');
        Append(' overlay: '+BoolToStr(FOverlay)+',');
        Append(' toastOnce: '+BoolToStr(FToastOnce)+',');
        if not FToastOnce then
          Append(' pauseOnHover: '+BoolToStr(FPauseOnHover)+',');
        if not FToastOnce then
          Append(' resetOnHover: '+BoolToStr(FResetOnHover)+',');
        Append(' progressBar: '+BoolToStr(FProgressBar)+',');
        Append(' progressBarColor: '''+FProgressBarColor+''',');
        Append(' transitionIn: '''+GetStrToastTransitionIn(FTransitionIn)+''',');
        Append(' transitionOut: '''+GetStrToastTransitionOut(FTransitionOut)+''',');
        Append(' transitionInMobile: '''+GetStrToastTransitionIn(FTransitionInMobile)+''',');
        Append(' transitionOutMobile: '''+GetStrToastTransitionOut(FTransitionOutMobile)+''',');
        Append(' iconColor: '''+FiconColor+''',');
        Append(' icon: '''+FIcon+''','); //use this Fontawesome - https://fontawesome.com/icons?d=gallery&m=free
        if FButtonCustomActive then
        begin
          Append(' buttons: [ ');
          Append('     [''<button>'+FButtonCustomText+'</button>'', function (instance, toast) { ');
          Append('         ajaxRequest('+Self.JSName+', "Toast", ["ButtonCustomClick="+"Yes"]); ');
          Append('     }, true] ');
          Append(' ], ');
        end;
      end;

      if Type_ = TToastType.Question then
      begin
        Append(' title: '''+FTitle+''',');
        Append(' message: '''+FMsg+''',');
        Append(' timeout: 0,');
        Append(' close: '+BoolToStr(FClose)+',');
        Append(' closeOnEscape: '+BoolToStr(FCloseOnEscape)+',');
        Append(' position: ''center'',');
        Append(' overlay: true,');
        Append(' layout: '''+IntToStr(Integer(FLayout)+1)+''',');
        Append(' toastOnce: true,');
        Append(' progressBar: false,');
        Append(' color: '''+FColor+''',');
        if FIcon <> EmptyStr then
          Append(' icon: '''+FIcon+''',')
        else
          Append(' icon: ''far fa-question-circle'',');
        Append(' buttons: [ ');
        Append('        [''<button><b>'+FButtonTextYes+'</b></button>'', function (instance, toast) { ');
        Append('            instance.hide({ transitionOut: ''fadeOut'' }, toast, ''button''); ');
        if ScreenMask.Enabled then
          Append('          $(''body'').preloader({text: '''+ScreenMask.Text+'''});  ');
        Append('            ajaxRequest('+Self.JSName+', "Toast", ["Button="+"Yes"]); ');
        Append('        }, true], ');
        Append('        [''<button>'+FButtonTextNo+'</button>'', function (instance, toast) { ');
        Append('            instance.hide({ transitionOut: ''fadeOut'' }, toast, ''button''); ');
        if ScreenMask.Enabled then
          Append('          $(''body'').preloader({text: '''+ScreenMask.Text+'''});  ');
        Append('            ajaxRequest('+Self.JSName+', "Toast", ["Button="+"No"]); ');
        Append('        }] ');
        Append('    ], ');
      end;

      if Type_ = TToastType.Sucess then
      begin
        Append(' title: '''+FTitle+''',');
        Append(' message: '''+FMsg+''',');
        Append(' position: '''+GetStrToastPosition(FPosition)+''',');
        Append(' transitionIn: '''+GetStrToastTransitionIn(FTransitionIn)+''',');
        Append(' icon: '''+FIcon+''',');
        Append(' closeOnClick: '+BoolToStr(FCloseOnClick)+',');
        Append(' closeOnEscape: '+BoolToStr(FCloseOnEscape)+',');
        Append(' timeout: '+IntToStr(FTimeOut)+',');
      end;
      if Type_ = TToastType.Info then
      begin
        Append(' title: '''+FTitle+''',');
        Append(' message: '''+FMsg+''',');
        Append(' position: '''+GetStrToastPosition(FPosition)+''',');
        Append(' transitionIn: '''+GetStrToastTransitionIn(FTransitionIn)+''',');
        Append(' icon: '''+FIcon+''',');
        Append(' closeOnClick: '+BoolToStr(FCloseOnClick)+',');
        Append(' closeOnEscape: '+BoolToStr(FCloseOnEscape)+',');
        Append(' timeout: '+IntToStr(FTimeOut)+',');
      end;
      if Type_ = TToastType.Warning then
      begin
        Append(' title: '''+FTitle+''',');
        Append(' message: '''+FMsg+''',');
        Append(' position: '''+GetStrToastPosition(FPosition)+''',');
        Append(' transitionIn: '''+GetStrToastTransitionIn(FTransitionIn)+''',');
        Append(' icon: '''+FIcon+''',');
        Append(' closeOnClick: '+BoolToStr(FCloseOnClick)+',');
        Append(' closeOnEscape: '+BoolToStr(FCloseOnEscape)+',');
        Append(' timeout: '+IntToStr(FTimeOut)+',');
      end;
      if Type_ = TToastType.Error then
      begin
        Append(' title: '''+FTitle+''',');
        Append(' message: '''+FMsg+''',');
        Append(' position: '''+GetStrToastPosition(FPosition)+''',');
        Append(' transitionIn: '''+GetStrToastTransitionIn(FTransitionIn)+''',');
        Append(' icon: '''+FIcon+''',');
        Append(' closeOnClick: '+BoolToStr(FCloseOnClick)+',');
        Append(' closeOnEscape: '+BoolToStr(FCloseOnEscape)+',');
        Append(' timeout: '+IntToStr(FTimeOut)+',');
      end;

      if Type_ = TToastType.Settings then
      begin
        if FTitleSize > 0 then
         Append('  titleSize: '+IntToStr(FTitleSize)+', ');
        if FMsgSize > 0 then
          Append('  messageSize: '+IntToStr(FMsgSize)+', ');
        //Append('  icon: ''material-icons'', '); //use this Material+Icons - https://material.io/icons/
      end;

      if Assigned(Self.Owner) and (Self.Owner.Name <> 'UniMainModule') and (Self.Owner.Owner.ClassName <> 'TUniMainModule') then
      begin
        Append('  onOpening: function(){ ');
        Append('    ajaxRequest('+Self.JSName+', "Toast", ["onOpening="+"Yes"]); ');
        Append('  }, ');
        Append('  onClosing: function(){ ');
        Append('    ajaxRequest('+Self.JSName+', "Toast", ["onClosing="+"Yes"]); ');
        Append('  }, ');
        Append('  onClick: function(){ ');
        Append('    ajaxRequest('+Self.JSName+', "Toast", ["onClick="+"Yes"]); ');
        Append('  }, ');
      end

    end;

    Result := StrBuilder.ToString;
  finally
    FreeAndNil(StrBuilder);
  end;

  Self.Clear;
end;

procedure TUniFSToast.Clear;
begin
  FId := EmptyStr;
  FTitle := EmptyStr;
  FTitleColor := EmptyStr;
  FMsg := EmptyStr;
  FColor := EmptyStr;
  FMsgColor := EmptyStr;
  FBackgroundColor := EmptyStr;
  FButtonTextYes := 'Confirma';
  FButtonTextNo := 'Cancela';
  FTimeOut := 5000;
  FTitleSize := 13;
  FMsgSize := 12;
  FzIndex := 99999;
  FImage := EmptyStr;
  FPauseOnHover := True;
  FProgressBar := True;
  FClose := True;
  FDrag := True;
  FOverlay := False;
  FProgressBarColor := 'rgb(0, 255, 184)';
  FAnimateinside := True;
  FTransitionIn := TToastTransitionIn.fadeInUp;
  FTransitionOut := TToastTransitionOut.fadeOut;
  FTransitionInMobile := TToastTransitionIn.fadeInUp;
  FTransitionOutMobile := TToastTransitionOut.fadeOutDown;
end;

procedure TUniFSToast.CloseAll;
begin
  Self.ExecJS('iziToast.destroy();');
end;

constructor TUniFSToast.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Clear;
  Self.FScreenMask := TUniFSScreenMask.Create;
  Self.Layout := TToastLayout.SmallInt;
end;

destructor TUniFSToast.Destroy;
begin
  inherited;
  FreeAndNil(FScreenMask);
end;

procedure TUniFSToast.DOHandleEvent(EventName: string; Params: TUniStrings);
begin
  inherited;
  if EventName = 'Toast' then
  begin
    if Assigned(FButtonCallBack) then
    begin
      if Params.Values['Button'] = 'Yes' then
        FButtonCallBack(mrYes);
      if Params.Values['Button'] = 'No' then
        FButtonCallBack(mrNo);

      if Params.Values['Button'] <> EmptyStr then
        ExecJS('$(''body'').preloader(''remove'');');
    end;

    if (Assigned(OnShowPopup)) and (Params.Values['onOpening'] = 'Yes') then
      OnShowPopup(Self);
    if (Assigned(OnClosePopup)) and (Params.Values['onClosing'] = 'Yes') then
      OnClosePopup(Self);
    if (Assigned(OnClickPopup)) and (Params.Values['onClick'] = 'Yes') then
      OnClickPopup(Self);
    if (Assigned(OnButtonCustomClickPopup)) and (Params.Values['ButtonCustomClick'] = 'Yes') then
      OnButtonCustomClickPopup(Self);
  end;
end;

procedure TUniFSToast.Error(Title, Msg: string);
begin
  Self.Error(Title, Msg, topRight);
end;

procedure TUniFSToast.Error(Title, Msg: string;
  Position: TToastPosition);
begin
  Self.Error(Title, Msg, 'fas fa-ban', Position);
end;

procedure TUniFSToast.Error(Title, Msg, Icon: string; Position: TToastPosition);
begin
  FTitle := Title;
  FMsg := Msg;
  FIcon := Icon;
  FPosition := Position;
  if FPosition in [topLeft] then
    FTransitionIn := bounceInRight;
  if FPosition in [topCenter] then
    FTransitionIn := fadeInDown;
  if FPosition in [topRight] then
    FTransitionIn := bounceInLeft;
  if FPosition in [bottomLeft] then
    FTransitionIn := bounceInRight;
  if FPosition in [bottomCenter] then
    FTransitionIn := fadeInUp;
  if FPosition in [bottomRight] then
    FTransitionIn := bounceInLeft;
  Self.ExecJS('iziToast.error({'+BuildJS(TToastType.Error)+'});');
end;

procedure TUniFSToast.ExecJS(JS: string);
begin
  UniSession.AddJS(JS);
end;

function TUniFSToast.GetAbout: string;
begin
  Result := FSAbout;
end;

function TUniFSToast.GetStrToastLayout(ToastLayout: TToastLayout): string;
begin
  Result := GetEnumName(TypeInfo(TToastLayout), Integer(ToastLayout));
end;

function TUniFSToast.GetStrToastPosition(ToastPosition: TToastPosition): string;
begin
  Result := GetEnumName(TypeInfo(TToastPosition), Integer(ToastPosition));
end;

function TUniFSToast.GetStrToastTheme(ToastTheme: TToastTheme): string;
begin
  Result := GetEnumName(TypeInfo(TToastTheme), Integer(ToastTheme));
end;

function TUniFSToast.GetStrToastTransitionIn(
  ToastTransition: TToastTransitionIn): string;
begin
  Result := GetEnumName(TypeInfo(TToastTransitionIn), Integer(ToastTransition));
end;

function TUniFSToast.GetStrToastTransitionOut(
  ToastTransition: TToastTransitionOut): string;
begin
  Result := GetEnumName(TypeInfo(TToastTransitionOut), Integer(ToastTransition));
end;

function TUniFSToast.GetVersion: string;
begin
  Result := PackageVersion;
end;

procedure TUniFSToast.Info(Title, Msg: string; Position: TToastPosition);
begin
  FTitle := Title;
  FMsg := Msg;
  FIcon := 'fas fa-exclamation';
  FPosition := Position;
  if FPosition in [topLeft] then
    FTransitionIn := bounceInRight;
  if FPosition in [topCenter] then
    FTransitionIn := fadeInDown;
  if FPosition in [topRight] then
    FTransitionIn := bounceInLeft;
  if FPosition in [bottomLeft] then
    FTransitionIn := bounceInRight;
  if FPosition in [bottomCenter] then
    FTransitionIn := fadeInUp;
  if FPosition in [bottomRight] then
    FTransitionIn := bounceInLeft;
  Self.ExecJS('iziToast.info({'+BuildJS(TToastType.Info)+'});');
end;

procedure TUniFSToast.Info(Title, Msg: string);
begin
  Self.Info(Title, Msg, bottomLeft);
end;

procedure TUniFSToast.LoadCompleted;
begin
  inherited;
  Self.ExecJS('iziToast.settings({'+BuildJS(TToastType.Settings)+'});');
end;

procedure TUniFSToast.Question(const Title, Msg: string; ButtonCallBack: TButtonCallBack);
begin
  FButtonCallBack := ButtonCallBack;
  Self.Title := Title;
  Self.Msg := Msg;
  Self.ExecJS('iziToast.question({'+BuildJS(TToastType.Question)+'});');
end;

procedure TUniFSToast.RemoveInvalidChar(var InputText: string);
begin
  InputText := StringReplace(InputText,#$D,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$A,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#$D#$A,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,#13#10,'',[rfReplaceAll]);
  InputText := StringReplace(InputText,'"','',[rfReplaceAll]);
  InputText := StringReplace(InputText,'''','',[rfReplaceAll]);
end;

procedure TUniFSToast.Show;
begin
  Self.ExecJS('iziToast.show({'+BuildJS(TToastType.Show)+'});');
end;

procedure TUniFSToast.Success(Title, Msg: string;
  Position: TToastPosition);
begin
  FTitle := Title;
  FMsg := Msg;
  FIcon := 'far fa-check-circle';
  FPosition := Position;
  if FPosition in [topLeft] then
    FTransitionIn := bounceInRight;
  if FPosition in [topCenter] then
    FTransitionIn := fadeInDown;
  if FPosition in [topRight] then
    FTransitionIn := bounceInLeft;
  if FPosition in [bottomLeft] then
    FTransitionIn := bounceInRight;
  if FPosition in [bottomCenter] then
    FTransitionIn := fadeInUp;
  if FPosition in [bottomRight] then
    FTransitionIn := bounceInLeft;
  Self.ExecJS('iziToast.success({'+BuildJS(TToastType.Sucess)+'});');
end;

procedure TUniFSToast.Success(Title, Msg: string);
begin
  Self.Success(Title, Msg, bottomRight);
end;

procedure TUniFSToast.Warning(Title, Msg: string);
begin
  Self.Warning(Title, Msg, topLeft);
end;

procedure TUniFSToast.Warning(Title, Msg: string;
  Position: TToastPosition);
begin
  FTitle := Title;
  FMsg := Msg;
  FIcon := 'fas fa-exclamation-triangle';
  FPosition := Position;
  if FPosition in [topLeft] then
    FTransitionIn := bounceInRight;
  if FPosition in [topCenter] then
    FTransitionIn := fadeInDown;
  if FPosition in [topRight] then
    FTransitionIn := bounceInLeft;
  if FPosition in [bottomLeft] then
    FTransitionIn := bounceInRight;
  if FPosition in [bottomCenter] then
    FTransitionIn := fadeInUp;
  if FPosition in [bottomRight] then
    FTransitionIn := bounceInLeft;
  Self.ExecJS('iziToast.warning({'+BuildJS(TToastType.Warning)+'});');
end;

procedure TUniFSToast.WebCreate;
begin
  inherited;
  JSComponent := TJSObject.JSCreate('Object');
end;

initialization
  UniAddCSSLibrary(CDN+'falcon/css/preloader.css?v=3', CDNENABLED, [upoAsync, upoFolderUni, upoPlatformBoth]);
  UniAddCSSLibrary(CDN+'falcon/css/iziToast.min.css?v=3', CDNENABLED, [upoAsync, upoFolderUni, upoPlatformBoth]);
  UniAddJSLibrary(CDN+'falcon/js/iziToast.min.js?v=3', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
  UniAddJSLibrary(CDN+'falcon/js/jquery.preloader.js?v=1', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
end.
