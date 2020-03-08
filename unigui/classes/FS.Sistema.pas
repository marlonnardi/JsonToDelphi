{*******************************************************************************
                              Falcon Sistemas

                        www.falconsistemas.com.br
                      suporte@falconsistemas.com.br
                Written by Marlon Nardi - ALL RIGHTS RESERVED.

*******************************************************************************}
unit FS.Sistema;

{$IFDEF FPC}
{$mode objfpc}{$H+}
{$modeswitch objectivec1}
{$ENDIF}

interface

uses
  {$IFDEF MSWINDOWS}
  Windows,
  Winapi.WinSock,
  System.Win.Registry,
  Winapi.Tlhelp32,
  {$ENDIF}
  {$IF Defined(ANDROID)}
  Androidapi.JNI.Location,
  Androidapi.JNI.App,
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
    {$IFDEF FMX}
    FMX.Helpers.Android,
    {$ENDIF}
  {$ENDIF}
  {$IF Defined(ANDROID) OR Defined(IOS)}
    {$IFDEF FMX}
    FMX.Platform,
    FMX.Dialogs,
    FMX.VirtualKeyboard,
    FMX.Types,
    {$ENDIF}
  {$ENDIF}
  {$IFDEF IOS}
  //System.IOS.Sensors,
  IOSapi.UIKit,
  IOSapi.CoreLocation,
  IOSapi.Foundation,
  IOSapi.Cocoatypes,
  IOSapi.MediaPlayer,
  IOSapi.CoreGraphics,
  IOSapi.CoreImage,
  IOSapi.QuartzCore,
  IOSapi.CoreData,
  Macapi.Helpers,
  Macapi.ObjectiveC,
  Macapi.ObjCRuntime,
  Macapi.CoreFoundation,
    {$IFDEF FMX}
    FMX.Platform.IOS,
    {$ENDIF}
  {$ENDIF}
  {$IFDEF WEB_UNIGUI}
  uniGUIApplication,
  {$ENDIF}
  System.Classes,
  System.Types,
  System.SysUtils,
  System.Sensors,
  IdHashMessageDigest,
  IdTCPClient,
  IdGlobal;

const
  FURLGoole = 'google.com';
  libAudioToolbox = '/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox';
  kSystemSoundID_vibrate = $FFF;

  {$WARN SYMBOL_DEPRECATED OFF}

type
  TTypeKeyBoard = (Hide, Show);

  TSistema = class
  public
    class function GetGPSStatus(): Boolean;
    class function GetConexaoInternet(): Boolean; overload;
    class function GetConexaoInternet(Url : string): Boolean; overload;
    class function GetMD5(Text: string; const Upper: Boolean = True): string;
    class function GetNewUniqueMD5(): string;
    class function GetVersao(): string; overload;
    class function GetVersao(pFile: string): string; overload;
    class function GetIP(): string;
    class function GetOS(): string;
    class function GetSerialMotheboard(): string;
    class function GetNavegador(): string;
    class function GetProcessoAberto(ExeName: string): Boolean;
    class procedure HabilitaGPS();
    class function GetStatusBarHeight: Integer;
    class procedure Vibrate(Milliseconds: Cardinal);
    class procedure SetStatusBarColor(Color: Integer);
    class procedure SetNavigationBarColor(Color: Integer);
    class function GetDeviceName(): string;
    class function GetOSName(): string;
    class function GetOSVersion(): string;
    class function GetIsNumberPrime(N: Integer): Boolean;
    class procedure DisableSleep(Par: Boolean);
    {$IF Defined(ANDROID) OR Defined(IOS)}
    {$IFDEF FMX}
    class procedure VirtualKeyboard(KeyBoard: TTypeKeyBoard; AControl: TFmxObject);
    {$ENDIF}
    {$ENDIF}
  end;

implementation

{ TSistema }

class function TSistema.GetConexaoInternet: Boolean;
var
  TcpClient: TIdTCPClient;
