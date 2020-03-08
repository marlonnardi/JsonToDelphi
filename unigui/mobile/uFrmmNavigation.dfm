object frmmNavigation: TfrmmNavigation
  Left = 0
  Top = 0
  ClientHeight = 480
  ClientWidth = 320
  Caption = 'Navigation'
  OnShow = UnimFormShow
  CloseButton.IconCls = 'arrow_left'
  CloseButton.DefaultIcon = False
  TitleButtons = <>
  PixelsPerInch = 96
  TextHeight = 13
  ScrollPosition = 0
  ScrollHeight = 47
  PlatformData = {}
  object url: TUnimURLFrame
    Left = 0
    Top = 0
    Width = 320
    Height = 480
    Hint = ''
    Align = alClient
    TabOrder = 0
    ParentColor = False
    Color = clBtnFace
  end
end
