program Remora;

uses
  System.StartUpCopy,
  FMX.Forms,
  uCEFApplication,
  UnitPrincipal in 'UnitPrincipal.pas' {frmPrincipal},
  UnitDMPrincipal in 'UnitDMPrincipal.pas' {DMPrincipal: TDataModule};

{$R *.res}

begin
  CreateGlobalCEFApp;

  if GlobalCEFApp.StartMainProcess then
    begin
      Application.Initialize;
      Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.Run;
    end;

  DestroyGlobalCEFApp;
end.
