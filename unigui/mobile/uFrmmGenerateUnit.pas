unit uFrmmGenerateUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm;

type
  TfrmmGenerateUnit = class(TUnimForm)
    procedure UnimFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmmGenerateUnit: TfrmmGenerateUnit;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmmGenerateUnit: TfrmmGenerateUnit;
begin
  Result := TfrmmGenerateUnit(UniMainModule.GetFormInstance(TfrmmGenerateUnit));
end;

procedure TfrmmGenerateUnit.UnimFormShow(Sender: TObject);
begin
  UniSession.AddJS('ga(''set'',''page'', ''/'+Self.Name+'.html'');');
  UniSession.AddJS('ga(''send'',''pageview'');');
end;

end.
