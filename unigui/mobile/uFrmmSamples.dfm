object frmmSamples: TfrmmSamples
  Left = 0
  Top = 0
  ClientHeight = 667
  ClientWidth = 354
  Caption = 'Sample Use'
  OnShow = UnimFormShow
  AutoHeight = False
  Scrollable = True
  TitleFontColor = 9264680
  CloseButton.IconCls = 'arrow_left'
  CloseButton.DefaultIcon = False
  TitleButtons = <>
  ShowAnimation = 'slideOut'
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 700
  PlatformData = {}
  object lbl1: TUnimLabel
    AlignWithMargins = True
    Left = 15
    Top = 10
    Width = 324
    Height = 23
    Hint = ''
    Margins.Left = 15
    Margins.Top = 10
    Margins.Right = 15
    AutoSize = False
    Caption = 'Sample JSON'
    Align = alTop
    ParentFont = False
  end
  object memJSON: TUnimMemo
    AlignWithMargins = True
    Left = 15
    Top = 36
    Width = 324
    Height = 262
    Hint = ''
    Margins.Left = 15
    Margins.Top = 0
    Margins.Right = 15
    Margins.Bottom = 0
    Align = alTop
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
    Font.Height = -12
    TabOrder = 1
  end
  object lbl2: TUnimLabel
    AlignWithMargins = True
    Left = 15
    Top = 308
    Width = 324
    Height = 23
    Hint = ''
    Margins.Left = 15
    Margins.Top = 10
    Margins.Right = 15
    AutoSize = False
    Caption = 'Sample Delphi'
    Align = alTop
    ParentFont = False
  end
  object memDelphi: TUnimMemo
    AlignWithMargins = True
    Left = 15
    Top = 334
    Width = 324
    Height = 262
    Hint = ''
    Margins.Left = 15
    Margins.Top = 0
    Margins.Right = 15
    Margins.Bottom = 0
    Align = alTop
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
    Font.Height = -12
    TabOrder = 3
  end
  object btnGenerate: TUnimButton
    AlignWithMargins = True
    Left = 15
    Top = 611
    Width = 324
    Height = 47
    Hint = ''
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 10
    Align = alTop
    Caption = 'Download Project Sample'
    UI = 'round'
    ScreenMask.Enabled = True
    ScreenMask.WaitData = True
    ScreenMask.Message = 'Processing...'
    LayoutConfig.Cls = 'button-style'
    OnClick = btnGenerateClick
  end
end