begin
  Result := False;
  try
    TcpClient := TIdTCPClient.Create(nil);
    try
      TcpClient.Port := 80;
      TcpClient.ReadTimeout:=1000;
      TcpClient.ConnectTimeout:=1000;
      TcpClient.Host:=FURLGoole;
      TcpClient.IPVersion := TIdIPVersion.Id_IPv4;
      TcpClient.Connect;

      Result := TcpClient.Connected;

      if not Result then
      begin
        TcpClient.Disconnect;
        TcpClient.IPVersion := TIdIPVersion.Id_IPv6;
        TcpClient.Connect;
        Result := TcpClient.Connected;
      end;

    except
      on e: exception do
      begin
        try
          TcpClient.IPVersion := TIdIPVersion.Id_IPv6;
          TcpClient.Connect;
          Result := TcpClient.Connected;
        except
          //
        end;
      end;
    end;
  finally
    FreeAndNil(TcpClient);
  end;
end;

class function TSistema.GetMD5(Text: string; const Upper: Boolean = True): string;
var
  idmd5: TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    if Upper then
      Result := UpperCase(idmd5.HashStringAsHex(Text))
    else
      Result := LowerCase(idmd5.HashStringAsHex(Text));
  finally
    idmd5.Free;
  end;
end;

class function TSistema.GetVersao: string;
var
  {$IFDEF MSWINDOWS}
  verinfosize: dword;
  verinfo: pointer;
  vervaluesize: dword;
  vervalue: pvsfixedfileinfo;
  dummy: dword;
  {$ENDIF}
  {$IFDEF ANDROID}
  PackageManager: JPackageManager;
  PackageInfo: JPackageInfo;
  {$ENDIF}
  {$IFDEF IOS}
  AppKey: Pointer;
  AppBundle: NSBundle;
  BuildStr : NSString;
  {$ENDIF}
