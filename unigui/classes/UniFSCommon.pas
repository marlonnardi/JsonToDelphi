{ *******************************************************************************
                              Falcon Sistemas

                        www.falconsistemas.com.br
                      suporte@falconsistemas.com.br
                Written by Marlon Nardi - ALL RIGHTS RESERVED.
  ******************************************************************************* }
{$IF CompilerVersion >= 24.0} // XE3 ou superior
  {$LEGACYIFEND ON}
{$IFEND}

{$DEFINE CDN_FALCON} //Comente esta diretiva para não utilizar o CDN da Falcon Sistemas

unit UniFSCommon;

interface

uses
  System.SysUtils, uniGUITypes, uniGUIClasses, uniGUIConst;

const
  {$IFDEF CDN_FALCON}
  CDN = 'https://cdn.falconsistemas.com.br/';
  CDNENABLED = True;
  {$ELSE}
  CDN = '';
  CDNENABLED = False;
  {$ENDIF}

  {https://developers.google.com/maps/documentation/embed/get-api-key}
  API_KEY_MAPS = '';

implementation

initialization
  if StrToFloat(Copy(StringReplace(UNI_CURRENT_EXTJS_VERSION,'.','',[rfReplaceAll]),0,3)) < 700 then
    UniAddCSSLibrary('https://use.fontawesome.com/releases/v5.13.1/css/all.css', True, [upoFolderUni, upoPlatformBoth]);

end.
