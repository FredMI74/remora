unit UnitDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.FMXUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet;

type
  TDMPrincipal = class(TDataModule)
    sqlVerificaTimesTrades: TFDQuery;
    sqlInsereTimesTrades: TFDCommand;
    sqlForcaLivroOfertas: TFDQuery;
    sqlMediaPreco: TFDQuery;
    sqlVerificaLivroOfertas: TFDQuery;
    sqlInsereLivroOfertas: TFDCommand;
    sqlUltimaNegociacao: TFDQuery;
    sqlInsereLog: TFDCommand;
    sqlUltimoID: TFDQuery;
	sqlLimpaTimesTrades: TFDCommand;
    sqlLimpaLivro: TFDCommand;
    sqlReplayDolar: TFDQuery;
    sqlReplayIndice: TFDQuery;
    sqlResultados: TFDQuery;
    sqlInsereResultado: TFDCommand;
    sqlLimpaResultado: TFDCommand;
    sqlVariacaoPreco: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setConnection(Conexao : TFDConnection);
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDMPrincipal.setConnection(Conexao: TFDConnection);
var
  i: integer;
begin
  for i := 0 to self.ComponentCount-1 do
  begin
     if self.Components[i] is TFDCommand then
       TFDCommand(self.Components[i]).Connection := Conexao;
     if self.Components[i] is TFDQuery then
       TFDQuery(self.Components[i]).Connection := Conexao;
  end;
end;

end.