begin
  {$IFDEF MSWINDOWS}
  try
    verinfosize := getfileversioninfosize(pchar(paramstr(0)), dummy);
    getmem(verinfo, verinfosize);
    getfileversioninfo(pchar(paramstr(0)), 0, verinfosize, verinfo);
    verqueryvalue(verinfo, '\', pointer(vervalue), vervaluesize);
    with vervalue^ do
    begin
      Result := inttostr(dwfileversionms shr 16);
      Result := Result + '.' + inttostr(dwfileversionms and $FFFF);
      Result := Result + '.' + inttostr(dwfileversionls shr 16);
      Result := Result + '.' + inttostr(dwfileversionls and $FFFF);
    end;
    freemem(verinfo, verinfosize);
  except
    on e: exception do
      raise exception.Create('Erro na clsse ' + Self.ClassName + ' : ' + #13#13
        + e.Message);
  end;
  {$ENDIF}
  {$IFDEF ANDROID}
  try
    PackageManager := TAndroidHelper.Context.getPackageManager; //SharedActivityContext.getPackageManager;
    PackageInfo := PackageManager.getPackageInfo(TAndroidHelper.Context.getPackageName, 0);  //SharedActivityContext.getPackageName, 0);
    Result := JStringToString(PackageInfo.versionName);
  except
  end;
  {$ENDIF}
  {$IFDEF IOS}
  try
    AppKey := (StrToNSStr('CFBundleVersion') as ILocalObject).GetObjectID;

    AppBundle := TNSBundle.Wrap(TNSBundle.OCClass.mainBundle);
    BuildStr := TNSString.Wrap(AppBundle.infoDictionary.objectForKey(AppKey));
    Result := UTF8ToString(BuildStr.UTF8String);
  except
  end;
  {$ENDIF}
end;

class function TSistema.GetVersao(pFile: string): string;
{$IFDEF MSWINDOWS}
var
  _Size: dword;
  _VerInfo: pointer;
  _ValueSize: dword;
  _Value: pvsfixedfileinfo;
  _Dummy: dword;
  _V1, _V2, _V3, _V4: Word;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  if not(FileExists(pFile)) then
    raise exception.Create('Arquivo passado como parâmetro não existe: ' + '' +
      pFile + '');
  try
    _Size := getfileversioninfosize(pchar(pFile), _Dummy);
    getmem(_VerInfo, _Size);
    getfileversioninfo(pchar(pFile), 0, _Size, _VerInfo);
    verqueryvalue(_VerInfo, '\', pointer(_Value), _ValueSize);
    with _Value^ do
    begin
      _V1 := dwfileversionms shr 16;
      _V2 := dwfileversionms and $FFFF;
      _V3 := dwfileversionls shr 16;
      _V4 := dwfileversionls and $FFFF;
    end;
    freemem(_VerInfo, _Size);
    Result := inttostr(_V1) + '.' + inttostr(_V2) + '.' + inttostr(_V3) + '.' +
      inttostr(_V4);
{$IFDEF DEBUG}
    Result := Result + ' (D)';
{$ELSE}
    Result := Result + ' (R)';
{$ENDIF}
  except
    on e: exception do
      raise exception.Create('Erro na clsse ' + Self.ClassName + ' : ' + #13#13
        + e.Message);
  end;
{$ENDIF}
end;

class procedure TSistema.HabilitaGPS;
{$IFDEF ANDROID}
var
  Intent: JIntent;
{$ENDIF}
begin
{$IFDEF ANDROID}
  Intent := TJIntent.Create;
  Intent := TJIntent.JavaClass.init(StringToJString('android.settings.LOCATION_SOURCE_SETTINGS'));
  Intent.setPackage(StringToJString('com.android.settings'));
  TAndroidHelper.Activity.startActivity(Intent);
{$ENDIF}
{$IFDEF IOS}
//  TApplicationEvent.OpenURL(NSUrl.URLWithString(NSSTR(PChar('App-Prefs:root=Privacy&path=LOCATION'))));
{$ENDIF}
{$IFDEF FPC}
  UIApplication.sharedApplication.openUrl(NSUrl.URLWithString(NSSTR(PChar('App-Prefs:root=Privacy&path=LOCATION'))));
{$ENDIF}
end;

class procedure TSistema.SetNavigationBarColor(Color: Integer);
begin
  {$IFDEF ANDROID}
  {$IFDEF FMX}
  CallInUIThreadAndWaitFinishing(
  procedure
  begin
    TAndroidHelper.Activity.getWindow.setNavigationBarColor(Color);
  end
  );
  {$ENDIF}
  {$ENDIF}
end;

class procedure TSistema.SetStatusBarColor(Color: Integer);
begin
  {$IFDEF ANDROID}
  {$IFDEF FMX}
  CallInUIThreadAndWaitFinishing(
  procedure
  begin
    TAndroidHelper.Activity.getWindow.setStatusBarColor(Color);
  end
  );
  {$ENDIF}
  {$ENDIF}
end;

class procedure TSistema.Vibrate(Milliseconds: Cardinal);
{$IFDEF ANDROID}
var
  Vibrator: JVibrator;
{$ENDIF}
begin
{$IFDEF ANDROID}
  Vibrator := TJVibrator.Wrap((SharedActivityContext.getSystemService(TJContext.JavaClass.VIBRATOR_SERVICE) as ILocalObject).GetObjectID);
  Vibrator.vibrate(Milliseconds);
{$ENDIF}
{$IFDEF IOS}
  //AudioServicesPlaySystemSound(kSystemSoundID_vibrate);
{$ENDIF}
end;

{$IF Defined(ANDROID) OR Defined(IOS)}
{$IFDEF FMX}
class procedure TSistema.VirtualKeyboard(KeyBoard: TTypeKeyBoard; AControl: TFmxObject);
var
  KeyboardService: IFMXVirtualKeyboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
  begin
    if KeyBoard = TTypeKeyBoard.Hide then
      KeyboardService.HideVirtualKeyboard;
    if KeyBoard = TTypeKeyBoard.Show then
      KeyboardService.ShowVirtualKeyboard(AControl)
  end;
end;
{$ENDIF}
{$ENDIF}

class function TSistema.GetDeviceName(): string;
{$IF Defined(ANDROID) OR Defined(IOS)}
{$IFDEF FMX}
var
  FMXDeviceService: IFMXDeviceService;
{$ENDIF}
{$ENDIF}
begin
{$IF Defined(ANDROID) OR Defined(IOS)}
{$IFDEF FMX}
  if TPlatformServices.Current.SupportsPlatformService(IFMXDeviceService, IInterface(FMXDeviceService)) then
    Result := FMXDeviceService.GetModel
  else
    Result := '';
{$ENDIF}
{$ENDIF}
{$IFDEF MSWINDOWS}
  Result := 'windows';
{$ENDIF}
end;

class function TSistema.GetOSName(): string;
begin
  Result := TOSVersion.Name;
end;

class function TSistema.GetOSVersion: string;
begin
  Result := TOSVersion.Major.ToString+'.'+TOSVersion.Minor.ToString;
end;

class procedure TSistema.DisableSleep(Par: Boolean);
{$IFDEF IOS}
var
  UIApp : UIApplication;
{$ENDIF}
begin
{$IFDEF IOS}
  UIApp := TUIApplication.Wrap(TUIApplication.OCClass.sharedApplication);
  UIApp.setIdleTimerDisabled(Par);
{$ENDIF}
end;

class function TSistema.GetConexaoInternet(Url: string): Boolean;
var
  TcpClient: TIdTCPClient;
begin
  try
    TcpClient := TIdTCPClient.Create(nil);
    try
      TcpClient.Port := 80;
      TcpClient.ReadTimeout:=2000;
      TcpClient.ConnectTimeout:=2000;
      TcpClient.Host:=Url;
      TcpClient.IPVersion := TIdIPVersion.Id_IPv4;
      TcpClient.Connect;

      Result := TcpClient.Connected;

      if not Result then
      begin
        TcpClient.Disconnect;
        TcpClient.IPVersion := TIdIPVersion.Id_IPv6;
        TcpClient.Connect;
        Result := TcpClient.Connected;
      end;
    except
      on e: exception do
      begin
        TcpClient.IPVersion := TIdIPVersion.Id_IPv6;
        TcpClient.Connect;
        Result := TcpClient.Connected;
      end;
    end;
  finally
    FreeAndNil(TcpClient);
  end;
end;

class function TSistema.GetGPSStatus: Boolean;
{$IFDEF ANDROID}
var
  locationManager : JLocationManager;
{$ENDIF}
begin
{$IFDEF ANDROID}
  locationManager := TJLocationManager.Wrap( ((SharedActivity.getSystemService(TJContext.JavaClass.LOCATION_SERVICE)) as ILocalObject).GetObjectID);
  if locationManager.isProviderEnabled(TJLocationManager.JavaClass.GPS_PROVIDER) then
    Result := True
  else
    Result := False;
{$ELSE}
{$IFDEF IOS}
  if (not TCLLocationManager.OCClass.locationServicesEnabled) {or (TCLLocationManager.OCClass.authorizationStatus <> kCLAuthorizationStatusAuthorized) }then
    Result := False
  else
    Result := True;
{$ELSE}
  Result := True;
{$ENDIF}
{$ENDIF}
end;

class function TSistema.GetIP: string;
{$IFDEF DESKTOP_VCL}
var
  WSAData: TWSAData;
  HostEnt: PHostEnt;
  Name: AnsiString;
{$ENDIF}
begin
  {$IFDEF DESKTOP_VCL}
  WSAStartup(2, WSAData);
  SetLength(Name, 255);
  Gethostname(PAnsiChar(Name), 255);
  SetLength(Name, StrLen(PAnsiChar(Name)));
  HostEnt := gethostbyname(PAnsiChar(Name));
  with HostEnt^ do
    Result:=Format('%d.%d.%d.%d',[Byte(h_addr^[0]),
              Byte(h_addr^[1]),Byte(h_addr^[2]),Byte(h_addr^[3])]);
  WSACleanup;
  {$ENDIF}

  {$IFDEF WEB_UNIGUI}
  Result := UniApplication.RemoteAddress;
  {$endif}
end;

class function TSistema.GetIsNumberPrime(N: Integer): Boolean;
var
  M: Integer;
begin
  Assert(N > 0);
  if N = 1 then // annoying special case
  begin
    Result := False;
    exit;
  end;
  for M := 2 to (N div 2) do
    if N mod M = 0 then
    begin
      Result := False;
      exit;
    end;
  Result := True;
end;

class function TSistema.GetOS: string;
{$IFDEF WEB_UNIGUI}
var
  C : TUniClientInfos;
{$ENDIF}
{$IFDEF DESKTOP_VCL}
var
  vNome,
  vVersao,
  vCurrentBuild: String;
  Reg: TRegistry;
{$ENDIF}
begin

  {$IFDEF DESKTOP_VCL}
  try
    Reg         := TRegistry.Create;
    Reg.Access  := KEY_READ;
    Reg.RootKey := HKEY_LOCAL_MACHINE;

    Reg.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\', true);

    vNome         := Reg.ReadString('ProductName');
    vVersao       := Reg.ReadString('CurrentVersion');
    vCurrentBuild := Reg.ReadString('CurrentBuild');

    Result := vNome + ' - ' + vVersao + ' - ' + vCurrentBuild;
  finally
    FreeAndNil(Reg);
  end;
  {$ENDIF}

  {$IFDEF WEB_UNIGUI}
  C := UniApplication.ClientInfo;

  if ciLinux in C then
    Result := 'Linux'
  else if ciWindows in C then
    Result := 'Windows'
  else if ciMac in C then
    Result := 'Mac'
  else
    Result  := 'Other';
  {$ENDIF}
end;

class function TSistema.GetProcessoAberto(ExeName: string): Boolean;
{$IFDEF MSWINDOWS}
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
{$ENDIF}
begin
  Result := false;
  {$IFDEF MSWINDOWS}
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeName)) or
      (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeName))) then
    begin
      Result := true;
      exit;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
  {$ENDIF}
