object MainForm: TMainForm
  Left = 88
  Top = 233
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MainForm'
  ClientHeight = 457
  ClientWidth = 1048
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label_1: TLabel
    Left = 242
    Top = 48
    Width = 54
    Height = 13
    Caption = #1054#1087#1077#1088#1072#1090#1086#1088':'
  end
  object Label_OP: TLabel
    Left = 302
    Top = 48
    Width = 3
    Height = 13
  end
  object FileListBox1: TFileListBox
    Left = 0
    Top = 25
    Width = 145
    Height = 411
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    Mask = '*.xml'
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 440
    Top = 0
    Width = 608
    Height = 457
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
    object E_PASS: TEdit
      Left = 3
      Top = 45
      Width = 131
      Height = 21
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = True
      TabOrder = 3
      Text = 'aq1sw2de3'
      TextHint = #1055#1072#1088#1086#1083#1100
    end
    object E_IP: TEdit
      Left = 3
      Top = 3
      Width = 73
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '172.19.3.23'
      TextHint = 'IP-'#1040#1044#1056#1045#1057
    end
    object E_Port: TEdit
      Left = 76
      Top = 3
      Width = 58
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = '3306'
      TextHint = #1055#1054#1056#1058
    end
    object E_USER: TEdit
      Left = 3
      Top = 24
      Width = 131
      Height = 21
      ReadOnly = True
      TabOrder = 2
      Text = 'root'
      TextHint = #1070#1079#1077#1088
    end
    object E_DB: TEdit
      Left = 3
      Top = 66
      Width = 131
      Height = 21
      TabOrder = 4
      Text = 'lims'
      TextHint = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
    end
    object Btn_Conect: TBitBtn
      Left = 2
      Top = 84
      Width = 133
      Height = 24
      Align = alCustom
      Caption = #1057#1086#1077#1076#1077#1085#1080#1090#1089#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = Btn_ConectClick
    end
    object Memo1: TMemo
      Left = 137
      Top = 2
      Width = 471
      Height = 333
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 6
      WordWrap = False
    end
    object mmo1: TMemo
      Left = 137
      Top = 333
      Width = 471
      Height = 121
      ScrollBars = ssBoth
      TabOrder = 7
      WordWrap = False
    end
    object BTN_SAVELOG: TBitBtn
      Left = 60
      Top = 429
      Width = 75
      Height = 25
      Caption = 'SAVE LOG'
      TabOrder = 8
      OnClick = BTN_SAVELOGClick
    end
    object E_Ciros: TEdit
      Left = 2
      Top = 139
      Width = 129
      Height = 21
      TabOrder = 9
      Text = 
        'c:\Spectro Smart Studio\Smart Analyzer Vision\State\'#10'Inst_ver.as' +
        'c'#10
    end
    object Memo2: TMemo
      Left = 2
      Top = 216
      Width = 129
      Height = 169
      Lines.Strings = (
        'Memo2')
      TabOrder = 10
      Visible = False
      WordWrap = False
    end
  end
  object E_PATH_XLS: TEdit
    Left = 0
    Top = 3
    Width = 105
    Height = 21
    TabOrder = 2
    Text = '\\172.19.3.3\public\xml'
  end
  object BTN_CH_PATH: TBitBtn
    Left = 124
    Top = 3
    Width = 21
    Height = 21
    Caption = '..'
    TabOrder = 3
    OnClick = BTN_CH_PATHClick
  end
  object BitBtn1: TBitBtn
    Left = 151
    Top = 1
    Width = 85
    Height = 23
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object CheckBox1: TCheckBox
    Left = 242
    Top = 5
    Width = 150
    Height = 15
    Caption = #1059#1076#1072#1083#1103#1090#1100' '#1087#1086#1089#1083#1077' '#1079#1072#1075#1088#1091#1079#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object BitBtn6: TBitBtn
    Left = 151
    Top = 23
    Width = 85
    Height = 23
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1042#1057#1025
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn6Click
  end
  object Panel2: TPanel
    Left = 0
    Top = 439
    Width = 434
    Height = 18
    Align = alCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object Gauge1: TGauge
      Left = 19
      Top = 1
      Width = 205
      Height = 16
      Align = alCustom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Progress = 0
      Visible = False
    end
    object Label7: TLabel
      Left = 230
      Top = 2
      Width = 3
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object BitBtn7: TBitBtn
      Left = 2
      Top = 2
      Width = 15
      Height = 15
      TabOrder = 0
      OnClick = BitBtn7Click
    end
  end
  object CB_AUTO: TCheckBox
    Left = 242
    Top = 19
    Width = 118
    Height = 15
    Caption = #1040#1074#1090#1086'. '#1079#1072#1075#1088#1091#1079#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = CB_AUTOClick
  end
  object btn_updatefolder: TBitBtn
    Left = 104
    Top = 3
    Width = 21
    Height = 21
    Caption = 'UP'
    TabOrder = 9
    OnClick = btn_updatefolderClick
  end
  object pgc1: TPageControl
    Left = 147
    Top = 60
    Width = 289
    Height = 375
    ActivePage = ts1
    MultiLine = True
    TabOrder = 10
    TabPosition = tpLeft
    object ts1: TTabSheet
      Caption = #1054#1087#1077#1088#1072#1090#1080#1074#1085#1086
      object Label_2: TLabel
        Left = 3
        Top = 3
        Width = 119
        Height = 13
        Caption = #1047#1072#1075#1088#1091#1078#1072#1077#1084#1099#1077' '#1083#1080#1085#1080#1080
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label_3: TLabel
        Left = 158
        Top = 3
        Width = 100
        Height = 13
        Caption = #1053#1045' '#1079#1072#1075#1088#1091#1078#1072#1077#1084#1099#1077
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object BTN_left: TBitBtn
        Left = 121
        Top = 111
        Width = 24
        Height = 25
        Caption = '<'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BTN_leftClick
      end
      object BTN_rigth: TBitBtn
        Left = 121
        Top = 140
        Width = 24
        Height = 25
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BTN_rigthClick
      end
      object lst1: TListBox
        Left = 3
        Top = 20
        Width = 115
        Height = 352
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 2
      end
      object lst2: TListBox
        Left = 146
        Top = 20
        Width = 115
        Height = 352
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
      end
    end
    object ts2: TTabSheet
      Caption = #1055#1086#1089#1090#1092#1072#1082#1090#1091#1084
      ImageIndex = 1
      object Label_4: TLabel
        Left = 17
        Top = 53
        Width = 84
        Height = 13
        Caption = #1047#1072#1075#1088#1091#1078#1072#1077#1084#1099#1077
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label_5: TLabel
        Left = 155
        Top = 53
        Width = 100
        Height = 13
        Caption = #1053#1045' '#1079#1072#1075#1088#1091#1078#1072#1077#1084#1099#1077
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object lst3: TListBox
        Left = 3
        Top = 68
        Width = 115
        Height = 299
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnDblClick = BTN_rigthClick
      end
      object BTN_p2: TBitBtn
        Left = 121
        Top = 144
        Width = 24
        Height = 25
        Caption = '<'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BTN_leftClick
      end
      object BTN_p3: TBitBtn
        Left = 121
        Top = 174
        Width = 24
        Height = 25
        Caption = '>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BTN_rigthClick
      end
      object lst4: TListBox
        Left = 148
        Top = 68
        Width = 114
        Height = 299
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 3
        OnDblClick = BTN_leftClick
      end
      object ComboBox_inst: TComboBox
        Left = 3
        Top = 3
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = 'Ciros'
        OnClick = ComboBox_instClick
        Items.Strings = (
          'Ciros'
          'ARCOS_EOP')
      end
      object DTP_1: TDateTimePicker
        Left = 154
        Top = 3
        Width = 102
        Height = 21
        Date = 43150.382744942130000000
        Time = 43150.382744942130000000
        TabOrder = 5
        OnChange = ComboBox_instClick
      end
      object ComboBox_metod: TComboBox
        Left = 3
        Top = 30
        Width = 253
        Height = 21
        TabOrder = 6
        TextHint = #1052#1077#1090#1086#1076
        OnClick = ComboBox_instClick
        Items.Strings = (
          '1'
          '2'
          '3')
      end
      object BTN_1: TBitBtn
        Left = 121
        Top = 339
        Width = 24
        Height = 25
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 7
        OnClick = BTN_1Click
      end
    end
  end
  object CheckBox_1: TCheckBox
    Left = 242
    Top = 33
    Width = 169
    Height = 15
    Caption = #1048#1075#1085#1086#1088#1080#1088#1086#1074#1072#1090#1100' '#1089#1084#1077#1085#1091' '#1084#1077#1090#1086#1076#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object XMLDocument1: TXMLDocument
    Left = 88
    Top = 176
    DOMVendorDesc = 'MSXML'
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 24
    Top = 288
  end
  object ZQuery1: TZQuery
    Connection = ZConnection2
    SQL.Strings = (
      'SELECT * FROM lims.power;')
    Params = <
      item
        DataType = ftBlob
        Name = 'XML'
        ParamType = ptUnknown
      end>
    Left = 24
    Top = 240
    ParamData = <
      item
        DataType = ftBlob
        Name = 'XML'
        ParamType = ptUnknown
      end>
  end
  object ZQuery2: TZQuery
    Connection = ZConnection2
    Params = <>
    Left = 88
    Top = 240
  end
  object DataSource2: TDataSource
    DataSet = ZQuery2
    Left = 80
    Top = 296
  end
  object ZConnection2: TZConnection
    ControlsCodePage = cCP_UTF16
    ClientCodepage = 'cp1251'
    Catalog = ''
    Properties.Strings = (
      'codepage=cp1251')
    HostName = '172.19.3.23'
    Port = 3306
    Database = 'lims'
    User = 'root'
    Password = 'aq1sw2de3'
    Protocol = 'mysql-5'
    Left = 23
    Top = 176
  end
  object TiM_Auto: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TiM_AutoTimer
    Left = 79
    Top = 357
  end
  object mm1: TMainMenu
    Left = 78
    Top = 124
    object N1: TMenuItem
      Caption = #1054#1073#1088#1072#1079#1094#1099
      OnClick = N1Click
    end
    object N5: TMenuItem
      Caption = #1052#1077#1090#1086#1076#1099
      OnClick = N5Click
    end
    object N2: TMenuItem
      Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1077
      object N3: TMenuItem
        AutoHotkeys = maManual
        Caption = #1069#1083#1077#1084#1077#1085#1090#1099' '#1088#1072#1079#1087#1072#1088#1089#1080#1090#1100
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1052#1072#1089#1089#1086#1074#1086#1077' '#1087#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        OnClick = N4Click
      end
    end
    object N6: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = N6Click
    end
  end
  object ZipMaster1: TZipMaster
    ConfirmErase = False
    Version = '1.9.2.0024'
    Left = 17
    Top = 353
  end
  object DS_temp: TDataSource
    DataSet = zQ_temp
    Left = 477
    Top = 290
  end
  object zQ_temp: TZQuery
    Connection = ZConnection2
    Params = <>
    Left = 477
    Top = 244
  end
end
