object MainmForm: TMainmForm
  Left = 0
  Top = 0
  ClientHeight = 706
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
    Height = 700
    Hint = ''
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Color = clWhite
    ScrollIndicators = False
    ExplicitHeight = 721
    ScrollHeight = 677
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
      ClientEvents.ExtEvents.Strings = (
        
          'tap=function tap(sender, e, eOpts)'#13#10'{'#13#10'  window.open("https://js' +
          'onformatter.curiousconcept.com");'#13#10'}')
      UI = 'round'
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Processing...'
      LayoutConfig.Cls = 'button-style'
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
      OnClick = btnSampleClick
    end
    object pnlFalcon: TUnimPanel
      AlignWithMargins = True
      Left = 15
      Top = 610
      Width = 288
      Height = 67
      Hint = ''
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 15
      Align = alTop
      Color = clWhite
      BorderStyle = ubsNone
      ExplicitTop = 601
      object imgFalcon: TUnimImage
        Left = 52
        Top = 14
        Width = 180
        Height = 39
        Hint = ''
        AutoSize = True
        Url = 
          'https://store.falconsistemas.com.br/imagens/sistema/falcon_siste' +
          'mas_store.png'
        OnClick = imgFalconClick
      end
    end
    object lblDoacao: TUnimLabel
      AlignWithMargins = True
      Left = 15
      Top = 541
      Width = 288
      Height = 56
      Hint = ''
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 15
      Alignment = taCenter
      AutoSize = False
      Caption = '<b>teste</b> teste'
      Align = alTop
      ParentFont = False
      ExplicitTop = 601
    end
  end
end
