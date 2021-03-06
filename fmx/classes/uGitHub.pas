unit uGitHub;

// *************************************************
// Generated By: JsonToDelphiClass - 0.64
// Generated On: 2015-01-03 15:32:27
// *************************************************
// Created By  : Petar Georgiev - 2014
// Web Site    : http://pgeorgiev.com
// *************************************************

interface

uses Generics.Collections, Rest.Json, IdUri, IdHttp,
  IdSSLOpenSSL, System.Json, SysUtils, Classes;

type

  // Represents a serializable object with HTTP/REST capabilities (via Indy)
  // HTTPS connections require OpenSSL binaries!
  // Use the "AOnBeforeRequest" event to setup HTTP client's parameters like timeout, encoding etc.
  //
  TUGitHubSerializableObject = class abstract
  protected
    // As per http://www.restapitutorial.com/lessons/httpmethods.html
    class procedure EnsureHttpResponseCode(AHttpResponseCode: integer; AUrl: string; AValidValues: array of integer);
    class procedure EnsureHttpContentType(AHttp: TIdHttp);
  public
    // Generic Web Request method
    class function WebRequest(AUrl: string; AOnRequest: TProc<TIdHttp>): integer;
    // Returns an instance of T from a JSON string via GET request. AArrayProperty is intended for internal use only!
    // HttpGet is reintroduced in descendant classes to return concrete instance
    class function HttpGet<T: class, constructor>(AUrl: string; AOnBeforeRequest: TProc<TIdHttp> = nil; AArrayProperty: string = ''): T;
    // Performs POST request, sends the current object as JSON string and returns server's response as text.
    function HttpPost(AUrl: string; AOnBeforeRequest: TProc<TIdHttp> = nil): string;
    // Performs PUT request, sends the current object as JSON string and returns server's response as text.
    function HttpPut(AUrl: string; AOnBeforeRequest: TProc<TIdHttp> = nil): string;
    // Performs DELETE request and returns server's response as text. This method exists just REST compliance.
    function HttpDelete(AUrl: string; AOnBeforeRequest: TProc<TIdHttp> = nil): string;
  end;

  TUploaderClass = class
  private
    FAvatar_url: string;
    FEvents_url: string;
    FFollowers_url: string;
    FFollowing_url: string;
    FGists_url: string;
    FGravatar_id: string;
    FHtml_url: string;
    FId: Extended;
    FLogin: string;
    FOrganizations_url: string;
    FReceived_events_url: string;
    FRepos_url: string;
    FSite_admin: Boolean;
    FStarred_url: string;
    FSubscriptions_url: string;
    FType: string;
    FUrl: string;
  public
    property avatar_url: string read FAvatar_url write FAvatar_url;
    property events_url: string read FEvents_url write FEvents_url;
    property followers_url: string read FFollowers_url write FFollowers_url;
    property following_url: string read FFollowing_url write FFollowing_url;
    property gists_url: string read FGists_url write FGists_url;
    property gravatar_id: string read FGravatar_id write FGravatar_id;
    property html_url: string read FHtml_url write FHtml_url;
    property id: Extended read FId write FId;
    property login: string read FLogin write FLogin;
    property organizations_url: string read FOrganizations_url write FOrganizations_url;
    property received_events_url: string read FReceived_events_url write FReceived_events_url;
    property repos_url: string read FRepos_url write FRepos_url;
    property site_admin: Boolean read FSite_admin write FSite_admin;
    property starred_url: string read FStarred_url write FStarred_url;
    property subscriptions_url: string read FSubscriptions_url write FSubscriptions_url;
    property &type: string read FType write FType;
    property url: string read FUrl write FUrl;
    function ToJsonString: string;
    class function FromJsonString(aJsonString: string): TUploaderClass;
  end;

  TAssetsClass = class
  private
    FBrowser_download_url: string;
    FContent_type: string;
    FCreated_at: string;
    FDownload_count: Extended;
    FId: Extended;
    FName: string;
    FSize: Extended;
    FState: string;
    FUpdated_at: string;
    FUploader: TUploaderClass;
    FUrl: string;
  public
    property browser_download_url: string read FBrowser_download_url write FBrowser_download_url;
    property content_type: string read FContent_type write FContent_type;
    property created_at: string read FCreated_at write FCreated_at;
    property download_count: Extended read FDownload_count write FDownload_count;
    property id: Extended read FId write FId;
    property name: string read FName write FName;
    property size: Extended read FSize write FSize;
    property state: string read FState write FState;
    property updated_at: string read FUpdated_at write FUpdated_at;
    property uploader: TUploaderClass read FUploader write FUploader;
    property url: string read FUrl write FUrl;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(aJsonString: string): TAssetsClass;
  end;

  TAuthorClass = class
  private
    FAvatar_url: string;
    FEvents_url: string;
    FFollowers_url: string;
    FFollowing_url: string;
    FGists_url: string;
    FGravatar_id: string;
    FHtml_url: string;
    FId: Extended;
    FLogin: string;
    FOrganizations_url: string;
    FReceived_events_url: string;
    FRepos_url: string;
    FSite_admin: Boolean;
    FStarred_url: string;
    FSubscriptions_url: string;
    FType: string;
    FUrl: string;
  public
    property avatar_url: string read FAvatar_url write FAvatar_url;
    property events_url: string read FEvents_url write FEvents_url;
    property followers_url: string read FFollowers_url write FFollowers_url;
    property following_url: string read FFollowing_url write FFollowing_url;
    property gists_url: string read FGists_url write FGists_url;
    property gravatar_id: string read FGravatar_id write FGravatar_id;
    property html_url: string read FHtml_url write FHtml_url;
    property id: Extended read FId write FId;
    property login: string read FLogin write FLogin;
    property organizations_url: string read FOrganizations_url write FOrganizations_url;
    property received_events_url: string read FReceived_events_url write FReceived_events_url;
    property repos_url: string read FRepos_url write FRepos_url;
    property site_admin: Boolean read FSite_admin write FSite_admin;
    property starred_url: string read FStarred_url write FStarred_url;
    property subscriptions_url: string read FSubscriptions_url write FSubscriptions_url;
    property &type: string read FType write FType;
    property url: string read FUrl write FUrl;
    function ToJsonString: string;
    class function FromJsonString(aJsonString: string): TAuthorClass;
  end;

  TReleaseClass = class(TUGitHubSerializableObject)
  private
    FAssets: TArray<TAssetsClass>;
    FAssets_url: string;
    FAuthor: TAuthorClass;
    FBody: string;
    FCreated_at: string;
    FDraft: Boolean;
    FHtml_url: string;
    FId: Extended;
    FName: string;
    FPrerelease: Boolean;
    FPublished_at: string;
    FTag_name: string;
    FTarball_url: string;
    FTarget_commitish: string;
    FUpload_url: string;
    FUrl: string;
    FZipball_url: string;
  public
    property assets: TArray<TAssetsClass> read FAssets write FAssets;
    property assets_url: string read FAssets_url write FAssets_url;
    property author: TAuthorClass read FAuthor write FAuthor;
    property body: string read FBody write FBody;
    property created_at: string read FCreated_at write FCreated_at;
    property draft: Boolean read FDraft write FDraft;
    property html_url: string read FHtml_url write FHtml_url;
    property id: Extended read FId write FId;
    property name: string read FName write FName;
    property prerelease: Boolean read FPrerelease write FPrerelease;
    property published_at: string read FPublished_at write FPublished_at;
    property tag_name: string read FTag_name write FTag_name;
    property tarball_url: string read FTarball_url write FTarball_url;
    property target_commitish: string read FTarget_commitish write FTarget_commitish;
    property upload_url: string read FUpload_url write FUpload_url;
    property url: string read FUrl write FUrl;
    property zipball_url: string read FZipball_url write FZipball_url;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(aJsonString: string): TReleaseClass;
    class function HttpGet(AUrl: string; AOnBeforeRequest: TProc<TIdHttp> = nil): TReleaseClass;
  end;

  TGitReleasesClass = class
  private
    FReleases: TArray<TReleaseClass>;
  public
    property Releases: TArray<TReleaseClass> read FReleases write FReleases;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(aJsonString: string): TGitReleasesClass;
    class function FromUrl(AUrl: string; ATimeout: integer): TGitReleasesClass;
  end;

  TErrorClass = class
  private
    FDocumentation_url: string;
    FMessage: string;
  public
    property documentation_url: string read FDocumentation_url write FDocumentation_url;
    property message: string read FMessage write FMessage;
    function ToJsonString: string;
    class function FromJsonString(aJsonString: string): TErrorClass;
  end;

