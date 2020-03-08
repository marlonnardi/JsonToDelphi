unit RootUnit;

interface

uses
  Pkg.Json.DTO;

{$M+}

type
  TMenuitemDTO = class
  private
    FOnclick: string;
    FValue: string;
  published
    property Onclick: string read FOnclick write FOnclick;
    property Value: string read FValue write FValue;
  end;
  
  TPopupDTO = class
  private
    FMenuitem: TArray<TMenuitemDTO>;
  published
    property Menuitem: TArray<TMenuitemDTO> read FMenuitem write FMenuitem;
    destructor Destroy; override;
  end;
  
  TMenuDTO = class
  private
    FId: string;
    FPopup: TPopupDTO;
    FValue: string;
  published
    property Id: string read FId write FId;
    property Popup: TPopupDTO read FPopup write FPopup;
    property Value: string read FValue write FValue;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TRootDTO = class(TJsonDTO)
  private
    FMenu: TMenuDTO;
  published
    property Menu: TMenuDTO read FMenu write FMenu;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

{ TPopupDTO }

destructor TPopupDTO.Destroy;
var
  Element: TObject;
begin
  for Element in FMenuitem do
    Element.Free;
  inherited;
end;

{ TMenuDTO }

constructor TMenuDTO.Create;
begin
  inherited;
  FPopup := TPopupDTO.Create;
end;

destructor TMenuDTO.Destroy;
begin
  FPopup.Free;
  inherited;
end;

{ TRootDTO }

constructor TRootDTO.Create;
begin
  inherited;
  FMenu := TMenuDTO.Create;
end;

destructor TRootDTO.Destroy;
begin
  FMenu.Free;
  inherited;
end;

end.