end;

class function TSistema.GetNewUniqueMD5: string;
begin
  Result := Self.GetMD5(FormatDateTime('DDMMYYYYhhmmsszzz',Now)+Random(999999999).ToString, False);
end;

class function TSistema.GetSerialMotheboard: string;
{$IFDEF MSWINDOWS}
var
  a, b, c, d: LongWord;
{$ENDIF}
begin
  {$IFDEF MSWINDOWS}
  asm
    push EAX
    push EBX
    push ECX
    push EDX

    mov eax, 1
    db $0F, $A2
    mov a, EAX
    mov b, EBX
    mov c, ECX
    mov d, EDX

    pop EDX
    pop ECX
    pop EBX
    pop EAX

  end;
  result := inttohex(a, 8) + '-' +
            inttohex(b, 8) + '-' +
            inttohex(c, 8) + '-' +
            inttohex(d, 8);
  {$ENDIF}
end;

class function TSistema.GetStatusBarHeight: Integer;
{$IF Defined(Android) AND Defined(FMX)}
var
  LRect: JRect;
  LScale: Single;
  LScreenService: IFMXScreenService;
begin
  Result := 0;
  if TJBuild_VERSION.JavaClass.SDK_INT >= 24 then
  begin
    if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, LScreenService) then
      LScale := LScreenService.GetScreenScale
    else
      LScale := 1;
    LRect := TJRect.Create;
    TAndroidHelper.Activity.getWindow.getDecorView.getWindowVisibleDisplayFrame(LRect);
    Result := Round(LRect.top / LScale);
  end;
