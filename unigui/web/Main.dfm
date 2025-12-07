object MainForm: TMainForm
  Left = 0
  Top = 0
  Width = 1080
  Height = 647
  Caption = 'MainForm'
  Color = 16447477
  BorderStyle = bsNone
  OldCreateOrder = False
  OnClose = UniFormClose
  OnKeyDown = UniFormKeyDown
  AutoScroll = True
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  OnAjaxEvent = UniFormAjaxEvent
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  DesignSize = (
    1080
    647)
  TextHeight = 15
  object pnlBottom: TUniPanel
    Left = 0
    Top = 601
    Width = 1080
    Height = 46
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsNone
    Caption = ''
    Color = 16447477
    DesignSize = (
      1080
      46)
    object lblVersion: TUniLabel
      Left = 24
      Top = 22
      Width = 89
      Height = 11
      Hint = 'Version'
      ShowHint = True
      ParentShowHint = False
      AutoSize = False
      Caption = '1.0.0.2'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Color = 10853781
      Font.Height = -9
      TabOrder = 2
      OnClick = lblVersionClick
    end
    object lblFalconSistemas: TUniLabel
      Left = 452
      Top = 8
      Width = 130
      Height = 32
      Cursor = crHandPoint
      Hint = ''
      TextConversion = txtHTML
      AutoSize = False
      Caption = 
        '<a href="https://www.falconsistemas.com.br" target="_blank" alt=' +
        '"Falcon Sistemas - Desenvolvimento de solu'#231#245'es em software"> <im' +
        'g src="https://jsontodelphi.com/imagens/Falcon_Sistemas_Powered_' +
        'by.png" title="Falcon Sistemas - Desenvolvimento de solu'#231#245'es em ' +
        'software"></a>'
      Anchors = []
      ParentFont = False
      Font.Color = clDefault
      Font.Height = -13
      Font.Name = 'Roboto'
      ParentColor = False
      Color = clBlack
      TabOrder = 1
    end
  end
  object pnlMaster: TUniPanel
    Left = 21
    Top = 8
    Width = 1024
    Height = 587
    Hint = ''
    Anchors = [akTop, akBottom]
    ParentFont = False
    Font.Name = 'Roboto'
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    Color = 16447477
    DesignSize = (
      1024
      587)
    object pnlTop: TUniPanel
      Left = 0
      Top = 0
      Width = 1024
      Height = 113
      Hint = ''
      Align = alTop
      TabOrder = 0
      BorderStyle = ubsNone
      Caption = ''
      Color = 16447477
      DesignSize = (
        1024
        113)
      object lblTitle: TUniLabel
        Left = 4
        Top = 16
        Width = 790
        Height = 45
        Hint = ''
        TextConversion = txtHTML
        Caption = '<a href="https://jsontodelphi.com">jsontodelphi</a>'
        ParentFont = False
        Font.Color = 9264680
        Font.Height = -33
        ParentColor = False
        Color = clGray
        TabOrder = 1
      end
      object lblSubTitle: TUniLabel
        Left = 3
        Top = 55
        Width = 231
        Height = 21
        Hint = ''
        Caption = 'generate delphi classes from json'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -16
        ParentColor = False
        Color = clGray
        TabOrder = 4
      end
      object lblDeveloper: TUniLabel
        Left = 941
        Top = 23
        Width = 590
        Height = 17
        Cursor = crHandPoint
        Hint = ''
        TextConversion = txtHTML
        Caption = 
          '<a style="color: #3399ff;" href="https://github.com/marlonnardi"' +
          ' target="_blank">Marlon Nardi</a>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clHighlight
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 3
      end
      object lbl1: TUniLabel
        Left = 659
        Top = 56
        Width = 106
        Height = 17
        Hint = ''
        Caption = 'with thanks to the '
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 7
      end
      object lbl2: TUniLabel
        Left = 817
        Top = 23
        Width = 122
        Height = 17
        Hint = ''
        Caption = 'web development by'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 2
      end
      object lbl3: TUniLabel
        Left = 767
        Top = 56
        Width = 87
        Height = 17
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
        TabOrder = 8
      end
      object lbl4: TUniLabel
        Left = 974
        Top = 56
        Width = 41
        Height = 17
        Hint = ''
        Caption = 'project'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 11
      end
      object lbl5: TUniLabel
        Left = 618
        Top = 56
        Width = 22
        Height = 16
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<i class="far fa-lg fa-hand-point-right" aria-hidden="true"></i>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 5
      end
      object UniLabel1: TUniLabel
        Left = 920
        Top = 88
        Width = 705
        Height = 17
        Cursor = crHandPoint
        Hint = ''
        TextConversion = txtHTML
        Caption = 
          '<a style="color: #3399ff;" href="https://github.com/ahausladen/J' +
          'sonDataObjects" target="_blank">JsonDataObjects</a>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clHighlight
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 16
      end
      object UniLabel2: TUniLabel
        Left = 739
        Top = 88
        Width = 129
        Height = 17
        Hint = ''
        Caption = 'I also recommend this'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 13
      end
      object lbl6: TUniLabel
        Left = 640
        Top = 56
        Width = 22
        Height = 16
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<i class="fab fa-lg fa-github"></i>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 6
      end
      object UniLabel3: TUniLabel
        Left = 876
        Top = 88
        Width = 22
        Height = 16
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<i class="far fa-lg fa-hand-point-right" aria-hidden="true"></i>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 14
      end
      object UniLabel4: TUniLabel
        Left = 898
        Top = 88
        Width = 22
        Height = 16
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<i class="fab fa-lg fa-github" aria-hidden="true"></i>'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 15
      end
      object lbl7: TUniLabel
        Left = 857
        Top = 56
        Width = 22
        Height = 17
        Hint = ''
        Caption = 'and'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        ParentColor = False
        Color = clBlack
        TabOrder = 9
      end
      object lbl8: TUniLabel
        Left = 883
        Top = 56
        Width = 85
        Height = 17
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
            'ithub.com/PKGeorgiev");'#13#10'}')
        TabOrder = 10
      end
      object lblJsonToPascal: TUniLabel
        Left = 3
        Top = 84
        Width = 997
        Height = 20
        Cursor = crHandPoint
        Hint = ''
        TextConversion = txtHTML
        Caption = 
          '<a style="color: #3399ff;" href="https://store.falconsistemas.co' +
          'm.br" target="_blank"><i class="fas fa-star"></i> The best compo' +
          'nents for Delphi</a>'
        ParentFont = False
        Font.Color = 15748954
        Font.Height = -15
        ParentColor = False
        Color = 16447477
        TabOrder = 12
      end
    end
    object btnCollaborators: TUniFSButton
      Left = 984
      Top = 446
      Width = 38
      Height = 34
      Hint = 'List of Contributors'
      ShowHint = True
      ParentShowHint = False
      StyleButton = GoogleSilver
      CaptionIconFont = '<i class="fas fa-comment-dollar" aria-hidden="true"></i>'
      BadgeText.Text = '0'
      BadgeText.TextColor = '#FFFFFF'
      BadgeText.TextSize = 10
      BadgeText.TextStyle = 'bold'
      BadgeText.BackgroundColor = '#D50000'
      Caption = ''
      ParentFont = False
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Roboto'
      TabOrder = 3
      OnClick = btnCollaboratorsClick
    end
    object lblNews: TUniLabel
      Left = 400
      Top = 458
      Width = 268
      Height = 17
      Cursor = crHandPoint
      Hint = ''
      TextConversion = txtHTML
      AutoSize = False
      Caption = 
        '<i class="fab fa-lg fa-github"></i> News Fixes & Features Decemb' +
        'er 2025'
      ParentFont = False
      Font.Color = clHighlight
      Font.Height = -13
      Font.Name = 'Roboto'
      ParentColor = False
      Color = clBlack
      ClientEvents.ExtEvents.Strings = (
        
          'click=function click(sender, eOpts)'#13#10'{'#13#10'  window.open("https://g' +
          'ithub.com/marlonnardi/JsonToDelphi/tree/master?tab=readme-ov-fil' +
          'e#fixes--features-7th-december-2025");'#13#10'}')
      TabOrder = 9
    end
    object btnGenerate: TUniFSButton
      Left = 2
      Top = 449
      Width = 140
      Height = 34
      Hint = ''
      StyleButton = GoogleBlue2
      CaptionIconFont = 
        '<i class="fa fa-check-circle" aria-hidden="true"; style="font-si' +
        'ze: 14px;"></i>'
      BadgeText.Text = '0'
      BadgeText.TextColor = '#FFFFFF'
      BadgeText.TextSize = 10
      BadgeText.TextStyle = 'bold'
      BadgeText.BackgroundColor = '#D50000'
      Caption = ' Generate'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 4
      ScreenMask.Enabled = True
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Generating unit...'
      OnClick = btnGenerateClick
    end
    object btnValidate: TUniFSButton
      Left = 150
      Top = 449
      Width = 115
      Height = 34
      Hint = ''
      StyleButton = GoogleSilver
      BadgeText.Text = '0'
      BadgeText.TextColor = '#FFFFFF'
      BadgeText.TextSize = 10
      BadgeText.TextStyle = 'bold'
      BadgeText.BackgroundColor = '#D50000'
      Caption = 'Validate JSON'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 5
      ClientEvents.ExtEvents.Strings = (
        
          'click=function click(sender, e, eOpts)'#13#10'{'#13#10'  window.open("https:' +
          '//jsonformatter.curiousconcept.com");'#13#10'}')
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Opening...'
    end
    object btnSample: TUniFSButton
      Left = 272
      Top = 449
      Width = 115
      Height = 34
      Hint = ''
      StyleButton = GoogleSilver
      BadgeText.Text = '0'
      BadgeText.TextColor = '#FFFFFF'
      BadgeText.TextSize = 10
      BadgeText.TextStyle = 'bold'
      BadgeText.BackgroundColor = '#D50000'
      Caption = 'Sample Use'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      TabOrder = 6
      ScreenMask.WaitData = True
      ScreenMask.Message = 'Opening...'
      OnClick = btnSampleClick
    end
    object grpSettings: TUniGroupBox
      Left = 3
      Top = 494
      Width = 384
      Height = 76
      Hint = ''
      Caption = 'Delphi class generation options'
      TabOrder = 10
      ParentFont = False
      Font.Name = 'Roboto'
      object chkUsePascalCase: TUniCheckBox
        Left = 16
        Top = 21
        Width = 168
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Use Pascal Case'
        ParentFont = False
        Font.Name = 'Roboto'
        TabOrder = 1
        Color = 16447477
      end
      object chkAddJsonPropertyAttributes: TUniCheckBox
        Left = 182
        Top = 21
        Width = 195
        Height = 17
        Hint = ''
        Caption = 'Add JsonProperty Attributes'
        ParentFont = False
        Font.Name = 'Roboto'
        TabOrder = 2
        Color = 16447477
      end
      object chkSuppressZeroDate: TUniCheckBox
        Left = 16
        Top = 46
        Width = 168
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Suppress Zero Date'
        TabOrder = 3
        Color = 16447477
      end
      object chkPostfixClassNames: TUniCheckBox
        Left = 182
        Top = 46
        Width = 195
        Height = 17
        Hint = ''
        Caption = 'Postfix class names'
        ParentFont = False
        Font.Name = 'Roboto'
        TabOrder = 4
        Color = 16447477
      end
    end
    object lblDoacao: TUniLabel
      Left = 709
      Top = 449
      Width = 151
      Height = 45
      Hint = ''
      TextConversion = txtHTML
      AutoSize = False
      Caption = 'lblDoacao'
      TabOrder = 7
      OnClick = lblDoacaoClick
    end
    object pgcJson: TUniPageControl
      Left = 0
      Top = 113
      Width = 1024
      Height = 327
      Hint = ''
      ActivePage = tabJson
      TabBarVisible = False
      Align = alTop
      TabOrder = 2
      object tabJson: TUniTabSheet
        Hint = ''
        Caption = 'tabJson'
        object memJson: TUniMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 1010
          Height = 320
          Hint = ''
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Roboto'
          Align = alTop
          TabOrder = 0
          EmptyText = 'Enter JSON'
        end
      end
      object tabDonate: TUniTabSheet
        Hint = ''
        Caption = 'tabDonate'
        object lblDonate: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 126
          Width = 1010
          Height = 43
          Hint = ''
          Margins.Top = 30
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'you can help with any amount'
          Align = alTop
          ParentFont = False
          Font.Color = clGreen
          Font.Height = -19
          Font.Name = 'Roboto'
          ParentColor = False
          Color = clGray
          TabOrder = 1
        end
        object lblDonate1: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 50
          Width = 1010
          Height = 43
          Hint = ''
          Margins.Top = 50
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 
            'We need your support to keep the server and domain up and runnin' +
            'g for years to come.'
          Align = alTop
          ParentFont = False
          Font.Color = clGreen
          Font.Height = -21
          Font.Name = 'Roboto'
          ParentColor = False
          Color = clGray
          TabOrder = 0
        end
        object pgrWizardDonate: TUniProgressBar
          AlignWithMargins = True
          Left = 20
          Top = 207
          Width = 976
          Height = 26
          Hint = ''
          Margins.Left = 20
          Margins.Top = 35
          Margins.Right = 20
          Max = 175
          Position = 2
          Align = alTop
          Text = 'Donated so far $'
          TabOrder = 2
        end
      end
      object tabConfig: TUniTabSheet
        Hint = ''
        Caption = 'tabConfig'
        object dbgDonate: TUniDBGrid
          Left = 0
          Top = 0
          Width = 1016
          Height = 268
          Hint = ''
          RowEditor = True
          DataSource = DS
          LoadMask.Message = 'Loading data...'
          RowHeight = 30
          ForceFit = True
          Align = alClient
          TabOrder = 0
        end
        object Navigator: TUniDBNavigator
          AlignWithMargins = True
          Left = 3
          Top = 271
          Width = 1010
          Height = 25
          Hint = ''
          DataSource = DS
          Align = alBottom
          TabOrder = 1
        end
      end
    end
    object btnDonate: TUniFSButton
      Left = 863
      Top = 450
      Width = 108
      Height = 24
      Hint = ''
      StyleButton = GoogleOrangeRound
      BadgeText.Text = '0'
      BadgeText.TextColor = '#FFFFFF'
      BadgeText.TextSize = 10
      BadgeText.TextStyle = 'bold'
      BadgeText.BackgroundColor = '#D50000'
      Caption = 'Donate in BRL'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      TabOrder = 8
      ClientEvents.ExtEvents.Strings = (
        
          'click=function click(sender, e, eOpts)'#13#10'{'#13#10'  window.open("https:' +
          '//www.asaas.com/c/909894685171");'#13#10'}')
    end
    object grpPartners: TUniGroupBox
      AlignWithMargins = True
      Left = 400
      Top = 494
      Width = 622
      Height = 76
      Hint = ''
      Caption = 'Partners'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 11
      object lblPipedrive: TUniLabel
        Left = 207
        Top = 24
        Width = 130
        Height = 34
        Cursor = crHandPoint
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = 
          '<a href="https://aff.trypipedrive.com/23yha0go7t8z" target="_bla' +
          'nk" alt="Pipedrive - CRM N'#186' 1 do mundo, feche mais neg'#243'cios"> <i' +
          'mg src="https://falconsistemas.com.br/assets/img/Pipedrive_Logo_' +
          'Green.png" style="height:34px" title="Pipedrive - CRM N'#186' 1 do mu' +
          'ndo, feche mais neg'#243'cios"></a>'
        ParentFont = False
        Font.Color = clDefault
        Font.Height = -13
        Font.Name = 'Roboto'
        ParentColor = False
        Color = clBlack
        TabOrder = 2
      end
      object lblFalconFinancas: TUniLabel
        Left = 18
        Top = 24
        Width = 130
        Height = 34
        Cursor = crHandPoint
        Hint = ''
        TextConversion = txtHTML
        AutoSize = False
        Caption = 
          '<a href="https://www.financeiro.app" target="_blank" alt="Falcon' +
          ' Finan'#231'as - Gerenciador Financeiro">'#10'  <img src="https://www.fin' +
          'anceiro.app/wp-content/uploads/2023/07/logo-falcon-financas.svg"' +
          ' style="height:30px; margin-top:1px;" title="Falcon Finan'#231'as - G' +
          'erenciador Financeiro">'#10'</a>'
        ParentFont = False
        Font.Color = clHighlight
        Font.Height = -13
        Font.Name = 'Roboto'
        ParentColor = False
        Color = clBlack
        TabOrder = 1
      end
    end
  end
  object tmr: TUniTimer
    Interval = 3000
    Enabled = False
    RunOnce = True
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = tmrTimer
    Left = 373
    Top = 144
  end
  object Confirm: TUniFSConfirm
    Theme = modern
    TypeColor = blue
    TypeAnimated = False
    Draggable = False
    EscapeKey = False
    CloseIcon = False
    Icon = 'far fa-smile-wink'
    RTL = False
    boxWidth = '450px'
    BackgroundDismiss = False
    ButtonTextConfirm = 'Confirma'
    ButtonTextCancel = 'Cancela'
    ButtonTextOther = 'Outro'
    ButtonTextOK = 'Ok'
    ButtonEnterConfirm = True
    ScreenMask.Enabled = False
    ScreenMask.Text = 'Processing'
    PromptType.TypePrompt = text
    PromptType.RequiredField = False
    PromptType.TextRequiredField = 'Field riquired'
    PromptType.CharCase = Normal_
    AutoFocusButton = fbConfirm
    Left = 421
    Top = 144
  end
  object Toast: TUniFSToast
    TitleSize = 13
    TitleLineHeight = 0
    MsgSize = 12
    MsgLineHeight = 0
    Theme = Dark
    ImageWidth = 0
    MaxWidth = 0
    zIndex = 99999
    Layout = Small
    Balloon = False
    Close = True
    CloseOnEscape = False
    CloseOnClick = False
    RTL = False
    Position = bottomRight
    TimeOut = 5000
    Drag = True
    Overlay = False
    ToastOnce = False
    PauseOnHover = True
    ResetOnHover = False
    ProgressBar = True
    ProgressBarColor = 'rgb(0, 255, 184)'
    ScreenMask.Enabled = False
    Animateinside = True
    TransitionIn = fadeInUp
    TransitionOut = fadeOut
    TransitionInMobile = fadeInUp
    TransitionOutMobile = fadeOutDown
    ButtonTextYes = 'Confirma'
    ButtonTextNo = 'Cancela'
    ButtonCustomActive = False
    RemoveInaldChar = True
    OnButtonCustomClickPopup = ToastButtonCustomClickPopup
    Left = 472
    Top = 143
  end
  object CDS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 576
    Top = 144
    object intgrfldCDSid: TIntegerField
      FieldName = 'Year'
    end
    object strngfldCDSLat: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object dtfldCDSDate: TDateField
      FieldName = 'Date'
    end
    object fltfldCDSValue: TFloatField
      FieldName = 'Value'
    end
    object AggregateCDSSumValue: TAggregateField
      FieldName = 'SumValue'
      Visible = True
      Active = True
      currency = True
      DisplayName = ''
      Expression = 'SUM(Value)'
    end
  end
  object DS: TDataSource
    DataSet = CDS
    Left = 616
    Top = 144
  end
end
