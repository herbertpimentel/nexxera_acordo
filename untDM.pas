unit untDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    TbEscritorio: TADOTable;
    DsEscritorio: TDataSource;
    DsAcordo: TDataSource;
    DsPendencia: TDataSource;
    TbAcordo: TADOTable;
    TbPendencia: TADOTable;
    TbEscritorioCdigo: TAutoIncField;
    TbEscritoriocpf_administrdor_escritorio: TWideStringField;
    TbEscritorionome_administrador_escritorio: TWideStringField;
    TbEscritorionome_escritorio: TWideStringField;
    TbEscritorioddd_escritorio: TWideStringField;
    TbEscritoriotelefone_escritorio: TWideStringField;
    TbEscritoriosigla_escritorio: TWideStringField;
    TbEscritoriocontador_acordos: TIntegerField;
    TbAcordoCdigo: TAutoIncField;
    TbAcordoEscritorio: TIntegerField;
    TbPendenciaCdigo: TAutoIncField;
    TbPendenciaAcordo: TIntegerField;
    TbPendenciaNumeroContrato: TWideStringField;
    TbPendenciaNumeroCarteira: TWideStringField;
    TbPendenciaDataVencimento: TDateTimeField;
    TbPendenciaUltimaParcelaPaga: TSmallintField;
    TbAcordoNumeroAcordo: TWideStringField;
    TbAcordoDataAcordo: TDateTimeField;
    TbAcordoNomeCliente: TWideStringField;
    TbAcordoEnderecoCliente: TWideStringField;
    TbAcordoNumeroEnderecoCliente: TWideStringField;
    TbAcordoComplementoEnderecoCliente: TWideStringField;
    TbAcordoBairroCliente: TWideStringField;
    TbAcordoMunicipioCliente: TWideStringField;
    TbAcordoUFCliente: TWideStringField;
    TbAcordoCepCliente: TWideStringField;
    TbAcordoDDDCliente: TWideStringField;
    TbAcordoTelefoneCliente: TWideStringField;
    TbAcordoCpfCnpjCliente: TWideStringField;
    TbAcordoNomeAvalista1: TWideStringField;
    TbAcordoNomeAvalista2: TWideStringField;
    TbAcordoCpfCnpjAvalista1: TWideStringField;
    TbAcordoFilialAvalista1: TWideStringField;
    TbAcordoCpfCnpjAvalista2: TWideStringField;
    TbAcordoFilialAvalista2: TWideStringField;
    TbAcordoObservacao: TWideStringField;
    TbAcordoCodigoErro: TWideStringField;
    TbAcordoDrcAcordoAprovado: TWideStringField;
    TbAcordoDrcDataAprovacaoAcordo: TDateTimeField;
    TbAcordoDrcNomeOperadorAprovacao: TWideStringField;
    TbAcordoTaxaJurosAcordo: TBCDField;
    TbAcordoPeriodicidadeAcordo: TWideStringField;
    TbAcordoQuantidadeParcelas: TIntegerField;
    TbAcordoValorAtoEntrada: TBCDField;
    TbAcordoValorParcelaAcordo: TBCDField;
    TbAcordoDataVencimento1ParcelaAcordo: TDateTimeField;
    TbAcordoValorHonorarios: TBCDField;
    TbAcordoTaxaReferencia: TWideStringField;
    TbAcordoNumeroContaCliente: TWideStringField;
    TbAcordoNumeroAgenciaCliente: TWideStringField;
    TbAcordoCodigoMeioPagamento: TWideStringField;
    TbAcordoFilialCpfCnpjCliente: TWideStringField;
    TbAcordoValorTotalAcordo: TBCDField;
    TbAcordoValorConfessado: TBCDField;
    TbAcordoDtGeracaoArquivo: TDateTimeField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
    if (not ADOConnection1.Connected) then
        ADOConnection1.Connected := true;

    if (not TbEscritorio.Active) then
        TbEscritorio.Active := true;

    if (not TbAcordo.Active) then
        TbAcordo.Active := true;

    if (not TbPendencia.Active) then
        TbPendencia.Active := true;
end;

end.
