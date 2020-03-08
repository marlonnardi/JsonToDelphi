object MainmForm: TMainmForm
  Left = 0
  Top = 0
  ClientHeight = 727
  ClientWidth = 320
  Caption = 'jsontodelphi'
  OnShow = UnimFormShow
  Color = clWhite
  OnResize = UnimFormResize
  TitleFontColor = 9264680
  CloseButton.Visible = False
  CloseButton.DefaultIcon = False
  CloseButton.ShowIcon = False
  TitleButtons = <
    item
      ButtonId = 0
      Separator = True
    end
    item
      ButtonId = 1
      IconCls = 'info'
    end
    item
      ButtonId = 2
      IconCls = 'team'
    end>
  OnTitleButtonClick = UnimFormTitleButtonClick
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object scrMaster: TUnimScrollBox
    AlignWithMargins = True
    Left = 0
    Top = 6
    Width = 320
    Height = 721
    Hint = ''
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Color = clWhite
    ScrollIndicators = False
    ScrollHeight = 668
    ScrollWidth = 0
    object memJson: TUnimMemo
      AlignWithMargins = True
      Left = 15
      Top = 5
      Width = 288
      Height = 343
      Hint = ''
      Margins.Left = 15
      Margins.Top = 5
      Margins.Right = 15
      Align = alTop
      Color = 15460837
      EmptyText = 'Enter JSON'
      LayoutConfig.Cls = 'border-radius-8'
      TabOrder = 0
    end
    object btnGenerate: TUnimButton
      AlignWithMargins = True
      Left = 15
      Top = 361
      Width = 288
      Height = 47
      Hint = ''
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 15
      Align = alTop
      Caption = 'Generate'
      UI = 'round'
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processing...'
      LayoutConfig.Cls = 'button-style'
      OnClick = btnGenerateClick
    end
    object btnValidate: TUnimButton
      AlignWithMargins = True
      Left = 15
      Top = 421
      Width = 288
      Height = 47
      Hint = ''
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 15
      Align = alTop
      Caption = 'Validate JSON'
      UI = 'round'
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processing...'
      LayoutConfig.Cls = 'button-style'
      OnClick = btnValidateClick
    end
    object btnSample: TUnimButton
      AlignWithMargins = True
      Left = 15
      Top = 481
      Width = 288
      Height = 47
      Hint = ''
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 15
      Align = alTop
      Caption = 'Sample Use'
      UI = 'round'
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processing...'
      LayoutConfig.Cls = 'button-style'
    end
    object btnDonate: TUnimButton
      AlignWithMargins = True
      Left = 15
      Top = 541
      Width = 288
      Height = 47
      Hint = ''
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 15
      Align = alTop
      Caption = 'Donate'
      UI = 'round'
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processing...'
      LayoutConfig.Cls = 'button-style'
      OnClick = btnDonateClick
    end
    object pnlFalcon: TUnimPanel
      AlignWithMargins = True
      Left = 15
      Top = 601
      Width = 288
      Height = 67
      Hint = ''
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 15
      Align = alTop
      Color = clWhite
      BorderStyle = ubsNone
      object imgFalcon: TUnimImage
        Left = 70
        Top = 14
        Width = 150
        Height = 39
        Hint = ''
        AutoSize = True
        Url = '/imagens/Falcon_Sistemas_Powered_by.png'
        OnClick = imgFalconClick
      end
    end
  end
end
