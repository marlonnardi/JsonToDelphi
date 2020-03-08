object frmSampleUse: TfrmSampleUse
  Left = 0
  Top = 0
  Caption = 'frmSampleUse'
  ClientHeight = 387
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    729
    387)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 256
    Width = 8
    Height = 13
    Caption = 'id'
  end
  object lblid: TLabel
    Left = 64
    Top = 256
    Width = 20
    Height = 13
    Caption = 'lbl1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 24
    Top = 279
    Width = 26
    Height = 13
    Caption = 'value'
  end
  object lblvalue: TLabel
    Left = 64
    Top = 279
    Width = 20
    Height = 13
    Caption = 'lbl1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 24
    Top = 305
    Width = 82
    Height = 13
    Caption = 'count menu itens'
  end
  object lblcount: TLabel
    Left = 115
    Top = 305
    Width = 20
    Height = 13
    Caption = 'lbl1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 24
    Top = 331
    Width = 53
    Height = 13
    Caption = 'first onclick'
  end
  object lblfirstonclick: TLabel
    Left = 115
    Top = 331
    Width = 20
    Height = 13
    Caption = 'lbl1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 24
    Top = 354
    Width = 51
    Height = 13
    Caption = 'last onclick'
  end
  object lbllastonclick: TLabel
    Left = 115
    Top = 354
    Width = 20
    Height = 13
    Caption = 'lbl1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object memSample: TMemo
    Left = 24
    Top = 16
    Width = 683
    Height = 177
    Anchors = [akLeft, akTop, akRight]
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
    TabOrder = 0
    ExplicitWidth = 743
  end
  object btnJsonToObject: TButton
    Left = 24
    Top = 216
    Width = 137
    Height = 25
    Caption = 'Json To Object'
    TabOrder = 1
    OnClick = btnJsonToObjectClick
  end
end