implementation

{ TUploaderClass }

function TUploaderClass.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

class function TUploaderClass.FromJsonString(aJsonString: string): TUploaderClass;
begin
  Result := TJson.JsonToObject<TUploaderClass>(aJsonString)
end;

{ TAssetsClass }

constructor TAssetsClass.Create;
begin
  inherited;
  FUploader := TUploaderClass.Create();
end;

destructor TAssetsClass.Destroy;
begin
  FUploader.Free;
  inherited;
end;

function TAssetsClass.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

class function TAssetsClass.FromJsonString(aJsonString: string): TAssetsClass;
begin
  Result := TJson.JsonToObject<TAssetsClass>(aJsonString)
end;

{ TAuthorClass }

function TAuthorClass.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

class function TAuthorClass.FromJsonString(aJsonString: string): TAuthorClass;
begin
  Result := TJson.JsonToObject<TAuthorClass>(aJsonString)
end;

{ TReleaseClass }

constructor TReleaseClass.Create;
begin
  inherited;
  FAuthor := TAuthorClass.Create();
end;

destructor TReleaseClass.Destroy;
var
  LassetsItem: TAssetsClass;
begin
  for LassetsItem in FAssets do
    LassetsItem.Free;

  FAuthor.Free;
  inherited;
end;

function TReleaseClass.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

