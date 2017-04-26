object Form3: TForm3
  Left = 192
  Top = 114
  Width = 658
  Height = 426
  Caption = 'Dados Importados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 650
    Height = 311
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 650
    Height = 81
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Campo'
    end
    object Label2: TLabel
      Left = 160
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Termo'
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 32
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 160
      Top = 32
      Width = 273
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 440
      Top = 30
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 520
      Top = 30
      Width = 75
      Height = 25
      Caption = 'Pr'#243'ximo'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object DataSource1: TDataSource
    DataSet = Form1.Cds
    Left = 136
    Top = 112
  end
end
