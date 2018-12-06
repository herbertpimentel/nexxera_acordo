object FrmPrincipal: TFrmPrincipal
  Left = 192
  Top = 125
  Width = 932
  Height = 509
  Caption = 'Gerador de arquivo de acordos Layout NEXXERA'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonGerarArquivoRemessa: TButton
    Left = 16
    Top = 428
    Width = 201
    Height = 27
    Caption = 'Gerar aquivo de envido de dados'
    TabOrder = 0
    OnClick = ButtonGerarArquivoRemessaClick
  end
  object GroupBoxEscritorio: TGroupBox
    Left = 16
    Top = 8
    Width = 873
    Height = 121
    Caption = 'Dados do escrit'#243'rio '
    TabOrder = 1
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 80
      Height = 13
      Caption = 'CPF Administrdor'
      FocusControl = DBEditCpfAdministrador
    end
    object Label3: TLabel
      Left = 176
      Top = 72
      Width = 94
      Height = 13
      Caption = 'Nome Administrador'
      FocusControl = DBEditNomeAdministrador
    end
    object Label4: TLabel
      Left = 16
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Escrit'#243'rio'
      FocusControl = DBEditNomeEscritorio
    end
    object Label5: TLabel
      Left = 384
      Top = 14
      Width = 24
      Height = 13
      Caption = 'DDD'
      FocusControl = DBEditDDDEscritorio
    end
    object Label6: TLabel
      Left = 456
      Top = 16
      Width = 42
      Height = 13
      Caption = 'Telefone'
      FocusControl = DBEditTelefoneEscritorio
    end
    object Label7: TLabel
      Left = 616
      Top = 16
      Width = 23
      Height = 13
      Caption = 'Sigla'
      FocusControl = DBEditSiglaEscritorio
    end
    object Label8: TLabel
      Left = 680
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Contador'
      FocusControl = DBEditContadorEscritorio
    end
    object DBEditCpfAdministrador: TDBEdit
      Left = 16
      Top = 88
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      DataField = 'cpf_administrdor_escritorio'
      DataSource = DM.DsEscritorio
      TabOrder = 0
    end
    object DBEditNomeAdministrador: TDBEdit
      Left = 176
      Top = 88
      Width = 481
      Height = 21
      CharCase = ecUpperCase
      DataField = 'nome_administrador_escritorio'
      DataSource = DM.DsEscritorio
      TabOrder = 1
    end
    object DBEditNomeEscritorio: TDBEdit
      Left = 16
      Top = 32
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      DataField = 'nome_escritorio'
      DataSource = DM.DsEscritorio
      TabOrder = 2
    end
    object DBEditDDDEscritorio: TDBEdit
      Left = 384
      Top = 32
      Width = 49
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ddd_escritorio'
      DataSource = DM.DsEscritorio
      TabOrder = 3
    end
    object DBEditTelefoneEscritorio: TDBEdit
      Left = 456
      Top = 32
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      DataField = 'telefone_escritorio'
      DataSource = DM.DsEscritorio
      TabOrder = 4
    end
    object DBEditSiglaEscritorio: TDBEdit
      Left = 616
      Top = 32
      Width = 43
      Height = 21
      CharCase = ecUpperCase
      DataField = 'sigla_escritorio'
      DataSource = DM.DsEscritorio
      TabOrder = 5
    end
    object ButtonSalvarDadosEscritorio: TButton
      Left = 680
      Top = 88
      Width = 169
      Height = 25
      Caption = 'Salvar dados do escrit'#243'rio'
      TabOrder = 6
      OnClick = ButtonSalvarDadosEscritorioClick
    end
    object DBEditContadorEscritorio: TDBEdit
      Left = 680
      Top = 32
      Width = 57
      Height = 21
      CharCase = ecUpperCase
      Color = clBtnFace
      DataField = 'contador_acordos'
      DataSource = DM.DsEscritorio
      ReadOnly = True
      TabOrder = 7
    end
  end
  object GroupBoxAcodos: TGroupBox
    Left = 16
    Top = 144
    Width = 873
    Height = 273
    Caption = 'Acordos'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 21
      Width = 174
      Height = 13
      Caption = 'Localizar acordo por nome do cliente'
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 72
      Width = 841
      Height = 177
      DataSource = DM.DsAcordo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NumeroAcordo'
          Title.Caption = 'N'#186' Acordo'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DataAcordo'
          Title.Caption = 'Data do acordo'
          Width = 138
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeCliente'
          Title.Caption = 'Nome Cliente'
          Width = 282
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CpfCnpjCliente'
          Title.Caption = 'CPF/CNPJ'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeAvalista1'
          Title.Caption = 'Avalista 1'#186
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NomeAvalista2'
          Title.Caption = 'Avalista 2'#186
          Width = 240
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QuantidadeParcelas'
          Title.Caption = 'N'#186' Parcelas'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorAtoEntrada'
          Title.Caption = 'Valor Entrada'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorParcelaAcordo'
          Title.Caption = 'Valor Parcela'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ValorTotalAcordo'
          Title.Caption = 'Valor Total Acordo'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DtGeracaoArquivo'
          Title.Caption = 'Data de Gera'#231#227'o do Arquivo'
          Width = 150
          Visible = True
        end>
    end
    object EditLocalizarAcordo: TEdit
      Left = 16
      Top = 37
      Width = 665
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = EditLocalizarAcordoChange
    end
    object ButtonAdicionarAcordo: TButton
      Left = 712
      Top = 35
      Width = 139
      Height = 25
      Caption = 'Adicionar arcordo'
      TabOrder = 2
      OnClick = ButtonAdicionarAcordoClick
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 272
    Top = 424
  end
end
