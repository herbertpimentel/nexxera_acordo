program NexxeraAcordo;

uses
  Forms,
  untAcordo in 'untAcordo.pas' {FrmPrincipal},
  untDM in 'untDM.pas' {DM: TDataModule},
  untCadAcordo in 'data\untCadAcordo.pas' {FrmAcordo},
  untUtil in 'untUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmAcordo, FrmAcordo);
  Application.Run;
end.
