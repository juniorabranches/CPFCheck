object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 649
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_CPF: TPanel
    Left = 12
    Top = 2
    Width = 641
    Height = 605
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBoxDados: TGroupBox
      Left = 2
      Top = 427
      Width = 637
      Height = 176
      Align = alBottom
      TabOrder = 1
      object Label3: TLabel
        Left = 7
        Top = 4
        Width = 139
        Height = 16
        Caption = 'Nome da Pessoa F'#237'sica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 385
        Top = 46
        Width = 110
        Height = 16
        Caption = 'Situa'#231#227'o Cadastral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel1: TLabel
        Left = 6
        Top = 89
        Width = 97
        Height = 16
        Caption = 'D'#237'gito Verificador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel2: TLabel
        Left = 6
        Top = 132
        Width = 207
        Height = 16
        Caption = 'C'#243'digo de controle do comprovante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel3: TLabel
        Left = 125
        Top = 89
        Width = 143
        Height = 16
        Caption = 'Comprovante emitido '#224's:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 238
        Top = 46
        Width = 100
        Height = 16
        Caption = 'Data Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 7
        Top = 46
        Width = 26
        Height = 16
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object EditRazaoSocial: TEdit
        Left = 8
        Top = 20
        Width = 613
        Height = 24
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object EditSituacao: TEdit
        Left = 385
        Top = 63
        Width = 236
        Height = 24
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object EdtDigitoVerificador: TEdit
        Left = 6
        Top = 106
        Width = 113
        Height = 24
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object EdtEmissao: TEdit
        Left = 125
        Top = 106
        Width = 495
        Height = 24
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object EdtCodCtrlControle: TEdit
        Left = 6
        Top = 149
        Width = 615
        Height = 24
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object EdtDataNasc: TEdit
        Left = 237
        Top = 63
        Width = 141
        Height = 24
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object EdtCPF: TEdit
        Left = 7
        Top = 63
        Width = 227
        Height = 24
        TabStop = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object GroupBoxChromium: TGroupBox
      Left = 2
      Top = 2
      Width = 637
      Height = 419
      Align = alTop
      TabOrder = 0
      object ChromiumCPF: TChromium
        Left = 2
        Top = 15
        Width = 633
        Height = 402
        Align = alClient
        DefaultUrl = 'about:blank'
        TabOrder = 0
        OnAddressChange = ChromiumCPFAddressChange
        OnConsoleMessage = ChromiumCPFConsoleMessage
        OnBeforeResourceLoad = ChromiumCPFBeforeResourceLoad
        Options.Javascript = STATE_ENABLED
        Options.JavascriptOpenWindows = STATE_ENABLED
        Options.JavascriptAccessClipboard = STATE_ENABLED
        Options.JavascriptDomPaste = STATE_ENABLED
        Options.Plugins = STATE_ENABLED
        Options.UniversalAccessFromFileUrls = STATE_ENABLED
        Options.FileAccessFromFileUrls = STATE_ENABLED
        Options.WebSecurity = STATE_DISABLED
        Options.ApplicationCache = STATE_ENABLED
      end
    end
  end
  object BitBtnSair: TButton
    Left = 576
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 1
    OnClick = BitBtnSairClick
  end
  object BitBtnConfirma: TButton
    Left = 460
    Top = 616
    Width = 110
    Height = 25
    Caption = 'Confirmar'
    Enabled = False
    TabOrder = 2
  end
  object BtnNovaConsulta: TButton
    Left = 24
    Top = 616
    Width = 125
    Height = 25
    Caption = 'Nova Consulta'
    TabOrder = 3
    OnClick = BtnNovaConsultaClick
  end
end
