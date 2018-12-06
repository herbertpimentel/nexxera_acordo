object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 837
  Top = 348
  Height = 439
  Width = 699
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=C:\Dev\' +
      'nexxera_acordo\data\acordos.mdb;Persist Security Info=True'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 88
    Top = 32
  end
  object TbEscritorio: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'escritorio'
    Left = 208
    Top = 40
    object TbEscritorioCdigo: TAutoIncField
      FieldName = 'C'#243'digo'
      ReadOnly = True
    end
    object TbEscritoriocpf_administrdor_escritorio: TWideStringField
      FieldName = 'cpf_administrdor_escritorio'
      Size = 255
    end
    object TbEscritorionome_administrador_escritorio: TWideStringField
      FieldName = 'nome_administrador_escritorio'
      Size = 255
    end
    object TbEscritorionome_escritorio: TWideStringField
      FieldName = 'nome_escritorio'
      Size = 255
    end
    object TbEscritorioddd_escritorio: TWideStringField
      FieldName = 'ddd_escritorio'
      Size = 255
    end
    object TbEscritoriotelefone_escritorio: TWideStringField
      FieldName = 'telefone_escritorio'
      Size = 255
    end
    object TbEscritoriosigla_escritorio: TWideStringField
      FieldName = 'sigla_escritorio'
      Size = 3
    end
    object TbEscritoriocontador_acordos: TIntegerField
      FieldName = 'contador_acordos'
    end
  end
  object DsEscritorio: TDataSource
    DataSet = TbEscritorio
    Left = 248
    Top = 40
  end
  object DsAcordo: TDataSource
    DataSet = TbAcordo
    Left = 256
    Top = 136
  end
  object DsPendencia: TDataSource
    DataSet = TbPendencia
    Left = 240
    Top = 224
  end
  object TbAcordo: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = 'Escritorio'
    MasterFields = 'C'#243'digo'
    MasterSource = DsEscritorio
    TableName = 'acordo'
    Left = 224
    Top = 136
    object TbAcordoCdigo: TAutoIncField
      FieldName = 'C'#243'digo'
      ReadOnly = True
    end
    object TbAcordoEscritorio: TIntegerField
      FieldName = 'Escritorio'
    end
    object TbAcordoNumeroAcordo: TWideStringField
      FieldName = 'NumeroAcordo'
      Size = 11
    end
    object TbAcordoDataAcordo: TDateTimeField
      FieldName = 'DataAcordo'
    end
    object TbAcordoNomeCliente: TWideStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
    object TbAcordoEnderecoCliente: TWideStringField
      FieldName = 'EnderecoCliente'
      Size = 40
    end
    object TbAcordoNumeroEnderecoCliente: TWideStringField
      FieldName = 'NumeroEnderecoCliente'
      Size = 7
    end
    object TbAcordoComplementoEnderecoCliente: TWideStringField
      FieldName = 'ComplementoEnderecoCliente'
    end
    object TbAcordoBairroCliente: TWideStringField
      FieldName = 'BairroCliente'
    end
    object TbAcordoMunicipioCliente: TWideStringField
      FieldName = 'MunicipioCliente'
      Size = 30
    end
    object TbAcordoUFCliente: TWideStringField
      FieldName = 'UFCliente'
      Size = 2
    end
    object TbAcordoCepCliente: TWideStringField
      FieldName = 'CepCliente'
      Size = 8
    end
    object TbAcordoDDDCliente: TWideStringField
      FieldName = 'DDDCliente'
      Size = 4
    end
    object TbAcordoTelefoneCliente: TWideStringField
      FieldName = 'TelefoneCliente'
      Size = 9
    end
    object TbAcordoCpfCnpjCliente: TWideStringField
      FieldName = 'CpfCnpjCliente'
      Size = 11
    end
    object TbAcordoNomeAvalista1: TWideStringField
      FieldName = 'NomeAvalista1'
      Size = 40
    end
    object TbAcordoNomeAvalista2: TWideStringField
      FieldName = 'NomeAvalista2'
      Size = 40
    end
    object TbAcordoCpfCnpjAvalista1: TWideStringField
      FieldName = 'CpfCnpjAvalista1'
      Size = 11
    end
    object TbAcordoFilialAvalista1: TWideStringField
      FieldName = 'FilialAvalista1'
      Size = 50
    end
    object TbAcordoCpfCnpjAvalista2: TWideStringField
      FieldName = 'CpfCnpjAvalista2'
      Size = 11
    end
    object TbAcordoFilialAvalista2: TWideStringField
      FieldName = 'FilialAvalista2'
      Size = 50
    end
    object TbAcordoObservacao: TWideStringField
      FieldName = 'Observacao'
      Size = 44
    end
    object TbAcordoCodigoErro: TWideStringField
      FieldName = 'CodigoErro'
      Size = 60
    end
    object TbAcordoDrcAcordoAprovado: TWideStringField
      FieldName = 'DrcAcordoAprovado'
      Size = 3
    end
    object TbAcordoDrcDataAprovacaoAcordo: TDateTimeField
      FieldName = 'DrcDataAprovacaoAcordo'
    end
    object TbAcordoDrcNomeOperadorAprovacao: TWideStringField
      FieldName = 'DrcNomeOperadorAprovacao'
      Size = 15
    end
    object TbAcordoTaxaJurosAcordo: TBCDField
      FieldName = 'TaxaJurosAcordo'
      Precision = 19
    end
    object TbAcordoPeriodicidadeAcordo: TWideStringField
      FieldName = 'PeriodicidadeAcordo'
      Size = 50
    end
    object TbAcordoQuantidadeParcelas: TIntegerField
      FieldName = 'QuantidadeParcelas'
    end
    object TbAcordoValorAtoEntrada: TBCDField
      FieldName = 'ValorAtoEntrada'
      Precision = 19
    end
    object TbAcordoValorParcelaAcordo: TBCDField
      FieldName = 'ValorParcelaAcordo'
      Precision = 19
    end
    object TbAcordoDataVencimento1ParcelaAcordo: TDateTimeField
      FieldName = 'DataVencimento1ParcelaAcordo'
    end
    object TbAcordoValorHonorarios: TBCDField
      FieldName = 'ValorHonorarios'
      Precision = 19
    end
    object TbAcordoTaxaReferencia: TWideStringField
      FieldName = 'TaxaReferencia'
      Size = 3
    end
    object TbAcordoNumeroContaCliente: TWideStringField
      FieldName = 'NumeroContaCliente'
      Size = 7
    end
    object TbAcordoNumeroAgenciaCliente: TWideStringField
      FieldName = 'NumeroAgenciaCliente'
      Size = 4
    end
    object TbAcordoCodigoMeioPagamento: TWideStringField
      FieldName = 'CodigoMeioPagamento'
      Size = 50
    end
    object TbAcordoFilialCpfCnpjCliente: TWideStringField
      FieldName = 'FilialCpfCnpjCliente'
      Size = 50
    end
    object TbAcordoValorTotalAcordo: TBCDField
      FieldName = 'ValorTotalAcordo'
      Precision = 19
    end
    object TbAcordoValorConfessado: TBCDField
      FieldName = 'ValorConfessado'
      Precision = 19
    end
    object TbAcordoDtGeracaoArquivo: TDateTimeField
      FieldName = 'DtGeracaoArquivo'
    end
  end
  object TbPendencia: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    IndexFieldNames = 'Acordo'
    MasterFields = 'C'#243'digo'
    MasterSource = DsAcordo
    TableName = 'pendencia'
    Left = 208
    Top = 224
    object TbPendenciaCdigo: TAutoIncField
      FieldName = 'C'#243'digo'
      ReadOnly = True
    end
    object TbPendenciaAcordo: TIntegerField
      FieldName = 'Acordo'
    end
    object TbPendenciaNumeroContrato: TWideStringField
      FieldName = 'NumeroContrato'
      Size = 9
    end
    object TbPendenciaNumeroCarteira: TWideStringField
      FieldName = 'NumeroCarteira'
      Size = 5
    end
    object TbPendenciaDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
    end
    object TbPendenciaUltimaParcelaPaga: TSmallintField
      FieldName = 'UltimaParcelaPaga'
    end
  end
end
