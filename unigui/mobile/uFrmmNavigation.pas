unit uFrmmNavigation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniURLFrame, unimURLFrame;

type
  TfrmmNavigation = class(TUnimForm)
    url: TUnimURLFrame;
    procedure UnimFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmmNavigation: TfrmmNavigation;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function frmmNavigation: TfrmmNavigation;
begin
  Result := TfrmmNavigation(UniMainModule.GetFormInstance(TfrmmNavigation));
end;

procedure TfrmmNavigation.UnimFormShow(Sender: TObject);
begin
  UniMainModule.SetGA4(Self.Name);
end;

end.
