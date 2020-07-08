{*******************************************************************************
                                 Falcon Sistemas

                          www.falconsistemas.com.br
                         suporte@falconsistemas.com.br
                 Written by Marlon Nardi - ALL RIGHTS RESERVED.

*******************************************************************************}

{$IF CompilerVersion >= 24.0} // XE3 ou superior
  {$LEGACYIFEND ON}
{$IFEND}

unit UniFSButton;

interface

uses
  System.Classes, uniGUIApplication, uniGUIClasses, uniGUITypes, uniBitBtn, uniButton,
  UniFSBadgeText, UniFSCommon;

const
  FSAbout = 'store.falconsistemas.com.br';
  PackageVersion = '1.3.1.140';

type
  TStyleButton = (Default, Primary, Success, Info, Warning, Danger, Purple, Butterfly, Black, Transparent,
  	GoogleNarrow, GoogleGreen, GoogleBlue, GoogleDanger, GoogleAccent, GoogleBlue2, GoogleBrow,
    GoogleSilver, GoogleYellow, GoogleOrange, GoogleBlack, GoogleBlue3, GoogleCustomMenu, GoogleDangerRound,
    GoogleBlueRound, GoogleSilverRound, GoogleGreenRound, GoogleYellowRound, GoogleNarrowRound, GoogleOrangeRound,
    TBDCRound);

  {$IF CompilerVersion >= 23.0}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64 {$IF CompilerVersion >= 34.0}or pidLinux64{$IFEND})]
  {$IFEND}
  TUniFSButton = class(TUniCustomBitBtn)
  private
    FStyleButton: TStyleButton;
    FCaptionIconFont: string;
    FBadgeText: TUniFSBadgeText;
    procedure SetCaptionIconFont(Value: string);
    procedure SetStyleButton(StyleButton: TStyleButton);
  protected
    function GetVersion: string;
    function GetAbout: string;

    procedure WebCreate; override;
    procedure LoadCompleted; override;
    procedure AfterLoadCompleted; override;
    procedure InternalSetCaption(const Value: string); override;
    function GetStrStyleButton(Style : TStyleButton): string;

    procedure ExecJS(JS: string);
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
  published
    property StyleButton: TStyleButton read FStyleButton write SetStyleButton;
    property CaptionIconFont: string read FCaptionIconFont write SetCaptionIconFont;
    property BadgeText: TUniFSBadgeText read FBadgeText write FBadgeText;

    property About : string read GetAbout;
    property Version : string read GetVersion;

    { inherited }
    property Action;
    property Glyph;

    property Caption;
    property Cancel;
    property ModalResult;
    property Align;
    property Anchors;
    property ParentFont;
    property Font;
    property TabStop;
    property TabOrder;
    property Default;
    property Transparency;
    property ClientEvents;
    property Scale;
    property ScaleButton;
    property IconAlign;
    property ScreenMask;
    property Images;
    property ImageIndex;
    property LayoutConfig;
    property Draggable;

    // events
    property OnEndDrag;
    property OnClick;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnAjaxEvent;
  end;

procedure Register;

implementation

uses
  System.TypInfo, System.SysUtils;

procedure Register;
begin
  RegisterComponents('uniGUI Falcon', [TUniFSButton]);
end;

{ TUniFSButton }

procedure TUniFSButton.ExecJS(JS: string);
begin
  if (WebMode) and (not IsLoading) then
    UniSession.AddJS(JS);
end;

function TUniFSButton.GetStrStyleButton(Style: TStyleButton): string;
begin
  Result := GetEnumName(TypeInfo(TStyleButton), Integer(Style));
  Result := StringReplace(Result,'_','-',[rfReplaceAll]);
  Result := 'fs-btn-'+LowerCase(Result);
end;

function TUniFSButton.GetVersion: string;
begin
  Result := PackageVersion;
end;

procedure TUniFSButton.InternalSetCaption(const Value: string);
begin
  inherited;
end;

function TUniFSButton.GetAbout: string;
begin
  Result := FSAbout;
end;

procedure TUniFSButton.AfterLoadCompleted;
begin
  inherited;
  FBadgeText.Visible := FBadgeText.Visible;

  if FBadgeText.Visible then
  begin
    FBadgeText.BackgroundColor := FBadgeText.BackgroundColor;
    FBadgeText.TextColor := FBadgeText.TextColor;
    FBadgeText.TextSize := FBadgeText.TextSize;
    FBadgeText.Text := FBadgeText.Text;
  end;
end;

constructor TUniFSButton.Create(Owner: TComponent);
begin
  inherited;
  Self.Height := 28;
  FStyleButton := Success;

  Self.FBadgeText := TUniFSBadgeText.Create(Self);
end;

destructor TUniFSButton.Destroy;
begin
  inherited;
  FreeAndNil(FBadgeText);
end;

procedure TUniFSButton.LoadCompleted;
var
  vO: string;
begin
  inherited;
  vO := Self.JSName;

  ExecJS(vO+'.removeCls("'+GetStrStyleButton(Success)+'");'+
         vO+'.addCls("fs-btn");'+
         vO+'.addCls("'+GetStrStyleButton(FStyleButton)+'");');

  if Self.IconAlign = iaLeft then
    JSProperty('text', [FCaptionIconFont + Self.Caption], 'setText');
  if Self.IconAlign = iaRight then
    JSProperty('text', [Self.Caption + FCaptionIconFont], 'setText');
end;

procedure TUniFSButton.SetCaptionIconFont(Value: string);
begin
  Self.FCaptionIconFont := value;

  if not IsLoading then
  begin
    if Self.IconAlign = iaLeft then
      JSProperty('text', [FCaptionIconFont + Self.Caption], 'setText');
    if Self.IconAlign = iaRight then
      JSProperty('text', [Self.Caption + FCaptionIconFont], 'setText');
  end;
end;

procedure TUniFSButton.SetStyleButton(StyleButton: TStyleButton);
begin
  if FStyleButton = StyleButton then
    Exit;

  ExecJS(Self.JSName+'.removeCls("'+GetStrStyleButton(FStyleButton)+'");');

  FStyleButton := StyleButton;

  ExecJS(Self.JSName+'.addCls("'+GetStrStyleButton(StyleButton)+'");');
end;

procedure TUniFSButton.WebCreate;
begin
  inherited;
end;

initialization
  UniAddCSSLibrary(CDN+'falcon/css/falcon.components.css', CDNENABLED, [upoFolderUni, upoPlatformBoth]);

end.
