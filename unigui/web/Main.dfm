object MainForm: TMainForm
  Left = 0
  Top = 0
  Width = 1080
  Height = 624
  Caption = 'MainForm'
  Color = 15460837
  BorderStyle = bsNone
  OldCreateOrder = False
  OnClose = UniFormClose
  AutoScroll = True
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  OnAjaxEvent = UniFormAjaxEvent
  DesignSize = (
    1080
    624)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMaster: TUniPanel
    Left = 21
    Top = 8
    Width = 1024
    Height = 521
    Hint = ''
    Anchors = [akTop]
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    Color = 15460837
    object pnlTop: TUniPanel
      Left = 0
      Top = 0
      Width = 1024
      Height = 113
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      Color = 15460837
      DesignSize = (
        1024
        113)
      object lblTitle: TUniLabel
        Left = 4
        Top = 16
        Width = 176
        Height = 40
        Hint = ''
        Caption = 'jsontodelphi'
        ParentFont = False
        Font.Color = 9264680
        Font.Height = -33
        ParentColor = False
        Color = clGray
        TabOrder = 1
      end
      object lblSubTitle: TUniLabel
        Left = 4
        Top = 57
        Width = 236
        Height = 19
        Hint = ''
        Caption = 'generate delphi classes from json'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -16
        ParentColor = False
        Color = clGray
        TabOrder = 2
      end
      object lblDeveloper: TUniLabel
        Left = 941
        Top = 23
        Width = 73
        Height = 16
        Cursor = crHandPoint
        Hint = ''
        TextConversion = txtHTML
        Caption = 'Marlon Nardi'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clHighlight
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        ClientEvents.ExtEvents.Strings = (
          
            'click=function click(sender, eOpts)'#13#10'{'#13#10'  window.open("https://g' +
            'ithub.com/marlonnardi")'#13#10'}')
        TabOrder = 3
      end
      object lbl1: TUniLabel
        Left = 659
        Top = 56
        Width = 106
        Height = 16
        Hint = ''
        Caption = 'with thanks to the '
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 4
      end
      object lbl2: TUniLabel
        Left = 817
        Top = 23
        Width = 118
        Height = 16
        Hint = ''
        Caption = 'web development by'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 5
      end
      object lbl3: TUniLabel
        Left = 767
        Top = 56
        Width = 84
        Height = 16
        Cursor = crHandPoint
        Hint = ''
        TextConversion = txtHTML
        Caption = 'Petar Georgiev'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clHighlight
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        ClientEvents.ExtEvents.Strings = (
          
            'click=function click(sender, eOpts)'#13#10'{'#13#10'  window.open("https://g' +
            'ithub.com/PKGeorgiev");'#13#10'}')
        TabOrder = 6
      end
      object lbl4: TUniLabel
        Left = 974
        Top = 56
        Width = 40
        Height = 16
        Hint = ''
        Caption = 'project'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 7
      end
      object lbl5: TUniLabel
        Left = 618
        Top = 56
        Width = 22
        Height = 16
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<i class="fa fa-lg fa-hand-o-right" aria-hidden="true"></i>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 8
      end
      object UniLabel1: TUniLabel
        Left = 920
        Top = 88
        Width = 94
        Height = 16
        Cursor = crHandPoint
        Hint = ''
        TextConversion = txtHTML
        Caption = 'JsonDataObjects'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clHighlight
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        ClientEvents.ExtEvents.Strings = (
          
            'click=function click(sender, eOpts)'#13#10'{'#13#10'  window.open("https://g' +
            'ithub.com/ahausladen/JsonDataObjects");'#13#10'}')
        TabOrder = 9
      end
      object UniLabel2: TUniLabel
        Left = 739
        Top = 88
        Width = 127
        Height = 16
        Hint = ''
        Caption = 'I also recommend this'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 10
      end
      object lbl6: TUniLabel
        Left = 640
        Top = 56
        Width = 22
        Height = 16
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<i class="fa fa-lg fa-github" aria-hidden="true"></i>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 11
      end
      object UniLabel3: TUniLabel
        Left = 876
        Top = 88
        Width = 22
        Height = 16
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<i class="fa fa-lg fa-hand-o-right" aria-hidden="true"></i>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 12
      end
      object UniLabel4: TUniLabel
        Left = 898
        Top = 88
        Width = 22
        Height = 16
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<i class="fa fa-lg fa-github" aria-hidden="true"></i>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 13
      end
      object lblJsonToPascal: TUniLabel
        Left = 5
        Top = 82
        Width = 97
        Height = 19
        Hint = ''
        Caption = 'json to pascal'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -16
        ParentColor = False
        Color = clGray
        TabOrder = 14
      end
      object lbl7: TUniLabel
        Left = 857
        Top = 56
        Width = 21
        Height = 16
        Hint = ''
        Caption = 'and'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 15
      end
      object lbl8: TUniLabel
        Left = 884
        Top = 57
        Width = 83
        Height = 16
        Cursor = crHandPoint
        Hint = ''
        TextConversion = txtHTML
        Caption = 'Jens Borrisholt'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clHighlight
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        ClientEvents.ExtEvents.Strings = (
          
            'click=function click(sender, eOpts)'#13#10'{'#13#10'  window.open("https://g' +
            'ithub.com/JensBorrisholt");'#13#10'}')
        TabOrder = 16
      end
    end
    object memJson: TUniMemo
      AlignWithMargins = True
      Left = 3
      Top = 116
      Width = 1018
      Height = 320
      Hint = ''
      ParentFont = False
      Font.Height = -13
      Align = alTop
      TabOrder = 2
      EmptyText = 'Enter JSON'
    end
    object pnlControl: TUniPanel
      Left = 0
      Top = 445
      Width = 1024
      Height = 62
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsNone
      Caption = ''
      Color = 15460837
      DesignSize = (
        1024
        62)
      object lblDoacao: TUniLabel
        AlignWithMargins = True
        Left = 820
        Top = 13
        Width = 142
        Height = 42
        Cursor = crHandPoint
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        TextConversion = txtHTML
        AutoSize = False
        Caption = ''
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        TabOrder = 1
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
        ScreenMask.Message = 'Processando, por favor aguarde...'
        ScreenMask.Target = Owner
      end
      object btnGenerate: TUniFSButton
        Left = 4
        Top = 17
        Width = 140
        Height = 34
        Hint = ''
        StyleButton = Primary
        CaptionIconFont = '<i class="fa fa-check-circle" aria-hidden="true"></i>'
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = ' Generate'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -13
        TabOrder = 2
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
        ScreenMask.Message = 'Generating unit...'
        OnClick = btnGenerateClick
      end
      object btnValidate: TUniFSButton
        Left = 152
        Top = 17
        Width = 115
        Height = 34
        Hint = ''
        StyleButton = Default
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = 'Validate JSON'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        TabOrder = 3
        ClientEvents.ExtEvents.Strings = (
          
            'click=function click(sender, e, eOpts)'#13#10'{'#13#10'  window.open("https:' +
            '//jsonformatter.curiousconcept.com");'#13#10'}')
        ScreenMask.WaitData = True
        ScreenMask.Message = 'Opening...'
      end
      object btn1: TUniFSButton
        Left = 976
        Top = 17
        Width = 38
        Height = 34
        Hint = ''
        StyleButton = Default
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = '?'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        TabOrder = 4
        OnClick = btn1Click
      end
      object btnSample: TUniFSButton
        Left = 274
        Top = 17
        Width = 115
        Height = 34
        Hint = ''
        StyleButton = Default
        BadgeText.Text = '0'
        BadgeText.TextColor = '#FFFFFF'
        BadgeText.TextSize = 10
        BadgeText.TextStyle = 'bold'
        BadgeText.BackgroundColor = '#D50000'
        Caption = 'Sample Use'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        TabOrder = 5
        ScreenMask.WaitData = True
        ScreenMask.Message = 'Opening...'
        OnClick = btnSampleClick
      end
    end
    object spl1: TUniSplitter
      Left = 0
      Top = 439
      Width = 1024
      Height = 6
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
  end
  object pnlBottom: TUniPanel
    Left = 0
    Top = 571
    Width = 1080
    Height = 53
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsNone
    Caption = ''
    Color = 15460837
    DesignSize = (
      1080
      53)
    object imgFalconSistemas: TUniImage
      Left = 442
      Top = 6
      Width = 150
      Height = 39
      Cursor = crHandPoint
      Hint = 'http://www.falconsistemas.com.br'
      ShowHint = True
      ParentShowHint = False
      AutoSize = True
      Url = '/imagens/Falcon_Sistemas_Powered_by.png'
      Anchors = [akBottom]
      ClientEvents.ExtEvents.Strings = (
        
          'click=function click(sender, eOpts)'#13#10'{'#13#10'  window.open("https://f' +
          'alconsistemas.com.br");'#13#10'}')
      LayoutConfig.Cls = 'card card-radius'
    end
    object lblVersion: TUniLabel
      Left = 970
      Top = 34
      Width = 89
      Height = 11
      Hint = 'Version'
      ShowHint = True
      ParentShowHint = False
      Alignment = taRightJustify
      AutoSize = False
      Caption = '1.0.0.2'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Color = 10853781
      Font.Height = -9
      TabOrder = 2
    end
    object lblVerionPrior: TUniLabel
      Left = 26
      Top = 34
      Width = 89
      Height = 11
      Cursor = crHandPoint
      Hint = 'Version Old of JsonToDelphi'
      ShowHint = True
      ParentShowHint = False
      AutoSize = False
      Caption = 'Version Old'
      ParentFont = False
      Font.Color = 10853781
      Font.Height = -9
      TabOrder = 3
      OnClick = lblVerionPriorClick
    end
  end
end
