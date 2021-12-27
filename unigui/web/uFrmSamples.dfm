object frmSamples: TfrmSamples
  Left = 0
  Top = 0
  ClientHeight = 675
  ClientWidth = 1024
  Caption = 'Sample Use'
  Color = 16447477
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  DesignSize = (
    1024
    675)
  TextHeight = 15
  object lbl7: TUniLabel
    AlignWithMargins = True
    Left = 15
    Top = 10
    Width = 93
    Height = 18
    Hint = ''
    Margins.Left = 15
    Margins.Top = 10
    Caption = 'Sample JSON'
    Align = alTop
    ParentFont = False
    Font.Height = -15
    Font.Name = 'Roboto'
    TabOrder = 0
  end
  object SynDelphi: TUniSyntaxEdit
    AlignWithMargins = True
    Left = 15
    Top = 41
    Width = 994
    Height = 208
    Hint = ''
    Margins.Left = 15
    Margins.Top = 10
    Margins.Right = 15
    Lines.Strings = (
      '{"menu": {'
      '  "id": "file",'
      '  "value": "File",'
      '  "popup": {'
      '    "menuitem": ['
      '      {"value": "New", "onclick": "CreateNewDoc()"},'
      '      {"value": "Open", "onclick": "OpenDoc()"},'
      '      {"value": "Close", "onclick": "CloseDoc()"}'
      '    ]'
      '  }'
      '}}')
    Language = 'JavaScript'
    Font.Name = 'Courier New'
    Align = alTop
  end
  object lbl8: TUniLabel
    AlignWithMargins = True
    Left = 15
    Top = 262
    Width = 99
    Height = 18
    Hint = ''
    Margins.Left = 15
    Margins.Top = 10
    Caption = 'Sample Delphi'
    Align = alTop
    ParentFont = False
    Font.Height = -15
    Font.Name = 'Roboto'
    TabOrder = 2
  end
  object Syn: TUniSyntaxEdit
    AlignWithMargins = True
    Left = 15
    Top = 293
    Width = 994
    Height = 314
    Hint = ''
    Margins.Left = 15
    Margins.Top = 10
    Margins.Right = 15
    Lines.Strings = (
      'uses'
      '  RootUnit, Pkg.Json.DTO;'
      ''
      'var'
      '  Root: TRootDTO;'
      'begin'
      '  Root := TRootDTO.Create;'
      '  try'
      '    Root.AsJson := memSample.Lines.Text;'
      ''
      '    lblid.Caption := Root.Menu.Id;'
      '    lblvalue.Caption := Root.Menu.Value;'
      '    lblcount.Caption := Root.Menu.Popup.Menuitem.Count.ToString;'
      
        '    lblfirstonclick.Caption := Root.Menu.Popup.Menuitem[0].Oncli' +
        'ck;'
      
        '    lbllastonclick.Caption := Root.Menu.Popup.Menuitem[Root.Menu' +
        '.Popup.Menuitem.Count-1].Onclick;'
      '  finally'
      '    Root.Free;'
      '  end;')
    Font.Name = 'Courier New'
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object btnDownload: TUniFSButton
    Left = 15
    Top = 625
    Width = 186
    Height = 34
    Hint = ''
    StyleButton = GoogleGreen
    BadgeText.Text = '0'
    BadgeText.TextColor = '#FFFFFF'
    BadgeText.TextSize = 10
    BadgeText.TextStyle = 'bold'
    BadgeText.BackgroundColor = '#D50000'
    Caption = 'Download Project Sample'
    Anchors = [akLeft, akBottom]
    ParentFont = False
    Font.Color = clWhite
    Font.Height = -13
    TabOrder = 4
    OnClick = btnDownloadClick
  end
end