end;
{$ELSE}
begin
  Result := 0;
end;
{$ENDIF}

class function TSistema.GetNavegador: string;
{$IFDEF WEB_UNIGUI}
var
  C : TUniClientInfos;
{$ENDIF}
begin
  {$IFDEF WEB_UNIGUI}
  C := UniApplication.ClientInfo;

  if ciIE in C then
    Result := 'IE'
  else if ciFireFox in C then
    Result := 'FireFox'
  else if ciOpera in C then
    Result := 'Opera'
  else if ciSafari in C then
    Result := 'Safari'
  else if ciChrome in C then
    Result := 'Chrome'
  else
    Result  := 'Other';

  if UniSession.UserAgent <> EmptyStr then
  begin
    if (Pos('chrome',LowerCase(UniSession.UserAgent))> 0) then
      Result := 'Chrome';
    if (Pos('chrome',LowerCase(UniSession.UserAgent))> 0) and (Pos('opr',LowerCase(UniSession.UserAgent))> 0) then
      Result := 'Opera';
    if (Pos('chrome',LowerCase(UniSession.UserAgent))> 0) and (Pos('edge',LowerCase(UniSession.UserAgent))> 0) then
      Result := 'Edge';
  end;
  {$ENDIF}

  {$IFDEF DESKTOP_VCL}
  Result := 'DESKTOP';
  {$ENDIF}
end;

end.