class function TReleaseClass.FromJsonString(aJsonString: string): TReleaseClass;
begin
  Result := TJson.JsonToObject<TReleaseClass>(aJsonString)
end;

class function TReleaseClass.HttpGet(AUrl: string; AOnBeforeRequest: TProc<TIdHttp>): TReleaseClass;
begin
  Result := inherited HttpGet<TReleaseClass>(AUrl, AOnBeforeRequest);
end;

{ TGitReleasesClass }

constructor TGitReleasesClass.Create;
begin
  inherited;
end;

destructor TGitReleasesClass.Destroy;
var
  LReleasesItem: TReleaseClass;
begin

  for LReleasesItem in FReleases do
    LReleasesItem.Free;

  inherited;
end;

function TGitReleasesClass.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

class function TGitReleasesClass.FromJsonString(aJsonString: string): TGitReleasesClass;
begin
  Result := TJson.JsonToObject<TGitReleasesClass>(aJsonString)
end;

class function TGitReleasesClass.FromUrl(AUrl: string; ATimeout: integer): TGitReleasesClass;
var
  LUri: TIdUri;
  LHttp: TIdHttp;
  LSslIoHandler: TIdSSLIOHandlerSocketOpenSSL;
  LString: string;
  LJsonValue: TJsonValue;
  LJsonObject: TJsonObject;
begin
  LUri := TIdUri.Create(AUrl);
  try
    LHttp := TIdHttp.Create;
    try
      LHttp.ConnectTimeout := ATimeout;
      LHttp.ReadTimeout := ATimeout;
      LHttp.HandleRedirects := true;

      if LUri.Protocol.ToLower = 'https' then
      begin
        LSslIoHandler := TIdSSLIOHandlerSocketOpenSSL.Create(LHttp);
        LHttp.IOHandler := LSslIoHandler;
      end;

      LString := LHttp.Get(AUrl);

      if LHttp.ResponseCode <> 200 then
        raise Exception.CreateFmt('Error getting JSON string from %s. Http error code: %d', [AUrl, LHttp.ResponseCode]);

      LJsonValue := TJsonObject.ParseJSONValue(LString);

      if LJsonValue = nil then
        raise Exception.Create('Unable to parse JSON string!');

      try
        LJsonValue.Owned := false;
        if LJsonValue is TJSONArray then
        begin
          LJsonObject := TJsonObject.Create;
          try
            LJsonObject.AddPair('Releases', LJsonValue);
            LString := LJsonObject.ToJSON;
          finally
            LJsonObject.Free;
          end;
        end;

        Result := TGitReleasesClass.FromJsonString(LString);

      finally
        LJsonValue.Free;
      end;
    finally
      LHttp.Free;
    end;
  finally
    LUri.Free;
  end;
end;

{ TErrorClass }

function TErrorClass.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(Self);
end;

class function TErrorClass.FromJsonString(aJsonString: string): TErrorClass;
begin
  Result := TJson.JsonToObject<TErrorClass>(aJsonString)
end;

{ TUGitHubSerializableObject }

class procedure TUGitHubSerializableObject.EnsureHttpContentType(AHttp: TIdHttp);
begin
  if AHttp.Response.ContentType <> 'application/json' then
    raise Exception.CreateFmt('Invalid content type %s!', [AHttp.Response.ContentType]);
end;

class procedure TUGitHubSerializableObject.EnsureHttpResponseCode(AHttpResponseCode: integer; AUrl: string; AValidValues: array of integer);
var
  LValue: integer;
begin
  for LValue in AValidValues do
    if LValue = AHttpResponseCode then
      exit;

  raise Exception.CreateFmt('The request to %s has failed with code %d', [AUrl, AHttpResponseCode]);
end;

function TUGitHubSerializableObject.HttpDelete(AUrl: string; AOnBeforeRequest: TProc<TIdHttp>): string;
var
  LResult: string;
