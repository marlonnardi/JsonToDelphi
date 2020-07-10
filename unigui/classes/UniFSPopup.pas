{*******************************************************************************
                                 Falcon Sistemas

                           www.falconsistemas.com.br
                         suporte@falconsistemas.com.br
                 Written by Marlon Nardi - ALL RIGHTS RESERVED.

*******************************************************************************}

{$IF CompilerVersion >= 24.0} // XE3 ou superior
  {$LEGACYIFEND ON}
{$IFEND}

unit UniFSPopup;

interface

uses
  Classes, TypInfo, SysUtils, System.UITypes, uniGUIApplication, uniGUITypes,
  uniGUIClasses, uniButton, UniFSCommon;

const
  FSAbout = 'store.falconsistemas.com.br';
  PackageVersion = '1.0.0.15';

type
  TArrowLocation = (top, bottom, left, right);
  TPopupEvent = (click);
  TRelativePosition = (t_b, c_c, b_t, l_r, r_l, t_t, b_b, l_l, r_r, tr_bl, tr_br, bl_tr, br_tl);

  TOnEvents = procedure(EventName: string; Params: TUniStrings) of object;

  {$IF CompilerVersion >= 23.0}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 {$IF CompilerVersion >= 34.0}or pidLinux64{$IFEND})]
  {$IFEND}
  TUniFSPopup = class(TUniComponent)
  private
    FTarget: TUniBaseButton;
    FLoaded: Boolean;
    FWidth: Integer;
    FArrowLocation: TArrowLocation;
    FHtml: string;
    FFadeInDuration: Integer;
    FFadeOutDuration: Integer;
    FDimissDelay: Integer;
    FPopupEvent: TPopupEvent;
    FRelativeY: Integer;
    FRelativeX: Integer;
    FOnEvents: TOnEvents;
    FRelativePosition: TRelativePosition;
  protected
    function GetVersion: string;
    function GetAbout: string;

    function GetStrAllowLocation(ArrowLocation: TArrowLocation): string;
    function GetStrPopupEvent(PopupEvent: TPopupEvent): string;
    function GetStrRelativePosition(Relative: TRelativePosition): string;

    procedure WebCreate; override;
    procedure LoadCompleted; override;
    procedure BeforeLoadCompleted; override;
    procedure DOHandleEvent(EventName: string; Params: TUniStrings); override;
    procedure SetTypeCastControl(Control: TUniControl; Command: string);

    procedure ExecJS(JS: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetHtml(Value: string);
  published
    property Target: TUniBaseButton read FTarget write FTarget;
    property Width: Integer read FWidth write FWidth;
    property ArrowLocation: TArrowLocation read FArrowLocation write FArrowLocation;
    property Html: string read FHtml write SetHtml;
    property FadeInDuration: Integer read FFadeInDuration write FFadeInDuration;
    property FadeOutDuration: Integer read FFadeOutDuration write FFadeOutDuration;
    property DimissDelay: Integer read FDimissDelay write FDimissDelay;
    property PopupEvent: TPopupEvent read FPopupEvent write FPopupEvent;
    property RelativeY: Integer read FRelativeY write FRelativeY;
    property RelativeX: Integer read FRelativeX write FRelativeX;
    property RelativePosition: TRelativePosition read FRelativePosition write FRelativePosition;

    property OnEvents: TOnEvents read FOnEvents write FOnEvents;

    property About : string read GetAbout;
    property Version : string read GetVersion;
  end;

procedure Register;

implementation

uses
  UniFSButton, uniBitBtn, uniSpeedButton;

procedure Register;
begin
  RegisterComponents('uniGUI Falcon', [TUniFSPopup]);
end;

{ TUniFSPopup }

procedure TUniFSPopup.BeforeLoadCompleted;
var
  StrBuilder: TStringBuilder;
begin
  inherited;
  if not FLoaded then
  begin
    FLoaded := True;

    if not Assigned(FTarget) then
      Exit;

    StrBuilder := TStringBuilder.Create;
    try
      StrBuilder.Append('function '+GetStrPopupEvent(FPopupEvent)+'(sender, eOpts) { ');
      StrBuilder.Append('  console.log("click"); ');
      StrBuilder.Append('  Ext.widget(''callout'', { ');
      StrBuilder.Append('     cls: "cartoon", ');
      StrBuilder.Append('     width: '+IntToStr(FWidth)+', ');
      StrBuilder.Append('     html: va_'+Self.JSName+', ');
      StrBuilder.Append('     calloutArrowLocation: "'+GetStrAllowLocation(FArrowLocation)+'", ');
      StrBuilder.Append('     target: "#'+Target.JSName+'_id", ');
      StrBuilder.Append('     relativePosition: "'+GetStrRelativePosition(FRelativePosition)+'", ');
      StrBuilder.Append('     relativeOffsets: ['+IntToStr(FRelativeX)+','+IntToStr(FRelativeY)+'], ');
      StrBuilder.Append('     fadeInDuration: '+IntToStr(FFadeInDuration)+', ');
      StrBuilder.Append('     fadeOutDuration: '+IntToStr(FFadeOutDuration)+', ');
      StrBuilder.Append('     dismissDelay: '+IntToStr(FDimissDelay)+', ');
      StrBuilder.Append('  }).show(); ');
      StrBuilder.Append('} ');

      SetTypeCastControl(Target, StrBuilder.ToString);
    finally
      FreeAndNil(StrBuilder);
    end;
  end;
end;

constructor TUniFSPopup.Create(AOwner: TComponent);
begin
  inherited;
  Self.FWidth := 100;
  Self.FFadeInDuration := 200;
  Self.FFadeOutDuration := 200;
  Self.FDimissDelay := 0;
  Self.FPopupEvent := TPopupEvent.click;
  Self.RelativeX := 0;
  Self.RelativeY := 10;
  Self.FRelativePosition := TRelativePosition.t_b;
end;

destructor TUniFSPopup.Destroy;
begin
  inherited;
end;

procedure TUniFSPopup.DOHandleEvent(EventName: string; Params: TUniStrings);
begin
  inherited;
  if Assigned(FOnEvents) then
    FOnEvents(EventName, Params);
end;

procedure TUniFSPopup.ExecJS(JS: string);
begin
  UniSession.AddJS(JS);
end;

function TUniFSPopup.GetAbout: string;
begin
  Result := FSAbout;
end;

function TUniFSPopup.GetStrAllowLocation(ArrowLocation: TArrowLocation): string;
begin
  Result := GetEnumName(TypeInfo(TArrowLocation), Integer(ArrowLocation));
end;

function TUniFSPopup.GetStrPopupEvent(PopupEvent: TPopupEvent): string;
begin
  Result := GetEnumName(TypeInfo(TPopupEvent), Integer(PopupEvent));
end;

function TUniFSPopup.GetStrRelativePosition(
  Relative: TRelativePosition): string;
begin
  Result := GetEnumName(TypeInfo(TRelativePosition), Integer(Relative));
  Result := StringReplace(Result,'_','-',[]);
end;

function TUniFSPopup.GetVersion: string;
begin
  Result := PackageVersion;
end;

procedure TUniFSPopup.LoadCompleted;
begin
  inherited;
end;

procedure TUniFSPopup.SetTypeCastControl(Control: TUniControl; Command: string);
begin
  if Control is TUniBitBtn then
    TUniBitBtn(Control).ClientEvents.ExtEvents.Values[Self.GetStrPopupEvent(FPopupEvent)] := Command;
  if Control is TUniButton then
    TUniButton(Control).ClientEvents.ExtEvents.Values[Self.GetStrPopupEvent(FPopupEvent)] := Command;
  if Control is TUniSpeedButton then
    TUniSpeedButton(Control).ClientEvents.ExtEvents.Values[Self.GetStrPopupEvent(FPopupEvent)] := Command;
  if Control is TUniFSButton then
    TUniFSButton(Control).ClientEvents.ExtEvents.Values[Self.GetStrPopupEvent(FPopupEvent)] := Command;
end;

procedure TUniFSPopup.SetHtml(Value: string);
begin
  FHtml := Value;
  if not IsDesigning then
    UniSession.AddJS('va_'+Self.JSName+' = "'+Value+'"; ');
end;

procedure TUniFSPopup.WebCreate;
begin
  inherited;
  JSComponent := TJSObject.JSCreate('Object');
  UniSession.AddJS('va_'+Self.JSName+' = "'+Self.Name+'"; ');
end;

initialization
  UniAddCSSLibrary(CDN+'falcon/css/cartoon.min.css', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
  UniAddCSSLibrary(CDN+'falcon/css/cartoon-style.css', CDNENABLED, [upoFolderUni, upoPlatformBoth]);
  UniAddJSLibrary(CDN+'falcon/js/callout.min.js', CDNENABLED, [upoFolderUni, upoPlatformBoth]);

end.
