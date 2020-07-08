object frmGenerateUnit: TfrmGenerateUnit
  Left = 0
  Top = 0
  ClientHeight = 561
  ClientWidth = 1024
  Caption = 'Preview Delphi Unit'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object pnlUnit: TUniPanel
    Left = 0
    Top = 0
    Width = 1024
    Height = 561
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = 'pnlUnit'
    object synx: TUniSyntaxEdit
      Left = 1
      Top = 1
      Width = 1022
      Height = 489
      Hint = ''
      Font.Height = -13
      Font.Name = 'Courier New'
      Align = alClient
      ExplicitHeight = 495
    end
    object pnlBottom: TUniPanel
      Left = 1
      Top = 490
      Width = 1022
      Height = 70
      Hint = ''
      Align = alBottom
      TabOrder = 2
      Caption = ''
      ExplicitTop = 491
      object lblUnitName: TUniLabel
        Left = 11
        Top = 17
        Width = 55
        Height = 16
        Hint = ''
        Caption = 'UnitName'
        ParentFont = False
        Font.Height = -13
        TabOrder = 1
      end
      object edtUnitName: TUniEdit
        Left = 72
        Top = 10
        Width = 201
        Height = 25
        Hint = ''
        Text = 'RootUnit'
        ParentFont = False
        Font.Height = -13
        TabOrder = 2
      end
      object lbl1: TUniLabel
        Left = 275
        Top = 17
        Width = 24
        Height = 16
        Hint = ''
        Caption = '.pas'
        ParentFont = False
        Font.Height = -13
        TabOrder = 3
      end
      object btnDownload: TUniFSButton
        Left = 311
        Top = 8
        Width = 145
        Height = 34
        Hint = ''
        StyleButton = Success
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = 'Download'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -13
        TabOrder = 4
        OnClick = btnDownloadClick
      end
      object chkandClassDTO: TUniCheckBox
        Left = 72
        Top = 43
        Width = 201
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'and Pkg.Json.DTO.pas'
        TabOrder = 5
      end
    end
  end
end
