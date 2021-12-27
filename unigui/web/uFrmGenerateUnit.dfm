object frmGenerateUnit: TfrmGenerateUnit
  Left = 0
  Top = 0
  ClientHeight = 561
  ClientWidth = 1024
  Caption = 'Preview Delphi Unit'
  Color = 16447477
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object pnlUnit: TUniPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 561
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'pnlUnit'
    Color = 16447477
    object synx: TUniSyntaxEdit
      Left = 1
      Top = 1
      Width = 1022
      Height = 481
      Hint = ''
      Font.Height = -13
      Font.Name = 'Courier New'
      Align = alClient
    end
    object pnlBottom: TUniPanel
      Left = 1
      Top = 482
      Width = 1022
      Height = 78
      Hint = ''
      Align = alBottom
      TabOrder = 2
      Caption = ''
      Color = 16447477
      object lblUnitName: TUniLabel
        Left = 19
        Top = 18
        Width = 58
        Height = 17
        Hint = ''
        Caption = 'UnitName'
        ParentFont = False
        Font.Height = -13
        TabOrder = 3
      end
      object edtUnitName: TUniEdit
        Left = 80
        Top = 12
        Width = 201
        Height = 28
        Hint = ''
        Text = 'RootUnit'
        ParentFont = False
        Font.Height = -13
        TabOrder = 2
        OnChange = edtUnitNameChange
      end
      object lbl1: TUniLabel
        Left = 283
        Top = 18
        Width = 24
        Height = 17
        Hint = ''
        Caption = '.pas'
        ParentFont = False
        Font.Height = -13
        TabOrder = 4
      end
      object btnDownload: TUniFSButton
        Left = 319
        Top = 8
        Width = 145
        Height = 34
        Hint = ''
        StyleButton = GoogleGreen
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = 'Download'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -13
        TabOrder = 1
        OnClick = btnDownloadClick
      end
      object chkandClassDTO: TUniCheckBox
        Left = 80
        Top = 46
        Width = 384
        Height = 17
        Hint = ''
        Checked = True
        Caption = 
          'and <b>Pkg.Json.DTO.pas</b> is the base class for all generated ' +
          'files'
        TabOrder = 5
      end
    end
  end
end