begin

  WebRequest(AUrl,
    procedure(LHttp: TIdHttp)
    begin

      // Allow HTTP client pre-configuration
      if assigned(AOnBeforeRequest) then
        AOnBeforeRequest(LHttp);

      LResult := LHttp.Delete(AUrl);
      EnsureHttpResponseCode(LHttp.ResponseCode, AUrl, [200, 204]);

    end);

  Result := LResult;
end;

class function TUGitHubSerializableObject.HttpGet<T>(AUrl: string; AOnBeforeRequest: TProc<TIdHttp>; AArrayProperty: string): T;
var
  LResult: T;
begin
  WebRequest(AUrl,
    procedure(LHttp: TIdHttp)
    var
      LString: string;
      LJsonValue: TJsonValue;
      LJsonObject: TJsonObject;
    begin

      // Allow HTTP client pre-configuration
      if assigned(AOnBeforeRequest) then
        AOnBeforeRequest(LHttp);

      LString := LHttp.Get(AUrl);
      EnsureHttpResponseCode(LHttp.ResponseCode, AUrl, [200, 304]);
      EnsureHttpContentType(LHttp);

      LJsonValue := TJsonObject.ParseJSONValue(LString);

      if LJsonValue = nil then
        raise Exception.Create('Unable to parse JSON string!');

      try
        LJsonValue.Owned := false;
        if LJsonValue is TJSONArray then
          if (AArrayProperty <> '') then
          begin
            LJsonObject := TJsonObject.Create;
            try
              LJsonObject.AddPair(AArrayProperty, LJsonValue);
              LString := LJsonObject.ToJSON;
            finally
              LJsonObject.Free;
            end;
          end
          else
            raise Exception.CreateFmt('The class %s does not accept array values!', [LResult.className]);
      finally
        LJsonValue.Free;
      end;

      LResult := TJson.JsonToObject<T>(LString);

    end);

  Result := LResult;
end;

function TUGitHubSerializableObject.HttpPost(AUrl: string; AOnBeforeRequest: TProc<TIdHttp>): string;
var
  LResult: string;
begin

  WebRequest(AUrl,
    procedure(LHttp: TIdHttp)
    var
      LStringStream: TStringStream;
    begin

      // Allow HTTP client pre-configuration
      if assigned(AOnBeforeRequest) then
        AOnBeforeRequest(LHttp);

      LResult := TJson.ObjectToJsonString(Self);

      LStringStream := TStringStream.Create(LResult, TEncoding.GetEncoding(LHttp.Request.ContentEncoding));
      try
        LResult := LHttp.Post(AUrl, LStringStream);
        EnsureHttpResponseCode(LHttp.ResponseCode, AUrl, [200, 201, 202, 204]);
        EnsureHttpContentType(LHttp);
      finally
        LStringStream.Free;
      end;

    end);

  Result := LResult;
end;

function TUGitHubSerializableObject.HttpPut(AUrl: string; AOnBeforeRequest: TProc<TIdHttp>): string;
var
  LResult: string;
begin

  WebRequest(AUrl,
    procedure(LHttp: TIdHttp)
    var
      LStringStream: TStringStream;
    begin

      // Allow HTTP client pre-configuration
      if assigned(AOnBeforeRequest) then
        AOnBeforeRequest(LHttp);

      LResult := TJson.ObjectToJsonString(Self);

      LStringStream := TStringStream.Create(LResult, TEncoding.GetEncoding(LHttp.Request.ContentEncoding));
      try
        LResult := LHttp.Put(AUrl, LStringStream);
        EnsureHttpResponseCode(LHttp.ResponseCode, AUrl, [200, 204]);
        EnsureHttpContentType(LHttp);
      finally
        LStringStream.Free;
      end;

    end);

  Result := LResult;
end;

class function TUGitHubSerializableObject.WebRequest(AUrl: string; AOnRequest: TProc<TIdHttp>): integer;
var
  LUri: TIdUri;
  LHttp: TIdHttp;
  LSslIoHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  LUri := TIdUri.Create(AUrl);
  try
    LHttp := TIdHttp.Create;
    try
      LHttp.HandleRedirects := true;
      // Default encoding
      LHttp.Request.ContentEncoding := 'utf-8';
      // Specify Content-Type header
      LHttp.Request.ContentType := 'application/json';

      // Replace default IOHandler with TIdSSLIOHandlerSocketOpenSSL if the connection is SSL based
      if LUri.Protocol.ToLower = 'https' then
      begin
        LSslIoHandler := TIdSSLIOHandlerSocketOpenSSL.Create(LHttp);
        LHttp.IOHandler := LSslIoHandler;
      end;

      try
        AOnRequest(LHttp);
      finally
        Result := LHttp.ResponseCode;
      end;

    finally
      LHttp.Free;
    end;
  finally
    LUri.Free;
  end;
end;

end.
