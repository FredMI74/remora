unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Forms, FMX.Graphics, FMX.Dialogs,Vcl.DdeMan,
  FMX.ListBox, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, System.Actions, FMX.ActnList,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FMX.Objects,System.UIConsts, FMX.Layouts, UnitDMPrincipal,
  DateUtils, FMX.DateTimeCtrls, FMX.Controls, FireDAC.Comp.UI, Winapi.Windows,
   uCEFFMXWindowParent, uCEFFMXChromium, uFMXApplicationService,
  uCEFInterfaces, uCEFConstants, uCEFTypes, uCEFChromiumCore,
  FMX.Platform.Win,  uCEFApplication, IniFiles, FMX.Edit, FMX.EditBox,
  FMX.SpinBox, System.ImageList, FMX.ImgList, System.StrUtils, FMX.TabControl,
  FMXTee.Engine, FMXTee.Procs, FMXTee.Chart, FMXTee.Series, FMXTee.Canvas,
  FMX.DialogService.Async, FMX.Ani;

type

  Tcoordenadas = class(TObject)
  private
     fx : integer;
     fy : integer;
  public
    property x : integer read fx write fx;
    property y : integer read fy write fy;
  end;

  TfrmPrincipal = class(TForm)
    pnlMenuDolar: TPanel;
    memoLogDolar: TMemo;
    btnIniciarDolar: TButton;
    btnPararDolar: TButton;
    pnlAnaliseDolar: TLayout;
    layoutSituacaoDolar: TLayout;
    lblSituacaoDolar: TLabel;
    recSituacaoDolar: TRoundRect;
    div1Dolar: TLayout;
    FDConnection: TFDConnection;
    TimerAnaliseDolar: TTimer;
    LayoutMomentoOrdemDolar: TLayout;
    recMomentoOrdemDolar: TRoundRect;
    lblMomentoOrdemDolar: TLabel;
    btnReplayDolar: TButton;
    TimerReplayDolar: TTimer;
    dtDolar: TDateEdit;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    div2Dolar: TLayout;
    layoutMetaAtingidaDolar: TLayout;
    recMetaAtingidaDolar: TRoundRect;
    lblMetaAtingidaDolar: TLabel;
    PnlRobo: TPanel;
    FMXChromium: TFMXChromium;
    btnIniciar1Dolar: TButton;
    timerInicioDolar: TTimer;
    spinQtdDolar: TSpinBox;
    pnlMenuPit: TPanel;
    btnCarregarPit: TButton;
    btnLogin: TButton;
    chkOperarPitDolar: TCheckBox;
    btnAssinatura: TButton;
    pnlDolar: TPanel;
    lblDolar: TLabel;
    pnlIndice: TPanel;
    pnlMenuIndice: TPanel;
    btnIniciarIndice: TButton;
    btnPararIndice: TButton;
    btnReplayIndice: TButton;
    dtIndice: TDateEdit;
    btnIniciar1Indice: TButton;
    spinQtdIndice: TSpinBox;
    chkOperarPitindice: TCheckBox;
    lblIndice: TLabel;
    pnlAnaliseIndice: TLayout;
    layoutSituacaoIndice: TLayout;
    recSituacaoIndice: TRoundRect;
    lblSituacaoIndice: TLabel;
    div1Indice: TLayout;
    LayoutMomentoOrdemIndice: TLayout;
    recMomentoOrdemIndice: TRoundRect;
    lblMomentoOrdemIndice: TLabel;
    div2Indice: TLayout;
    layoutMetaAtingidaIndice: TLayout;
    recMetaAtingidaIndice: TRoundRect;
    lblMetaAtingidaIndice: TLabel;
    memoLogIndice: TMemo;
    edtCodigoDolar: TEdit;
    edtCodigoIndice: TEdit;
    imgDolar: TRectangle;
    imgIndice: TRectangle;
    btnLimparDolar: TButton;
    ImageList: TImageList;
    btnLimparIndice: TButton;
    btnCapturarDolar: TButton;
    btnCapturarIndice: TButton;
    tbPaineis: TTabControl;
    tabPitNegociacao: TTabItem;
    TabGrafico: TTabItem;
    pnlPitNegociacao: TPanel;
    TimerAnaliseIndice: TTimer;
    timerInicioIndice: TTimer;
    timerReplayIndice: TTimer;
    TimerSomenteCapturaDolar: TTimer;
    TimerSomenteCapturaIndice: TTimer;
    scrollGrafDolar: TScrollBox;
    imgGrafDolar: TImage;
    scrollGrafIndice: TScrollBox;
    ImgGrafIndice: TImage;
    StatusBarOp: TStatusBar;
    lblDataHoraOrdemDolar: TLabel;
    lblDataHoraOrdemIndice: TLabel;
    TabResultados: TTabItem;
    pnlResultado: TPanel;
    cmbMes: TComboBox;
    spinAno: TSpinBox;
    btnAtualizarResultados: TButton;
    grafResultadosDolar: TChart;
    SerieDolar: TLineSeries;
    grafResultadosIndice: TChart;
    SerieIndice: TLineSeries;
    SerieDolarPositivo: TBarSeries;
    SerieDolarNegativo: TBarSeries;
    SerieIndicePositivo: TBarSeries;
    SerieIndiceNegativo: TBarSeries;
    btnMetaIndice: TButton;
    btnMetaDolar: TButton;
    chkExecOrdensDolar: TCheckBox;
    chkExecOrdensIndice: TCheckBox;
    btnZerarPosicaoIndice: TButton;
    btnZerarPosicaoDolar: TButton;
    AniIndicatorDolar: TBitmapListAnimation;
    AniIndicatorIndice: TBitmapListAnimation;
    procedure FormCreate(Sender: TObject);
    procedure btnIniciarDolarClick(Sender: TObject);
    procedure btnPararDolarClick(Sender: TObject);
    procedure TimerAnaliseDolarTimer(Sender: TObject);
    procedure btnReplayDolarClick(Sender: TObject);
    procedure TimerReplayDolarTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FMXChromiumAfterCreated(Sender: TObject;
      const browser: ICefBrowser);
    procedure FMXChromiumLoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer);
    procedure btnCarregarPitClick(Sender: TObject);
    procedure btnIniciar1DolarClick(Sender: TObject);
    procedure timerInicioDolarTimer(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnAssinaturaClick(Sender: TObject);
    procedure spinQtdDolarChange(Sender: TObject);
    procedure TimerAnaliseIndiceTimer(Sender: TObject);
    procedure timerInicioIndiceTimer(Sender: TObject);
    procedure timerReplayIndiceTimer(Sender: TObject);
    procedure btnIniciarIndiceClick(Sender: TObject);
    procedure btnPararIndiceClick(Sender: TObject);
    procedure btnIniciar1IndiceClick(Sender: TObject);
    procedure btnReplayIndiceClick(Sender: TObject);
    procedure spinQtdIndiceChange(Sender: TObject);
    procedure imgDolarClick(Sender: TObject);
    procedure imgIndiceClick(Sender: TObject);
    procedure btnLimparDolarClick(Sender: TObject);
    procedure btnLimparIndiceClick(Sender: TObject);
    procedure setupBotaoes(ativo : string);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerSomenteCapturaDolarTimer(Sender: TObject);
    procedure TimerSomenteCapturaIndiceTimer(Sender: TObject);
    procedure btnCapturarDolarClick(Sender: TObject);
    procedure btnCapturarIndiceClick(Sender: TObject);
    procedure tbPaineisChange(Sender: TObject);
    procedure btnAtualizarResultadosClick(Sender: TObject);
    procedure btnMetaDolarClick(Sender: TObject);
    procedure btnMetaIndiceClick(Sender: TObject);
    procedure btnZerarPosicaoIndiceClick(Sender: TObject);
    procedure btnZerarPosicaoDolarClick(Sender: TObject);
    procedure chkExecOrdensDolarChange(Sender: TObject);
    procedure chkExecOrdensIndiceChange(Sender: TObject);
  private
    { Private declarations }

    ultimo_id,
    id_atual,
    num_capturados,
    ciclo_estabilidade,
    posicao,
    direcao,
    forca_livro,
    forca_tendencia,
    cont_operacoes,
    cont_operacoes_positivas,
    cont_operacoes_negativas,
    qtd_ciclos_estabilidade,
    num_max_operacoes,
    cont_ciclos,
    qtd_negocios_ultimo_mov,
    id_preco_ref,
    qtd_ultimos_negocios,
    qtd_negocios_oscilacao,
    x, y,
    tick_ciclos_estabilidade,
    last_x, last_y, ref_y,
    lim_sup, lim_inf,
    qtd_operacoes_ajuste_meta,
    qtd_ref_livro,
    considerar_qtd_menor,
    inversao_loss,
    meta_inicial_stop_gain,
    min_pontos_oscilacao,
    max_pontos_oscilacao,
    considera_oscilacao,
    agressivo : Array [1..2] of integer;

    analisando,
    inseriu,
    meta_atingida,
    dentro_oscilacao : Array [1..2] of boolean;

    preco_incial,
    preco_compra,
    preco_venda,
    preco_para_compra,
    preco_para_venda,
    preco_ref,
    pontos_acumulados,
    stop_gain,
    stop_loss,
    meta,
    ultimo_preco,
    percentual_dif_livro,
    ref_percentual_livro,
    stop_gain_tempo,
    stop_loss_tempo,
    stop_tempo,
    ultimo_lucro_perda,
    preco_compra_ref, preco_venda_ref,
    lucro_perda, lucro_perda_total,
    percentual_ajuste_meta,
    stop_loss_mant_operacao,
    stop_loss_operacao : Array [1..2] of double;

    coordenadas : Array[1..2] of Array of Tcoordenadas;

    dt_hora_primeiro_negocio,
    dt_hora_ultimo_inserido,
    data_hora_ultima_operacao,
    data_hora_ultima_ordem,
    data_hora_inicio: Array [1..2] of TDateTime;

    ultimo_log, ultima_op_stop_loss : Array [1..2] of string;

    movimento : Array [1..2] of Array of string;

    DmPrincipal : TDMPrincipal;
    ddeCliTrydCotacao,
    ddeCliTrydNegocio,
    ddeCliTrydLivro : TDdeClientConv;
    FMXWindowParent : TFMXWindowParent;

    bmpGrafico : Array [1..2] of FMX.Graphics.TBitmap;

    procedure IniciarDDE;
  public
    { Public declarations }
    procedure CapturarDados(ativo : string);
    procedure Analisar(ativo : string; data_hora: TDateTime);
    procedure Comprar(ativo : string;data_hora : TDateTime);
    procedure Vender(ativo : string; data_hora : TDateTime);
    procedure MomentoEstavel(ativo : string);
    procedure MomentoOrdem(ativo, Operacao : String; Pontos : Double);
    procedure zerar(ativo : string);
    procedure registrar_log(ativo, texto : string);
    procedure registrar_resultado(ativo : string; data: TdateTime; op_positivas, op_negativas : integer; resultado : double);
    procedure metaAtingida(ativo: string; data_hora : TDateTime);
    procedure DoBrowserCreated;
    procedure DoDestroyParent;
    procedure ResizeChild;
    procedure ComprarNoPit(ativo : string);
    procedure VenderNoPit(ativo : string);
    function  PostCustomMessage(aMessage : cardinal; wParam : cardinal = 0; lParam : integer = 0) : boolean;
    procedure NotifyMoveOrResizeStarted;
    procedure SetBounds(ALeft: Integer; ATop: Integer; AWidth: Integer; AHeight: Integer); override;
    procedure zerar_posicao(ativo: string; data_hora: TDateTime);
    function LerIni(secao, parametro : string) : string;
    procedure GravarIni(secao, parametro, valor : string);
    procedure addmovimento(ativo, m : string);
    function ultimosmovimentos(ativo : string; qtd : integer) : string;
    procedure aplicarQtdNoPit(ativo : string);
    function idxAtivo(ativo : string): integer;
    procedure lerCodigosAtivos;
    procedure gravarCodigosAtivos;
    procedure SelecionarAtivoNoPit(ativo : string);
    procedure logParametros(ativo : string);
    procedure desenhaGrafico(ativo : string; x,y : integer);
    procedure desenhaOperacao(ativo : string; x, y : integer; resultado : double; mantendo_posicao: boolean);
    procedure desenhaEstabilidade(ativo: string; x,y, livro, tendencia : integer);
    procedure criarImagensGraf(ativo : string);
    procedure ajusteMeta(ativo : string);
    procedure ajusteManualMeta(ativo : string);
  end;

  const
    DOLFUT = 'DOLFUT';
    INDFUT = 'INDFUT';
    DIGITOS : Array [1..2] of Integer = (2,0);
    TICK : Array [1..2] of Double = (0.5, 5);
    FY : Array [1..2] of Double = (20, 0.5);

var
  frmPrincipal: TfrmPrincipal;

procedure CreateGlobalCEFApp;

implementation

{$R *.fmx}

procedure CreateGlobalCEFApp;
begin
  GlobalCEFApp := TCefApplication.Create;
end;

procedure TfrmPrincipal.addmovimento(ativo, m : string);
var
  i : integer;
begin
  i := length(movimento[idxAtivo(ativo)]);
  SetLength(movimento[idxAtivo(ativo)],i+1);
  movimento[idxAtivo(ativo)][i] := m;
  if(qtd_negocios_ultimo_mov[idxAtivo(ativo)] > qtd_ultimos_negocios[idxAtivo(ativo)]*3) and (i > 1)then
    movimento[idxAtivo(ativo)][i-1] := '-';
  qtd_negocios_ultimo_mov[idxAtivo(ativo)] := 0;
end;

function TfrmPrincipal.ultimosmovimentos(ativo : string; qtd : integer) : string;
var
  i, l : integer;

begin
  result := '';
  l := length(movimento[idxAtivo(ativo)]);
  if l >= qtd then
     for i := 1 to qtd do
        result := result + movimento[idxAtivo(ativo)][l-i];
end;

procedure TfrmPrincipal.NotifyMoveOrResizeStarted;
begin
  if (FMXChromium <> nil) then FMXChromium.NotifyMoveOrResizeStarted;
end;


procedure TfrmPrincipal.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  PositionChanged: Boolean;
begin
  PositionChanged := (ALeft <> Left) or (ATop <> Top);
  inherited SetBounds(ALeft, ATop, AWidth, AHeight);
  if PositionChanged then
    NotifyMoveOrResizeStarted;
end;


procedure TfrmPrincipal.setupBotaoes(ativo: string);
begin
   if ativo = DOLFUT then
   begin
     btnIniciarDolar.Enabled := btnPararDolar.Enabled;
     btnPararDolar.Enabled := not btnIniciarDolar.Enabled;
     btnIniciar1Dolar.Enabled := btnIniciarDolar.Enabled;
     btnReplayDolar.Enabled := btnIniciarDolar.Enabled;
     btnLimparDolar.Enabled := btnIniciarDolar.Enabled;
     btnCapturarDolar.Enabled := btnIniciarDolar.Enabled;
     btnMetaDolar.Enabled := btnPararDolar.Enabled;
     btnZerarPosicaoDolar.Enabled := btnPararDolar.Enabled;
   end;
   if ativo = INDFUT then
   begin
     btnIniciarIndice.Enabled := btnPararIndice.Enabled;
     btnPararIndice.Enabled := not btnIniciarIndice.Enabled;
     btnIniciar1Indice.Enabled := btnIniciarIndice.Enabled;
     btnReplayIndice.Enabled := btnIniciarIndice.Enabled;
     btnLimparIndice.Enabled := btnIniciarIndice.Enabled;
     btnCapturarIndice.Enabled := btnIniciarIndice.Enabled;
     btnMetaIndice.Enabled := btnPararIndice.Enabled;
     btnZerarPosicaoIndice.Enabled := btnPararIndice.Enabled;
   end;
end;

procedure TfrmPrincipal.spinQtdDolarChange(Sender: TObject);
begin
   aplicarQtdNoPit(DOLFUT);
end;

procedure TfrmPrincipal.spinQtdIndiceChange(Sender: TObject);
begin
   aplicarQtdNoPit(INDFUT);
end;

procedure TfrmPrincipal.tbPaineisChange(Sender: TObject);
begin
  if Assigned(FMXWindowParent) then
     FMXWindowParent.Visible := tbPaineis.ActiveTab = tabPitNegociacao;
end;

procedure  TfrmPrincipal.desenhaGrafico(ativo: string; x,y : integer);
var
  coord : TCoordenadas;
begin

  coord := TCoordenadas.Create;
  coord.x := x;
  coord.y := y;
  SetLength(coordenadas[idxAtivo(ativo)], length(coordenadas[idxAtivo(ativo)]) + 1);
  coordenadas[idxAtivo(ativo)][length(coordenadas[idxAtivo(ativo)])-1] := coord;

  with bmpGrafico[idxAtivo(ativo)].Canvas do
  begin
    BeginScene;
    Stroke.Kind := TBrushKind.Solid;
    if dentro_oscilacao[idxAtivo(ativo)] then
      Stroke.Color := claYellow
    else
    begin
      if considera_oscilacao[idxAtivo(ativo)] = 1 then
         Stroke.Color := claLightgray
      else
         Stroke.Color := claCyan;
    end;
    Stroke.Thickness := 1;
    DrawLine(PointF(last_x[idxAtivo(ativo)], last_y[idxAtivo(ativo)]), PointF(x,y),1);
    EndScene;
  end;

  last_x[idxAtivo(ativo)] := x;
  last_y[idxAtivo(ativo)] := y;

  if ativo = DOLFUT then
  begin

    imgGrafDolar.Bitmap := bmpGrafico[idxAtivo(ativo)];

    if x > tbPaineis.Width*0.90 then
       scrollGrafDolar.ScrollBy(-1,0);


    if (y - imgGrafDolar.Height/2 < lim_sup[idxAtivo(ativo)]) then
    begin
      lim_sup[idxAtivo(ativo)] := lim_sup[idxAtivo(ativo)] - 20;
      lim_inf[idxAtivo(ativo)] := lim_inf[idxAtivo(ativo)] - 20;
      scrollGrafDolar.ScrollBy(0,+20);
    end;

    if (y - imgGrafDolar.Height/2 > lim_inf[idxAtivo(ativo)]) then
    begin
      lim_sup[idxAtivo(ativo)] := lim_sup[idxAtivo(ativo)] + 20;
      lim_inf[idxAtivo(ativo)] := lim_inf[idxAtivo(ativo)] + 20;
      scrollGrafDolar.ScrollBy(0,-20);
    end;
  end
  else
  begin
    imgGrafIndice.Bitmap := bmpGrafico[idxAtivo(ativo)];

    if x > tbPaineis.Width*0.90 then
       scrollGrafIndice.ScrollBy(-1,0);

    if (y - imgGrafIndice.Height/2 < lim_sup[idxAtivo(ativo)]) then
    begin
      lim_sup[idxAtivo(ativo)] := lim_sup[idxAtivo(ativo)] - 20;
      lim_inf[idxAtivo(ativo)] := lim_inf[idxAtivo(ativo)] - 20;
      scrollGrafIndice.ScrollBy(0,+20);
    end;

    if (y - imgGrafIndice.Height/2 > lim_inf[idxAtivo(ativo)]) then
    begin
      lim_sup[idxAtivo(ativo)] := lim_sup[idxAtivo(ativo)] + 20;
      lim_inf[idxAtivo(ativo)] := lim_inf[idxAtivo(ativo)] + 20;
      scrollGrafIndice.ScrollBy(0,-20);
    end;
  end;

end;

procedure  TfrmPrincipal.desenhaOperacao(ativo: string; x,y : integer; resultado : double; mantendo_posicao: boolean);
var
  MyRect: TRectF;
begin

  MyRect.Create(x-1, y-1, x+1, y+1);
  with bmpGrafico[idxAtivo(ativo)].Canvas do
  begin
    BeginScene;
    Stroke.Kind := TBrushKind.Solid;

    if posicao[idxAtivo(ativo)] <> 0 then
    begin
      if mantendo_posicao then
        Stroke.Color := claLime
      else
        Stroke.Color := claBlue;
    end
    else
    begin
      if resultado > 0 then
        Stroke.Color := claLime
      else
        Stroke.Color := claRed;
    end;

    Stroke.Thickness := 10;
    DrawRect(MyRect, 10, 10, AllCorners, 1);
    EndScene;
  end;
  if ativo = DOLFUT then
    imgGrafDolar.Bitmap := bmpGrafico[idxAtivo(ativo)]
  else
    imgGrafIndice.Bitmap := bmpGrafico[idxAtivo(ativo)];
end;


procedure  TfrmPrincipal.desenhaEstabilidade(ativo: string; x,y, livro, tendencia : integer);
var
  MyRect: TRectF;
  i, ty : integer;
begin
  MyRect.Create(x-1, y-1, x+1, y+1);
  with bmpGrafico[idxAtivo(ativo)].Canvas do
  begin
    BeginScene;
    Stroke.Kind := TBrushKind.Solid;
    Stroke.Thickness := 2;
    i:= Length(coordenadas[idxAtivo(ativo)])-qtd_ultimos_negocios[idxAtivo(ativo)];
    Stroke.Color := claWhite;

    DrawLine(PointF(x,coordenadas[idxAtivo(ativo)][i].y + 30),
             PointF(coordenadas[idxAtivo(ativo)][i].x,coordenadas[idxAtivo(ativo)][i].y + 30), 1);

    DrawLine(PointF(coordenadas[idxAtivo(ativo)][i].x,coordenadas[idxAtivo(ativo)][i].y + 25),
             PointF(coordenadas[idxAtivo(ativo)][i].x,coordenadas[idxAtivo(ativo)][i].y + 35), 1);

    DrawLine(PointF(x,coordenadas[idxAtivo(ativo)][i].y + 25),
             PointF(x,coordenadas[idxAtivo(ativo)][i].y + 35),1);


    i:= Length(coordenadas[idxAtivo(ativo)])-qtd_ciclos_estabilidade[idxAtivo(ativo)];
    Stroke.Color := claGray;
    ty := Round(tick_ciclos_estabilidade[idxAtivo(ativo)] * TICK[idxAtivo(ativo)] * FY[idxAtivo(ativo)]);
    DrawLine(PointF(x,ref_y[idxAtivo(ativo)]- ty - 2),
             PointF(coordenadas[idxAtivo(ativo)][i].x,ref_y[idxAtivo(ativo)]- ty - 2), 1);

    DrawLine(PointF(x,ref_y[idxAtivo(ativo)] + ty + 2),
             PointF(coordenadas[idxAtivo(ativo)][i].x,ref_y[idxAtivo(ativo)] + ty + 2), 1);

    Stroke.Thickness := 5;
    DrawRect(MyRect, 5, 5, AllCorners, 0.8);

    Stroke.Thickness := 2;

    if livro > 0 then
    begin
      Stroke.Color := claLime;
      DrawLine(PointF(x,y+5), PointF(x,y+16),1);
      DrawLine(PointF(x,y+5), PointF(x-2,y+8),1);
      DrawLine(PointF(x,y+5), PointF(x+2,y+8),1);
    end
    else
    begin
       if livro < 0  then
       begin
        Stroke.Color := claRed;
        DrawLine(PointF(x,y+5), PointF(x,y+16), 1);
        DrawLine(PointF(x,y+16), PointF(x-2,y+12),1);
        DrawLine(PointF(x,y+16), PointF(x+2,y+12),1);
       end
       else
       begin
          Stroke.Color := claBlue;
          DrawLine(PointF(x-3,y+10), PointF(x+3,y+10),1);
       end;
    end;

    if tendencia > 0 then
    begin
      Stroke.Color := claLime;
      DrawLine(PointF(x,y-5), PointF(x,y-16), 1);
      DrawLine(PointF(x,y-16), PointF(x-2,y-12),1);
      DrawLine(PointF(x,y-16), PointF(x+2,y-12),1);
    end
    else
    begin
       if tendencia < 0  then
       begin
        Stroke.Color := claRed;
        DrawLine(PointF(x,y-5), PointF(x,y-16), 1);
        DrawLine(PointF(x,y-5), PointF(x-2,y-8),1);
        DrawLine(PointF(x,y-5), PointF(x+2,y-8),1);
       end
       else
       begin
          Stroke.Color := claBlue;
          DrawLine(PointF(x-2,y-10), PointF(x+2,y-10),1);
       end;
    end;

    EndScene;
  end;
  if ativo = DOLFUT then
    imgGrafDolar.Bitmap := bmpGrafico[idxAtivo(ativo)]
  else
    imgGrafIndice.Bitmap := bmpGrafico[idxAtivo(ativo)];


end;

procedure TfrmPrincipal.criarImagensGraf(ativo: string);
begin
  if (ativo = DOLFUT) then
  begin
    FreeAndNil(bmpGrafico[idxAtivo(ativo)]);
    bmpGrafico[idxAtivo(ativo)] := FMX.Graphics.Tbitmap.Create(trunc(imgGrafDolar.Width), trunc(imgGrafDolar.Height));
    bmpGrafico[idxAtivo(ativo)].Clear(claBlack);
    imgGrafDolar.Bitmap := bmpGrafico[idxAtivo(ativo)];
  end
  else
  begin
    FreeAndNil(bmpGrafico[idxAtivo(ativo)]);
    bmpGrafico[idxAtivo(ativo)] := FMX.Graphics.Tbitmap.Create(trunc(imgGrafIndice.Width), trunc(imgGrafIndice.Height));
    bmpGrafico[idxAtivo(ativo)].Clear(claBlack);
    imgGrafIndice.Bitmap := bmpGrafico[idxAtivo(ativo)];
  end;
end;

procedure TfrmPrincipal.Analisar(Ativo : String; data_hora : TDateTime);
var
  precos_tendencia : string;
  qtd_total_venda_livro,
  qtd_total_compra_livro,
  var_per, media_preco_atual: double;
  dt_ultimo_negocio_analise : TDateTime;
  situacao : string;
begin
   ultimo_preco[idxAtivo(ativo)] := 0;

   if (data_hora_ultima_operacao[idxAtivo(ativo)] = 0) or (cont_operacoes[idxAtivo(ativo)] = 0) or (posicao[idxAtivo(ativo)] <> 0) then
       data_hora_ultima_operacao[idxAtivo(ativo)] := data_hora;

   if dt_hora_primeiro_negocio[idxAtivo(ativo)] = 0 then
      dt_hora_primeiro_negocio[idxAtivo(ativo)] := data_hora;


   with DMPrincipal do
   begin
     // Análise do Ativo Selecionado
     if Ativo <> '' then
     begin
           // Situação
           sqlUltimaNegociacao.Close;
           sqlUltimaNegociacao.ParamByName('ativo').AsString := ativo;
           sqlUltimaNegociacao.ParamByName('data_hora').AsDateTime := data_hora;
           sqlUltimaNegociacao.ParamByName('data').AsDateTime := trunc(data_hora);
           sqlUltimaNegociacao.Open;

           var_per := sqlUltimaNegociacao.FieldByName('variacao_abertura').asFloat;
           dt_ultimo_negocio_analise := sqlUltimaNegociacao.FieldByName('data_hora').asDateTime;
           ultimo_preco[idxAtivo(ativo)]  := sqlUltimaNegociacao.FieldByName('preco').asFloat;
           id_atual[idxAtivo(ativo)] := sqlUltimaNegociacao.FieldByName('id').asInteger;

           if preco_incial [idxAtivo(ativo)] = 0 then
               preco_incial [idxAtivo(ativo)] := ultimo_preco[idxAtivo(ativo)];

           if  ultimo_id[idxAtivo(ativo)] <> id_atual[idxAtivo(ativo)] then
           begin
               cont_ciclos[idxAtivo(ativo)] := cont_ciclos[idxAtivo(ativo)] + 1;

               x[idxAtivo(ativo)] := x[idxAtivo(ativo)] + 1;
               y[idxAtivo(ativo)] := Trunc(((imgGrafDolar.Height/2)+((preco_incial [idxAtivo(ativo)] - ultimo_preco[idxAtivo(ativo)]) * FY[idxAtivo(ativo)])));

               if x[idxAtivo(ativo)] >= 8150 then
               begin
                 x[idxAtivo(ativo)] := 1;
                 last_x[idxAtivo(ativo)] := 1;
                 criarImagensGraf(ativo);
                 if ativo = DOLFUT then
                    scrollGrafDolar.ScrollBy(10000,0)
                 else
                    scrollGrafIndice.ScrollBy(10000,0)
               end;

               if ciclo_estabilidade[idxAtivo(ativo)] = 0 then
                     ref_y[idxAtivo(ativo)] := y[idxAtivo(ativo)];

               desenhaGrafico(ativo, x[idxAtivo(ativo)], y[idxAtivo(ativo)]);

               ultimo_id[idxAtivo(ativo)] := id_atual[idxAtivo(ativo)];

               situacao := FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + '     ' + floattostrF(var_per, ffNumber, 4,2) + '%';

               if (qtd_negocios_oscilacao[idxAtivo(ativo)] > 0) and (cont_ciclos[idxAtivo(ativo)] > qtd_negocios_oscilacao[idxAtivo(ativo)]) then
               begin
                 sqlVariacaoPreco.Close;
                 sqlVariacaoPreco.ParamByName('ativo').AsString := ativo;
                 sqlVariacaoPreco.ParamByName('data_hora').AsDateTime := data_hora;
                 sqlVariacaoPreco.ParamByName('data').AsDateTime := trunc(data_hora);
                 sqlVariacaoPreco.ParamByName('ultimos').AsInteger := qtd_negocios_oscilacao[idxAtivo(ativo)];
                 sqlVariacaoPreco.ParamByName('id_ref').AsInteger := ultimo_id[idxAtivo(ativo)];
                 sqlVariacaoPreco.ParamByName('qtd_menor').AsInteger := considerar_qtd_menor[idxAtivo(ativo)];
                 sqlVariacaoPreco.Open;

                 dentro_oscilacao[idxAtivo(ativo)] := (sqlVariacaoPreco.FieldByName('variacao').AsFloat >= min_pontos_oscilacao[idxAtivo(ativo)]) and
                                                      (sqlVariacaoPreco.FieldByName('variacao').AsFloat <= max_pontos_oscilacao[idxAtivo(ativo)]);

                 situacao := situacao + ' (' + FloatToStrF(sqlVariacaoPreco.FieldByName('variacao').AsFloat, ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ')';
               end
               else
                 dentro_oscilacao[idxAtivo(ativo)] := (qtd_negocios_oscilacao[idxAtivo(ativo)] = 0);

               situacao := situacao + ' - ' + sqlUltimaNegociacao.ParamByName('data_hora').AsString;

               if ativo = DOLFUT then
                 lblSituacaoDolar.Text := situacao
               else
                 lblSituacaoIndice.Text := situacao;

               if var_per < 0 then
               begin
                  if ativo = DOLFUT then
                     recSituacaoDolar.Fill.Color := claRed
                  else
                     recSituacaoIndice.Fill.Color := claRed;
               end
               else
               begin
                  if var_per > 0 then
                  begin
                    if ativo = DOLFUT then
                      recSituacaoDolar.Fill.Color := claGreen
                    else
                      recSituacaoIndice.Fill.Color := claGreen;
                  end
                  else
                  begin
                    if ativo = DOLFUT then
                      recSituacaoDolar.Fill.Color := claGold
                    else
                      recSituacaoIndice.Fill.Color := claGold;
                  end;
               end;
               layoutSituacaoDolar.Repaint;

               if (ultimo_preco[idxAtivo(ativo)] >= preco_ref[idxAtivo(ativo)] - tick_ciclos_estabilidade[idxAtivo(ativo)]*TICK[idxAtivo(ativo)]) and
                  (ultimo_preco[idxAtivo(ativo)] <= preco_ref[idxAtivo(ativo)] + tick_ciclos_estabilidade[idxAtivo(ativo)]*TICK[idxAtivo(ativo)]) then
               begin
                  ciclo_estabilidade[idxAtivo(ativo)] := ciclo_estabilidade[idxAtivo(ativo)] + 1;
               end
               else
               begin
                  ciclo_estabilidade[idxAtivo(ativo)] := 0;
                  preco_ref[idxAtivo(ativo)]  := ultimo_preco[idxAtivo(ativo)];
                  id_preco_ref[idxAtivo(ativo)] := ultimo_id[idxAtivo(ativo)];
               end;

               // Força do Livro de Ofertas
               try
                  qtd_total_venda_livro := 0;
                  qtd_total_compra_livro := 0;

                  sqlForcaLivroOfertas.Close;
                  sqlForcaLivroOfertas.ParamByName('ativo').AsString := ativo;
                  sqlForcaLivroOfertas.ParamByName('id_tt').asInteger := id_atual[idxAtivo(ativo)];
                  sqlForcaLivroOfertas.ParamByName('qtd_ref_livro').asInteger := qtd_ref_livro[idxAtivo(ativo)];
                  sqlForcaLivroOfertas.Open;

                  while not sqlForcaLivroOfertas.eof do
                  begin
                    if sqlForcaLivroOfertas.FieldByName('operacao').asString = 'V' then
                    begin
                      qtd_total_venda_livro := sqlForcaLivroOfertas.FieldByName('qtd_ofertas').asInteger;
                      preco_para_compra[idxAtivo(ativo)] := sqlForcaLivroOfertas.FieldByName('preco').asFloat;
                    end;
                    if sqlForcaLivroOfertas.FieldByName('operacao').asString = 'C' then
                    begin
                      qtd_total_compra_livro := sqlForcaLivroOfertas.FieldByName('qtd_ofertas').asInteger;
                      preco_para_venda[idxAtivo(ativo)] := sqlForcaLivroOfertas.FieldByName('preco').asFloat;
                    end;
                    sqlForcaLivroOfertas.Next;
                  end;

                  if (qtd_total_compra_livro > 0) and  (qtd_total_venda_livro > 0) then
                  begin

                     percentual_dif_livro[idxAtivo(ativo)] := ((qtd_total_compra_livro/(qtd_total_compra_livro+qtd_total_venda_livro))-
                                                              (qtd_total_venda_livro/(qtd_total_compra_livro+qtd_total_venda_livro))) * 100;
                     percentual_dif_livro[idxAtivo(ativo)] := abs(percentual_dif_livro[idxAtivo(ativo)]);

                     if percentual_dif_livro[idxAtivo(ativo)] > ref_percentual_livro[idxAtivo(ativo)]  then
                     begin
                       if (qtd_total_venda_livro > qtd_total_compra_livro) then
                       begin
                          forca_livro[idxAtivo(ativo)] := -1;
                       end
                       else if qtd_total_compra_livro > qtd_total_venda_livro  then
                       begin
                          forca_livro[idxAtivo(ativo)] := +1;
                       end;
                     end
                     else
                     begin
                        forca_livro[idxAtivo(ativo)] := 0;
                     end;
                  end;

               finally
                 sqlForcaLivroOfertas.Close;
               end;

               if ciclo_estabilidade[idxAtivo(ativo)] >= qtd_ciclos_estabilidade[idxAtivo(ativo)] then
               begin
                 ciclo_estabilidade[idxAtivo(ativo)] := 0;
                 id_preco_ref[idxAtivo(ativo)] := ultimo_id[idxAtivo(ativo)];

                 // Tendência
                 try
                   sqlMediaPreco.Close;
                   sqlMediaPreco.ParamByName('ativo').AsString := ativo;
                   sqlMediaPreco.ParamByName('data_hora').AsDateTime := dt_ultimo_negocio_analise;
                   sqlMediaPreco.ParamByName('data').AsDateTime := trunc(dt_ultimo_negocio_analise);
                   sqlMediaPreco.ParamByName('ultimos').AsInteger := qtd_ultimos_negocios[idxAtivo(ativo)];
                   sqlMediaPreco.ParamByName('id_ref').AsInteger := id_preco_ref[idxAtivo(ativo)];
                   sqlMediaPreco.ParamByName('qtd_menor').AsInteger := considerar_qtd_menor[idxAtivo(ativo)];
                   sqlMediaPreco.Open;

                   media_preco_atual := sqlMediaPreco.FieldByName('media_preco').AsFloat;

                   if media_preco_atual > ultimo_preco[idxAtivo(ativo)]  then
                   begin
                       forca_tendencia[idxAtivo(ativo)] := -1
                   end
                   else
                   begin
                      if media_preco_atual < ultimo_preco[idxAtivo(ativo)] then
                      begin
                          forca_tendencia[idxAtivo(ativo)] := +1;
                      end
                      else
                      begin
                          forca_tendencia[idxAtivo(ativo)] := 0;
                      end;
                   end;
                 finally
                   sqlMediaPreco.Close;
                 end;


                  //Log Livro
                  if forca_livro[idxAtivo(ativo)] > 0 then
                  begin
                    if posicao[idxAtivo(ativo)] = 0 then
                      registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - Livro Forçando Alta: ' + FloatToStrF(percentual_dif_livro[idxAtivo(ativo)], ffNumber, 15,2) + '%');
                  end
                  else
                  begin
                    if forca_livro[idxAtivo(ativo)] < 0 then
                    begin
                      if posicao[idxAtivo(ativo)] = 0 then
                        registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - Livro Forçando Baixa: ' + FloatToStrF(percentual_dif_livro[idxAtivo(ativo)], ffNumber, 15,2) + '%');
                    end
                    else
                    begin
                      if posicao[idxAtivo(ativo)] = 0 then
                        registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - Livro Estável: ' + FloatToStrF(percentual_dif_livro[idxAtivo(ativo)], ffNumber, 15,2) + '%');
                    end;
                  end;

                  //Log Tendência
                  precos_tendencia := 'Média: ' + FloatToStrF(media_preco_atual, ffNumber, 15,DIGITOS[idxAtivo(Ativo)]);
                  if forca_tendencia[idxAtivo(ativo)] > 0 then
                  begin
                    if posicao[idxAtivo(ativo)] = 0 then
                      registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - Tendência de Alta -  ' + precos_tendencia);
                  end
                  else
                  begin
                    if forca_tendencia[idxAtivo(ativo)] < 0 then
                    begin
                     if posicao[idxAtivo(ativo)] = 0 then
                       registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - Tendência de Baixa - ' + precos_tendencia);
                    end
                    else
                    begin
                     if posicao[idxAtivo(ativo)] = 0 then
                      registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - Tendência Estável - ' + precos_tendencia);
                    end;
                  end;

                  if posicao[idxAtivo(ativo)] = 0 then
                     registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - Estabilidade de preço');

                  direcao[idxAtivo(ativo)] := forca_tendencia[idxAtivo(ativo)] + forca_livro[idxAtivo(ativo)];
                  if direcao[idxAtivo(ativo)] >= 2 then
                  begin
                     if num_capturados[idxAtivo(ativo)] >= qtd_ultimos_negocios[idxAtivo(ativo)] then
                       addmovimento(ativo, 'S');
                     if posicao[idxAtivo(ativo)] = 0 then
                       registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ' + 'Vai subir - ' + FormatDateTime('hh:nn', dt_ultimo_negocio_analise) + ' - Fator: ' + InttoStr(direcao[idxAtivo(ativo)]) + ' ' + ultimosmovimentos(ativo, 3));
                  end
                  else
                  begin
                    if direcao[idxAtivo(ativo)] <= -2 then
                    begin
                      if num_capturados[idxAtivo(ativo)] >= qtd_ultimos_negocios[idxAtivo(ativo)] then
                         addmovimento(ativo, 'C');
                     if posicao[idxAtivo(ativo)] = 0 then
                       registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ' + 'Vai cair - ' + FormatDateTime('hh:nn', dt_ultimo_negocio_analise) + ' - Fator: ' + InttoStr(direcao[idxAtivo(ativo)]) + ' ' + ultimosmovimentos(ativo, 3));
                    end
                    else
                    begin

                      if num_capturados[idxAtivo(ativo)] >= qtd_ultimos_negocios[idxAtivo(ativo)] then
                      begin
                        if forca_tendencia[idxAtivo(ativo)] = +1 then
                           addmovimento(ativo, 's')
                        else if forca_tendencia[idxAtivo(ativo)] = -1 then
                            addmovimento(ativo, 'c')
                        else
                            addmovimento(ativo, 'I');
                      end;

                      if posicao[idxAtivo(ativo)] = 0 then
                        registrar_log(ativo, FloatToStrF(ultimo_preco[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ' + 'Indefinido - ' + FormatDateTime('hh:nn', dt_ultimo_negocio_analise) + ' - Fator: ' + InttoStr(direcao[idxAtivo(ativo)]) + ' ' + ultimosmovimentos(ativo, 3));
                    end;
                  end;


                  // Determinar Ordem
                  if num_capturados[idxAtivo(ativo)] >= qtd_ultimos_negocios[idxAtivo(ativo)] then
                  begin

                    desenhaEstabilidade(ativo,x[idxAtivo(ativo)],y[idxAtivo(ativo)], forca_livro[idxAtivo(ativo)], forca_tendencia[idxAtivo(ativo)]);
                    num_capturados[idxAtivo(ativo)] := 0;

                    //Entrada
                    if (posicao[idxAtivo(ativo)] = 0) and (((ultimosmovimentos(ativo, 1) = 'C') and (agressivo[idxAtivo(ativo)] = 1)) or
                                                           (ultimosmovimentos(ativo, 2) = 'Cc') or
                                                           (ultimosmovimentos(ativo, 2) = 'CC') or
                                                           ((ultimosmovimentos(ativo, 2) = 'CS') and (inversao_loss[idxAtivo(ativo)]=1))) then
                    begin
                      vender(Ativo, data_hora);
                    end
                    else
                    if (posicao[idxAtivo(ativo)] = 0) and (((ultimosmovimentos(ativo, 1) = 'S') and (agressivo[idxAtivo(ativo)] = 1))or
                                                           (ultimosmovimentos(ativo, 2) = 'Ss') or
                                                           (ultimosmovimentos(ativo, 2) = 'SS') or
                                                           ((ultimosmovimentos(ativo, 2) = 'SC') and (inversao_loss[idxAtivo(ativo)]=1))) then
                    begin
                      comprar(Ativo, data_hora);
                    end
                    else
                    //Saída
                    if (posicao[idxAtivo(ativo)] > 0) and ((ultimosmovimentos(ativo, 2) = 'Cc') or
                                                           (ultimosmovimentos(ativo, 2) = 'CC')) then
                    begin
                      vender(Ativo, data_hora);
                    end
                    else
                    if (posicao[idxAtivo(ativo)] < 0) and ((ultimosmovimentos(ativo, 2) = 'Ss') or
                                                           (ultimosmovimentos(ativo, 2) = 'SS')) then
                    begin
                      comprar(Ativo, data_hora);
                    end
                    else

                    //Inversao quando stop_loss
                    if (inversao_loss[idxAtivo(ativo)] = 1) and (posicao[idxAtivo(ativo)] = 0) and
                       (ultima_op_stop_loss[idxAtivo(ativo)] = 'V') and ((ultimosmovimentos(ativo, 1) = 'c') or (ultimosmovimentos(ativo, 1) = 'C')) then
                    begin
                      registrar_log(ativo, 'Inversão de posição após loss');
                      vender(Ativo, data_hora);
                    end
                    else
                    if (inversao_loss[idxAtivo(ativo)] = 1) and (posicao[idxAtivo(ativo)] = 0) and
                       (ultima_op_stop_loss[idxAtivo(ativo)] = 'C') and ((ultimosmovimentos(ativo, 1) = 's') or (ultimosmovimentos(ativo, 1) = 'S')) then
                    begin
                      registrar_log(ativo, 'Inversão de posição após loss');
                      comprar(Ativo, data_hora);
                    end

                    else
                    begin

                      // Renovação de ordem
                      if (posicao[idxAtivo(ativo)] < 0) and (ultimosmovimentos(ativo, 1) = 'C') and (lucro_perda[idxAtivo(ativo)] >= 0)then
                      begin
                        registrar_log(ativo, '');
                        registrar_log(ativo, 'Mantendo posição VENDA');
                        registrar_log(ativo, '');
                        desenhaOperacao(ativo, x[idxAtivo(ativo)],y[idxAtivo(ativo)], 0, true);
                        preco_venda_ref[idxAtivo(ativo)] := preco_para_venda[idxAtivo(ativo)];
                        stop_loss[idxAtivo(ativo)] := stop_loss_mant_operacao[idxAtivo(ativo)];
                      end
                      else
                      if (posicao[idxAtivo(ativo)] > 0) and (ultimosmovimentos(ativo, 1) = 'S') and (lucro_perda[idxAtivo(ativo)] >= 0) then
                      begin
                        registrar_log(ativo, '');
                        registrar_log(ativo, 'Mantendo posição COMPRA');
                        registrar_log(ativo, '');
                        desenhaOperacao(ativo, x[idxAtivo(ativo)],y[idxAtivo(ativo)], 0, true);
                        preco_compra_ref[idxAtivo(ativo)] := preco_para_compra[idxAtivo(ativo)];
                        stop_loss[idxAtivo(ativo)] := stop_loss_mant_operacao[idxAtivo(ativo)];
                      end

                      else
                         if posicao[idxAtivo(ativo)] = 0 then
                         begin
                           ultima_op_stop_loss[idxAtivo(ativo)] := 'X';
                           registrar_log(ativo, '');
                         end;
                    end;
                  end
                  else
                  begin
                    if posicao[idxAtivo(ativo)] = 0 then
                    begin
                      registrar_log(ativo, 'Capturando');
                      registrar_log(ativo, '');
                    end;
                  end;

                end;


         end;
     end;

     if posicao[idxAtivo(ativo)] = 1 then
     begin
       lucro_perda[idxAtivo(ativo)] := preco_para_venda[idxAtivo(ativo)]-preco_compra_ref[idxAtivo(ativo)];
       lucro_perda_total[idxAtivo(ativo)] := preco_para_venda[idxAtivo(ativo)]-preco_compra[idxAtivo(ativo)];

       if ultimo_lucro_perda[idxAtivo(ativo)] <> lucro_perda[idxAtivo(ativo)] then
       begin
         registrar_log(ativo, 'Lucro/Perda: ' + FloatToStrF(lucro_perda_total[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' (' +
                                                FloatToStrF(lucro_perda[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)])+ ')');
         ultimo_lucro_perda[idxAtivo(ativo)] := lucro_perda[idxAtivo(ativo)];
       end;

       if (lucro_perda[idxAtivo(ativo)] >= stop_gain[idxAtivo(ativo)])  or

          (lucro_perda_total[idxAtivo(ativo)]+pontos_acumulados[idxAtivo(ativo)] >= meta[idxAtivo(ativo)]) or

          ((minutesbetween(data_hora_ultima_ordem[idxAtivo(ativo)],data_hora)>=stop_tempo[idxAtivo(ativo)]) and
           (lucro_perda[idxAtivo(ativo)]>=stop_gain_tempo[idxAtivo(ativo)]) and
           (data_hora_ultima_ordem[idxAtivo(ativo)]>0)) then
       begin
          registrar_log(ativo, '');
          registrar_log(ativo, 'Stop Gain');
          Vender(Ativo, data_hora);
       end
       else
       begin
         if (lucro_perda[idxAtivo(ativo)] <= stop_loss[idxAtivo(ativo)])  or

            ((minutesbetween(data_hora_ultima_ordem[idxAtivo(ativo)],data_hora)>=stop_tempo[idxAtivo(ativo)]) and
            (lucro_perda[idxAtivo(ativo)]<=stop_gain_tempo[idxAtivo(ativo)]) and
            (data_hora_ultima_ordem[idxAtivo(ativo)]>0)) then
          begin
             registrar_log(ativo, '');
             registrar_log(ativo, 'Stop Loss');
             Vender(Ativo, data_hora);
             ultima_op_stop_loss[idxAtivo(ativo)] := 'V';
          end;
       end;
     end;

     if posicao[idxAtivo(ativo)] = -1 then
     begin
       lucro_perda[idxAtivo(ativo)] := preco_venda_ref[idxAtivo(ativo)]-preco_para_compra[idxAtivo(ativo)];
       lucro_perda_total[idxAtivo(ativo)] := preco_venda[idxAtivo(ativo)]-preco_para_compra[idxAtivo(ativo)];

       if ultimo_lucro_perda[idxAtivo(ativo)] <> lucro_perda[idxAtivo(ativo)] then
       begin
         registrar_log(ativo, 'Lucro/Perda: ' + FloatToStrF(lucro_perda_total[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' (' +
                                                FloatToStrF(lucro_perda[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)])+ ')');
         ultimo_lucro_perda[idxAtivo(ativo)] := lucro_perda[idxAtivo(ativo)];
       end;

       if (lucro_perda[idxAtivo(ativo)] >= stop_gain[idxAtivo(ativo)]) or

          (lucro_perda_total[idxAtivo(ativo)]+pontos_acumulados[idxAtivo(ativo)] >= meta[idxAtivo(ativo)]) or

          ((minutesbetween(data_hora_ultima_ordem[idxAtivo(ativo)],data_hora)>=stop_tempo[idxAtivo(ativo)]) and
           (lucro_perda[idxAtivo(ativo)]>=stop_gain_tempo[idxAtivo(ativo)]) and
           (data_hora_ultima_ordem[idxAtivo(ativo)]>0)) then
       begin
          registrar_log(ativo, '');
          registrar_log(ativo, 'Stop Gain');
          Comprar(Ativo, data_hora);
       end
       else
       begin
         if (lucro_perda[idxAtivo(ativo)] <= stop_loss[idxAtivo(ativo)]) or

            ((minutesbetween(data_hora_ultima_ordem[idxAtivo(ativo)],data_hora)>=stop_tempo[idxAtivo(ativo)]) and
            (lucro_perda[idxAtivo(ativo)]<=stop_gain_tempo[idxAtivo(ativo)]) and
            (data_hora_ultima_ordem[idxAtivo(ativo)]>0)) then
         begin
            registrar_log(ativo, '');
            registrar_log(ativo, 'Stop Loss');
            Comprar(Ativo, data_hora);
            ultima_op_stop_loss[idxAtivo(ativo)] := 'C';
         end;
       end;
     end;
  end;
end;

procedure TfrmPrincipal.logParametros(ativo : string);
begin
    registrar_log(ativo,'Parâmetros: ');
    registrar_log(ativo,'Meta.................: ' + FloatToStr(meta[idxAtivo(ativo)]));
    registrar_log(ativo,'Stop gain............: ' + FloatToStr(stop_gain[idxAtivo(ativo)]));
    registrar_log(ativo,'Stop loss............: ' + FloatToStr(stop_loss[idxAtivo(ativo)]));
    registrar_log(ativo,'Stop gain tempo......: ' + FloatToStr(stop_gain_tempo[idxAtivo(ativo)]));
    registrar_log(ativo,'Stop loss tempo......: ' + FloatToStr(stop_loss_tempo[idxAtivo(ativo)]));
    registrar_log(ativo,'Stop tempo...........: ' + FloatToStr(stop_tempo[idxAtivo(ativo)]));
    registrar_log(ativo,'Ref. perc. livro.....: ' + FloatToStr(ref_percentual_livro[idxAtivo(ativo)]));
    registrar_log(ativo,'Qtd. ref. livro......: ' + IntToStr(qtd_ref_livro[idxAtivo(ativo)]));
    registrar_log(ativo,'Qtd. ciclos..........: ' + IntToStr(qtd_ciclos_estabilidade[idxAtivo(ativo)]));
    registrar_log(ativo,'Tick ciclos..........: ' + IntToStr(tick_ciclos_estabilidade[idxAtivo(ativo)]));
    registrar_log(ativo,'Stop loss operação...: ' + FloatToStr(stop_loss_operacao[idxAtivo(ativo)]));
    registrar_log(ativo,'Nº máx. de operações.: ' + FloatToStr(num_max_operacoes[idxAtivo(ativo)]));
    registrar_log(ativo,'Qtd. últ. negócios...: ' + IntToStr(qtd_ultimos_negocios[idxAtivo(ativo)]));
    registrar_log(ativo,'Qtd. op. ajuste meta.: ' + IntToStr(qtd_operacoes_ajuste_meta[idxAtivo(ativo)]));
    registrar_log(ativo,'% ajuste da meta.....: ' + FloatToStr(percentual_ajuste_meta[idxAtivo(ativo)]));
    registrar_log(ativo,'Stop loss mant. op...: ' + FloatToStr(stop_loss_mant_operacao[idxAtivo(ativo)]));
    registrar_log(ativo,'Con. qtd. neg. menor.: ' + IntToStr(considerar_qtd_menor[idxAtivo(ativo)]));
    registrar_log(ativo,'Inversão loss........: ' + IntToStr(inversao_loss[idxAtivo(ativo)]));
    registrar_log(ativo,'Meta Ini. Stop gain..: ' + IntToStr(meta_inicial_stop_gain[idxAtivo(ativo)]));
    registrar_log(ativo,'Considerar oscilação.: ' + IntToStr(considera_oscilacao[idxAtivo(ativo)]));
    registrar_log(ativo,'Qtd. neg. oscilação..: ' + IntToStr(qtd_negocios_oscilacao[idxAtivo(ativo)]));
    registrar_log(ativo,'Mín. ticks oscilação.: ' + FloatToStr(min_pontos_oscilacao[idxAtivo(ativo)]));
    registrar_log(ativo,'Max. ticks oscilação.: ' + FloatToStr(max_pontos_oscilacao[idxAtivo(ativo)]));
    registrar_log(ativo,'Agressivo............: ' + IntToStr(agressivo[idxAtivo(ativo)]));

    registrar_log(ativo, '');
end;

procedure TfrmPrincipal.IniciarDDE;
begin
  if not Assigned(ddeCliTrydNegocio) then
  begin
    ddeCliTrydNegocio := TDdeClientConv.Create(self);
    ddeCliTrydNegocio.SetLink('Stech', 'NEGS');
    ddeCliTrydNegocio.OpenLink;
  end;
  if not Assigned(ddeCliTrydCotacao) then
  begin
    ddeCliTrydCotacao := TDdeClientConv.Create(self);
    ddeCliTrydCotacao.SetLink('Stech', 'COT');
    ddeCliTrydCotacao.OpenLink;
  end;
  if not Assigned(ddeCliTrydLivro) then
  begin
    ddeCliTrydLivro := TDdeClientConv.Create(self);
    ddeCliTrydLivro.SetLink('Stech', 'LVL2');
    ddeCliTrydLivro.OpenLink;
  end;
end;

procedure TfrmPrincipal.zerar(ativo : string);
begin
  id_atual[idxAtivo(ativo)] := 0;
  direcao[idxAtivo(ativo)] := 0;
  ultimo_id[idxAtivo(ativo)] := 0;
  posicao[idxAtivo(ativo)] := 0;
  preco_compra[idxAtivo(ativo)] := 0;
  preco_venda[idxAtivo(ativo)] := 0;
  preco_compra_ref[idxAtivo(ativo)] := 0;
  preco_venda_ref[idxAtivo(ativo)] := 0;
  preco_para_compra[idxAtivo(ativo)] := 0;
  preco_para_venda[idxAtivo(ativo)] := 0;
  inseriu[idxAtivo(ativo)] := false;
  num_capturados[idxAtivo(ativo)] := 0;
  pontos_acumulados[idxAtivo(ativo)] := 0;
  forca_livro[idxAtivo(ativo)] := 0;
  cont_operacoes[idxAtivo(ativo)] := 0;
  cont_operacoes_positivas[idxAtivo(ativo)] := 0;
  cont_operacoes_negativas[idxAtivo(ativo)] := 0;
  data_hora_ultima_operacao[idxAtivo(ativo)] := 0;
  dt_hora_primeiro_negocio[idxAtivo(ativo)] := 0;
  meta_atingida[idxAtivo(ativo)] := false;
  data_hora_inicio[idxAtivo(ativo)] := 0;
  SetLength(movimento[idxAtivo(ativo)],0);
  ultimo_log[idxAtivo(ativo)] := '';
  data_hora_ultima_ordem[idxAtivo(ativo)] := 0;
  preco_ref[idxAtivo(ativo)] := 0;
  id_preco_ref[idxAtivo(ativo)] := 0;
  ciclo_estabilidade[idxAtivo(ativo)] := 0;
  cont_ciclos[idxAtivo(ativo)] := 0;
  qtd_negocios_ultimo_mov[idxAtivo(ativo)] := 0;
  preco_incial[idxAtivo(ativo)] := 0;
  last_x[idxAtivo(ativo)] := 0;
  x[idxAtivo(ativo)] := 0;
  y[idxAtivo(ativo)] := 0;
  ultimo_lucro_perda[idxAtivo(ativo)] := 9999;
  lucro_perda[idxAtivo(ativo)] := 0;
  lucro_perda_total[idxAtivo(ativo)] := 0;
  ref_y[idxAtivo(ativo)] := 0;
  SetLength(coordenadas[idxAtivo(ativo)],0);
  ultima_op_stop_loss[idxAtivo(ativo)] := 'X';
  dentro_oscilacao[idxAtivo(ativo)] := false;

  lim_sup[idxAtivo(ativo)] := -150;
  lim_inf[idxAtivo(ativo)] := +150;

  if ativo = DOLFUT then
  begin
    stop_gain[idxAtivo(ativo)] := strToFloat(lerIni('dolar','stop_gain_DOLFUT'));
    stop_loss[idxAtivo(ativo)] := strToFloat(lerIni('dolar','stop_loss_DOLFUT'));
    stop_gain_tempo[idxAtivo(ativo)] := strToFloat(lerIni('dolar','stop_gain_tempo_DOLFUT'));
    stop_loss_tempo[idxAtivo(ativo)] := strToFloat(lerIni('dolar','stop_loss_tempo_DOLFUT'));
    stop_tempo[idxAtivo(ativo)] := strToFloat(lerIni('dolar','stop_tempo_DOLFUT'));
    meta[idxAtivo(ativo)] := strToFloat(lerIni('dolar','meta_DOLFUT'));
    ref_percentual_livro[idxAtivo(ativo)] := strToFloat(lerIni('dolar','ref_percentual_livro_DOLFUT'));
    qtd_ciclos_estabilidade[idxAtivo(ativo)] := strToInt(lerIni('dolar','qtd_ciclos_estabilidade_DOLFUT'));
    tick_ciclos_estabilidade[idxAtivo(ativo)] := strToInt(lerIni('dolar','tick_ciclos_estabilidade_DOLFUT'));
    stop_loss_operacao[idxAtivo(ativo)] := strToFloat(lerIni('dolar','stop_loss_operacao_DOLFUT'));
    num_max_operacoes[idxAtivo(ativo)] := strToInt(lerIni('dolar','num_max_operacoes_DOLFUT'));
    qtd_ultimos_negocios[idxAtivo(ativo)] := strToInt(lerIni('dolar','qtd_ultimos_negocios_DOLFUT'));
    qtd_operacoes_ajuste_meta[idxAtivo(ativo)] := strToInt(lerIni('dolar','qtd_operacoes_ajuste_meta_DOLFUT'));
    percentual_ajuste_meta[idxAtivo(ativo)] := strToFloat(lerIni('dolar','percentual_ajuste_meta_DOLFUT'));
    stop_loss_mant_operacao[idxAtivo(ativo)] := strToFloat(lerIni('dolar','stop_loss_mant_operacao_DOLFUT'));
    qtd_ref_livro[idxAtivo(ativo)]  := strToInt(lerIni('dolar','qtd_ref_livro_DOLFUT'));
    considerar_qtd_menor[idxAtivo(ativo)] := strToInt(lerIni('dolar','considerar_qtd_menor_DOLFUT'));
    inversao_loss[idxAtivo(ativo)] := strToInt(lerIni('dolar','inversao_loss_DOLFUT'));
    meta_inicial_stop_gain[idxAtivo(ativo)] := strToInt(lerIni('dolar','meta_inicial_stop_gain_DOLFUT'));
    considera_oscilacao[idxAtivo(ativo)] := strToInt(lerIni('dolar','considera_oscilacao_DOLFUT'));
    qtd_negocios_oscilacao[idxAtivo(ativo)] := strToInt(lerIni('dolar','qtd_negocios_oscilacao_DOLFUT'));
    min_pontos_oscilacao[idxAtivo(ativo)] := strToInt(lerIni('dolar','min_pontos_oscilacao_DOLFUT'));
    max_pontos_oscilacao[idxAtivo(ativo)] := strToINt(lerIni('dolar','max_pontos_oscilacao_DOLFUT'));
    agressivo[idxAtivo(ativo)] := strToInt(lerIni('dolar','agressivo_DOLFUT'));

    memoLogDolar.Lines.clear;

    recmetaAtingidaDolar.Fill.Color := claLightgray;
    lblmetaAtingidaDolar.Text := '';
    lblDataHoraOrdemDolar.text:=  '  Última operação Dólar:';

    lblSituacaoDolar.Text := '';
    recSituacaoDolar.Fill.Color := claLightgray;

    last_y[idxAtivo(ativo)] := Trunc(imgGrafDolar.Height/2);

    criarImagensGraf(ativo);
    scrollGrafDolar.ScrollBy(10000,-20000);
    scrollGrafDolar.ScrollBy(0,3800);
  end
  else
  begin
    stop_gain[idxAtivo(ativo)] := strToFloat(lerIni('indice','stop_gain_INDFUT'));
    stop_loss[idxAtivo(ativo)] := strToFloat(lerIni('indice','stop_loss_INDFUT'));
    stop_gain_tempo[idxAtivo(ativo)] := strToFloat(lerIni('indice','stop_gain_tempo_INDFUT'));
    stop_loss_tempo[idxAtivo(ativo)] := strToFloat(lerIni('indice','stop_loss_tempo_INDFUT'));
    stop_tempo[idxAtivo(ativo)] := strToFloat(lerIni('indice','stop_tempo_INDFUT'));
    meta[idxAtivo(ativo)] := strToFloat(lerIni('indice','meta_INDFUT'));
    ref_percentual_livro[idxAtivo(ativo)] := strToFloat(lerIni('indice','ref_percentual_livro_INDFUT'));
    qtd_ciclos_estabilidade[idxAtivo(ativo)] := strToInt(lerIni('indice','qtd_ciclos_estabilidade_INDFUT'));
    tick_ciclos_estabilidade[idxAtivo(ativo)] := strToInt(lerIni('indice','tick_ciclos_estabilidade_INDFUT'));
    stop_loss_operacao[idxAtivo(ativo)] := strToFloat(lerIni('indice','stop_loss_operacao_INDFUT'));
    num_max_operacoes[idxAtivo(ativo)] := strToInt(lerIni('indice','num_max_operacoes_INDFUT'));
    qtd_ultimos_negocios[idxAtivo(ativo)] := strToInt(lerIni('indice','qtd_ultimos_negocios_INDFUT'));
    qtd_operacoes_ajuste_meta[idxAtivo(ativo)] := strToInt(lerIni('indice','qtd_operacoes_ajuste_meta_INDFUT'));
    percentual_ajuste_meta[idxAtivo(ativo)] := strToFloat(lerIni('indice','percentual_ajuste_meta_INDFUT'));
    stop_loss_mant_operacao[idxAtivo(ativo)] := strToFloat(lerIni('indice','stop_loss_mant_operacao_INDFUT'));
    qtd_ref_livro[idxAtivo(ativo)]  := strToInt(lerIni('indice','qtd_ref_livro_INDFUT'));
    considerar_qtd_menor[idxAtivo(ativo)] := strToInt(lerIni('indice','considerar_qtd_menor_INDFUT'));
    inversao_loss[idxAtivo(ativo)] := strToInt(lerIni('indice','inversao_loss_INDFUT'));
    meta_inicial_stop_gain[idxAtivo(ativo)] := strToInt(lerIni('indice','meta_inicial_stop_gain_INDFUT'));
    considera_oscilacao[idxAtivo(ativo)] := strToInt(lerIni('indice','considera_oscilacao_INDFUT'));
    qtd_negocios_oscilacao[idxAtivo(ativo)] := strToInt(lerIni('indice','qtd_negocios_oscilacao_INDFUT'));
    min_pontos_oscilacao[idxAtivo(ativo)] := strToInt(lerIni('indice','min_pontos_oscilacao_INDFUT'));
    max_pontos_oscilacao[idxAtivo(ativo)] := strToInt(lerIni('indice','max_pontos_oscilacao_INDFUT'));
    agressivo[idxAtivo(ativo)] := strToInt(lerIni('indice','agressivo_INDFUT'));


    memoLogIndice.Lines.clear;

    recmetaAtingidaIndice.Fill.Color := claLightgray;
    lblmetaAtingidaIndice.Text := '';
    lblDataHoraOrdemIndice.text:=  '  Última operação Índice:';
    lblSituacaoIndice.Text := '';
    recSituacaoIndice.Fill.Color := claLightgray;

    last_y[idxAtivo(ativo)] := Trunc(imgGrafIndice.Height/2);

    criarImagensGraf(ativo);
    scrollGrafIndice.ScrollBy(10000,-10000);
    scrollGrafIndice.ScrollBy(0,3800);
  end;

  gravarCodigosAtivos;

  MomentoEstavel(ativo);
end;

procedure TfrmPrincipal.zerar_posicao(ativo: string; data_hora: TDateTime);
begin
  if posicao[idxAtivo(ativo)] <> 0 then
  begin
    if posicao[idxAtivo(ativo)] = 1 then
      vender(ativo, data_hora)
    else
      comprar(ativo, data_hora);
  end;
end;

procedure TfrmPrincipal.btnIniciar1DolarClick(Sender: TObject);
var
  ativo : string;
begin
   ativo := DOLFUT;
   setupBotaoes(ativo);
   timerInicioDolar.Enabled := True;
   registrar_log(ativo, 'Início das operações às 09:00' );
end;

procedure TfrmPrincipal.btnIniciar1IndiceClick(Sender: TObject);
var
  ativo : string;
begin
   ativo := INDFUT;
   setupBotaoes(ativo);
   timerInicioIndice.Enabled := True;
   registrar_log(ativo, 'Início das operações às 09:00' );
end;

procedure TfrmPrincipal.btnIniciarDolarClick(Sender: TObject);
var
  ativo : string;
begin
  ativo := DOLFUT;
  setupBotaoes(ativo);
  TimerReplayDolar.Enabled := false;
  timerInicioDolar.Enabled := False;
  btnReplayDolar.Enabled := False;
  zerar(ativo);

  IniciarDDE;

  analisando[idxAtivo(ativo)] := true;

  TimerAnaliseDolar.Enabled := True;
  AniIndicatorDolar.Enabled := True;

  logParametros(ativo);
end;

procedure TfrmPrincipal.btnIniciarIndiceClick(Sender: TObject);
var
  ativo : string;
begin
  ativo := INDFUT;
  setupBotaoes(ativo);
  TimerReplayIndice.Enabled := false;
  timerInicioIndice.Enabled := False;
  btnReplayIndice.Enabled := False;
  zerar(ativo);

  if not Assigned(ddeCliTrydNegocio) then
  begin
   ddeCliTrydNegocio := TDdeClientConv.Create(self);
   ddeCliTrydNegocio.SetLink('Stech','NEGS');
   ddeCliTrydNegocio.OpenLink;
  end;

  if not Assigned(ddeCliTrydCotacao) then
  begin
   ddeCliTrydCotacao := TDdeClientConv.Create(self);
   ddeCliTrydCotacao.SetLink('Stech','COT');
   ddeCliTrydCotacao.OpenLink;
  end;

  if not Assigned(ddeCliTrydLivro) then
  begin
   ddeCliTrydLivro := TDdeClientConv.Create(self);
   ddeCliTrydLivro.SetLink('Stech','LVL2');
   ddeCliTrydLivro.OpenLink;
  end;

  analisando[idxAtivo(ativo)] := true;

  TimerAnaliseIndice.Enabled := True;
  AniIndicatorIndice.Enabled := True;

  logParametros(ativo);
end;

procedure TfrmPrincipal.btnLimparDolarClick(Sender: TObject);
begin
  zerar(DOLFUT);
end;

procedure TfrmPrincipal.btnLoginClick(Sender: TObject);
var
 s: string;
 frame: ICefFrame;
begin
  if Assigned(FMXChromium.Browser) then
  begin
    frame :=  FMXChromium.Browser.GetFrame('');
    if Assigned(frame) then
    begin
      s := 'document.querySelector('#39'#identificationNumber'#39').value = '#39''+lerini('login','usuario')+''#39'';
      frame.ExecuteJavaScript(s, frame.Url, 0);

      s := 'document.querySelector('#39'#password'#39').value = '#39''+lerini('login','senha')+''#39'';;
      frame.ExecuteJavaScript(s, frame.Url, 0);

      s := 'document.querySelector('#39'#dob'#39').value = '#39''+lerini('login','nascimento')+''#39'';;
      frame.ExecuteJavaScript(s, frame.Url, 0);

      s := 'document.querySelector('#39'#accountForm > div.cont_form > div:nth-child(6) > button'#39').click()';
      frame.ExecuteJavaScript(s, frame.Url, 0);
    end;
  end;
end;


procedure TfrmPrincipal.btnPararDolarClick(Sender: TObject);
begin
  setupBotaoes(DOLFUT);
  if (timerInicioDolar.Enabled) then
     zerar(DOLFUT);
  AniIndicatorDolar.Enabled := False;
  timerAnaliseDolar.Enabled := False;
  TimerReplayDolar.Enabled := False;
  timerInicioDolar.Enabled := False;
  TimerSomenteCapturaDolar.Enabled := False;
end;

procedure TfrmPrincipal.btnPararIndiceClick(Sender: TObject);
begin
  setupBotaoes(INDFUT);
  if (timerInicioIndice.Enabled) then
     zerar(INDFUT);
  btnReplayIndice.Enabled := True;
  AniIndicatorIndice.Enabled := False;
  timerAnaliseIndice.Enabled := False;
  TimerReplayIndice.Enabled := False;
  timerInicioIndice.Enabled := False;
end;

procedure TfrmPrincipal.btnAssinaturaClick(Sender: TObject);
var
 s: string;
 frame: ICefFrame;
begin
  if Assigned(FMXChromium.Browser) then
  begin
    frame :=  FMXChromium.Browser.GetFrame('content-page');
    if Assigned(frame) then
    begin
      s := 'document.getElementsByClassName('#39'checkbox bt-toggle-signature'#39')[0].click();';
      frame.ExecuteJavaScript(s, frame.Url, 0);

      s := 'document.getElementsByClassName('#39'relocate-signature-input'#39')[0].value = '#39''+lerini('assinatura','assinatura')+''#39'';
      frame.ExecuteJavaScript(s, frame.Url, 0);

      s := 'document.getElementsByClassName('#39'bt-docket save-signature xsmall'#39')[0].click();';
      frame.ExecuteJavaScript(s, frame.Url, 0);
    end;
  end;
end;

procedure TfrmPrincipal.btnAtualizarResultadosClick(Sender: TObject);
var
  data_ref : TDateTime;
  resultado : Double;
begin
   data_ref := StrTODate('01/' + inttostr(cmbMes.ItemIndex+1) + '/' + inttostr(trunc(spinAno.value)));
   DmPrincipal.sqlResultados.Close;
   DmPrincipal.sqlResultados.ParamByName('ativo').AsString := DOLFUT;
   DmPrincipal.sqlResultados.ParamByName('data_ini').AsDateTime := data_ref;
   DmPrincipal.sqlResultados.ParamByName('data_fim').AsDateTime := EndOfTheMonth(data_ref);
   DmPrincipal.sqlResultados.Open;

   SerieDolar.Clear;
   SerieDolarPositivo.Clear;
   SerieDolarNegativo.Clear;
   resultado := 0;

   while not DmPrincipal.sqlResultados.Eof do
   begin
     resultado := resultado + DmPrincipal.sqlResultados.FieldByName('resultado').AsFloat;
     SerieDolar.AddXY(DmPrincipal.sqlResultados.RecNo, resultado, FormatDateTime('dd', DmPrincipal.sqlResultados.FieldByName('data').AsDatetime));
     if DmPrincipal.sqlResultados.FieldByName('resultado').AsFloat >= 0 then
       SerieDolarPositivo.AddXY(DmPrincipal.sqlResultados.RecNo, DmPrincipal.sqlResultados.FieldByName('resultado').AsFloat)
     else
       SerieDolarNegativo.AddXY(DmPrincipal.sqlResultados.RecNo, DmPrincipal.sqlResultados.FieldByName('resultado').AsFloat);
     DmPrincipal.sqlResultados.next;
   end;

   DmPrincipal.sqlResultados.Close;
   DmPrincipal.sqlResultados.ParamByName('ativo').AsString := INDFUT;
   DmPrincipal.sqlResultados.ParamByName('data_ini').AsDateTime := data_ref;
   DmPrincipal.sqlResultados.ParamByName('data_fim').AsDateTime := EndOfTheMonth(data_ref);
   DmPrincipal.sqlResultados.Open;

   SerieIndice.Clear;
   SerieIndicePositivo.Clear;
   SerieIndiceNegativo.Clear;
   resultado := 0;
   while not DmPrincipal.sqlResultados.Eof do
   begin
     resultado := resultado + DmPrincipal.sqlResultados.FieldByName('resultado').AsFloat;
     SerieIndice.AddXY(DmPrincipal.sqlResultados.RecNo, resultado, FormatDateTime('dd', DmPrincipal.sqlResultados.FieldByName('data').AsDatetime));
     if DmPrincipal.sqlResultados.FieldByName('resultado').AsFloat >= 0 then
       SerieIndicePositivo.AddXY(DmPrincipal.sqlResultados.RecNo, DmPrincipal.sqlResultados.FieldByName('resultado').AsFloat)
     else
       SerieIndiceNegativo.AddXY(DmPrincipal.sqlResultados.RecNo, DmPrincipal.sqlResultados.FieldByName('resultado').AsFloat);
     DmPrincipal.sqlResultados.next;
   end;
end;

procedure TfrmPrincipal.aplicarQtdNoPit(ativo : string);
var
 s, qtd: string;
 frame: ICefFrame;
begin
  if Assigned(FMXChromium.Browser) then
  begin
    frame :=  FMXChromium.Browser.GetFrame('content-page');
    if Assigned(frame) then
    begin
      if ativo = DOLFUT then
        qtd := IntToStr(Trunc(spinQtdDolar.Value))
      else
        qtd := IntToStr(Trunc(spinQtdIndice.Value));

      s := 'document.getElementsByClassName('#39'input-quantity ui-spinner-input'#39')[6].value = ' + qtd;
      frame.ExecuteJavaScript(s, frame.Url, 0);
    end;
  end;
end;


procedure TfrmPrincipal.btnMetaDolarClick(Sender: TObject);
begin
   ajusteManualMeta(DOLFUT);
end;

procedure TfrmPrincipal.btnMetaIndiceClick(Sender: TObject);
begin
   ajusteManualMeta(INDFUT);
end;

procedure TfrmPrincipal.ajusteManualMeta(ativo : string);
begin
    TDialogServiceAsync.InputQuery('Ajuste manual de Meta - ' + FloattoStr(meta[idxAtivo(ativo)]), ['Informe a meta:'], [''],
  procedure(const AResult: TModalResult; const AValues: array of string)
  begin
    if Aresult = mrOk then
    begin
       meta[idxAtivo(ativo)] := strtofloat(AValues[0]);
       registrar_log(ativo, '');
       registrar_log(ativo, 'Meta ajustada manualmente para ' + AValues[0]);
       registrar_log(ativo, '');
       if meta[idxAtivo(ativo)] <= pontos_acumulados[idxAtivo(ativo)] then
          metaAtingida(ativo, now);
    end;
  end);
end;

procedure TfrmPrincipal.btnCapturarDolarClick(Sender: TObject);
var
  ativo : string;
begin
  ativo := DOLFUT;
  registrar_log(ativo, 'Capturando...');

  IniciarDDE;

  with DmPrincipal do
  begin
    sqlLimpaTimesTrades.ParamByName('ativo').AsString := ativo;
    sqlLimpaTimesTrades.ParamByName('data').AsDatetime := dtDolar.Date;
    sqlLimpaTimesTrades.Execute;

    sqlLimpaLivro.ParamByName('ativo').AsString := ativo;
    sqlLimpaLivro.ParamByName('data').AsDatetime := dtDolar.Date;
    sqlLimpaLivro.Execute;
  end;
  TimerSomenteCapturaDolar.Enabled := True;
  AniIndicatorDolar.Enabled := True;
  setupBotaoes(ativo);
end;

procedure TfrmPrincipal.btnCapturarIndiceClick(Sender: TObject);
var
  ativo : string;
begin
  ativo := INDFUT;
  registrar_log(ativo, 'Capturando...');

  IniciarDDE;

  with DmPrincipal do
  begin
    sqlLimpaTimesTrades.ParamByName('ativo').AsString := ativo;
    sqlLimpaTimesTrades.ParamByName('data').AsDatetime := dtIndice.Date;
    sqlLimpaTimesTrades.Execute;

    sqlLimpaLivro.ParamByName('ativo').AsString := ativo;
    sqlLimpaLivro.ParamByName('data').AsDatetime := dtIndice.Date;
    sqlLimpaLivro.Execute;
  end;
  TimerSomenteCapturaIndice.Enabled := True;
  AniIndicatorIndice.Enabled := True;
  setupBotaoes(ativo);
end;

procedure TfrmPrincipal.btnCarregarPitClick(Sender: TObject);
var
  TempHandle : HWND;
  TempRect   : System.Types.TRect;
  TempClientRect : TRectF;
begin
  if Assigned(FMXWindowParent) then
    FreeAndNil(FMXWindowParent);

  FMXWindowParent := TFMXWindowParent.CreateNew(nil);
  FMXWindowParent.Reparent(handle);
  FMXWindowParent.Show;
  ResizeChild;

  TempHandle      := FmxHandleToHWND(FMXWindowParent.Handle);
  TempClientRect  := FMXWindowParent.ClientRect;
  TempRect.Left   := round(TempClientRect.Left);
  TempRect.Top    := round(TempClientRect.Top);
  TempRect.Right  := round(TempClientRect.Right);
  TempRect.Bottom := round(TempClientRect.Bottom);

  FMXChromium.DefaultUrl := 'https://login.clear.com.br/pit/login/';
  FMXChromium.CreateBrowser(TempHandle, TempRect);

end;

procedure TfrmPrincipal.btnReplayDolarClick(Sender: TObject);
var
  ativo : String;
begin
   Application.ProcessMessages;
   ativo := DOLFUT;
   setupBotaoes(ativo);
   timerInicioDolar.Enabled := False;
   TimerAnaliseDolar.Enabled := False;
   analisando[idxAtivo(ativo)] := false;
   zerar(ativo);
   DmPrincipal.sqlReplayDolar.Close;
   DmPrincipal.sqlReplayDolar.ParamByName('ATIVO').asString := ativo;
   DmPrincipal.sqlReplayDolar.ParamByName('DATA').asDateTime := dtDolar.Date;
   DmPrincipal.sqlReplayDolar.Open;
   TimerReplayDolar.Enabled := true;
   AniIndicatorDolar.Enabled := True;
   logParametros(ativo);
end;

procedure TfrmPrincipal.btnReplayIndiceClick(Sender: TObject);
var
  ativo : String;
begin
   Application.ProcessMessages;
   ativo := INDFUT;
   setupBotaoes(ativo);
   timerInicioIndice.Enabled := False;
   TimerAnaliseIndice.Enabled := False;
   analisando[idxAtivo(ativo)] := false;
   zerar(ativo);
   DmPrincipal.sqlReplayIndice.Close;
   DmPrincipal.sqlReplayIndice.ParamByName('ATIVO').asString := ativo;
   DmPrincipal.sqlReplayIndice.ParamByName('DATA').asDateTime := dtIndice.Date;
   DmPrincipal.sqlReplayIndice.Open;
   TimerReplayIndice.Enabled := true;
   AniIndicatorindice.Enabled := true;
   logParametros(ativo);
end;


procedure TfrmPrincipal.btnZerarPosicaoDolarClick(Sender: TObject);
begin
   zerar_posicao(DOLFUT, now);
end;

procedure TfrmPrincipal.btnZerarPosicaoIndiceClick(Sender: TObject);
begin
   zerar_posicao(INDFUT, now);
end;

procedure TfrmPrincipal.btnLimparIndiceClick(Sender: TObject);
begin
  zerar(INDFUT);
end;

procedure TfrmPrincipal.MomentoEstavel(ativo : string);
begin
   if ativo = DOLFUT then
   begin
     recMomentoOrdemDolar.Fill.Color := claLightgray;
     lblMomentoOrdemDolar.Text := '';
   end
   else
   begin
     recMomentoOrdemIndice.Fill.Color := claLightgray;
     lblMomentoOrdemIndice.Text := '';
   end;
end;

procedure TfrmPrincipal.MomentoOrdem(ativo, Operacao : String; Pontos : Double);
begin
     if ativo = DOLFUT then
     begin
       if Pontos = 0 then
         recMomentoOrdemDolar.Fill.Color := claLightgray
       else if Pontos  > 0 then
         recMomentoOrdemDolar.Fill.Color := claGreen
         else
           recMomentoOrdemDolar.Fill.Color := claRed;
       lblMomentoOrdemDolar.Text := Operacao + ': ' + floattostrF(Pontos, ffNumber, 15,DIGITOS[idxAtivo(Ativo)]);
       registrar_log(ativo, lblMomentoOrdemDolar.Text);
     end
     else
     begin
       if Pontos = 0 then
         recMomentoOrdemIndice.Fill.Color := claLightgray
       else if Pontos  > 0 then
         recMomentoOrdemIndice.Fill.Color := claGreen
         else
           recMomentoOrdemIndice.Fill.Color := claRed;
       lblMomentoOrdemIndice.Text := Operacao + ': ' + floattostrF(Pontos, ffNumber, 15,DIGITOS[idxAtivo(Ativo)]);
       registrar_log(ativo, lblMomentoOrdemIndice.Text);
     end;

end;

procedure TfrmPrincipal.registrar_log(ativo, texto: string);
var
  texto_id : string;
begin
   if not ((texto = '') and (ultimo_log[idxAtivo(ativo)] = '')) then
   begin
     texto_id := inttostr(ultimo_id[idxAtivo(ativo)]) + ' | ' + texto;
     if ativo = DOLFUT then
        memoLogDolar.Lines.Add(texto_id)
     else
        memoLogIndice.Lines.Add(texto_id);
     with DMPrincipal do
     begin
       if analisando[idxAtivo(ativo)] then
       begin
          sqlInsereLog.ParamByName('ativo').AsString := ativo;
          if ultimo_id[idxAtivo(ativo)] > 0 then
            sqlInsereLog.ParamByName('data_hora').AsDateTime := dt_hora_ultimo_inserido[idxAtivo(ativo)]
          else
            sqlInsereLog.ParamByName('data_hora').AsDateTime := now;
          sqlInsereLog.ParamByName('texto').AsString := texto_id;
          sqlInsereLog.Execute;
       end;
     end;
   end;
   if ativo = DOLFUT then
      memoLogDolar.GoToTextEnd
   else
      memoLogIndice.GoToTextEnd;
   ultimo_log[idxAtivo(ativo)] := texto;
end;

procedure TfrmPrincipal.registrar_resultado(ativo : string; data: TdateTime; op_positivas, op_negativas : integer; resultado : double);
begin
 with DMPrincipal do
 begin
    sqlLimpaResultado.ParamByName('ativo').AsString := ativo;
    sqlLimpaResultado.ParamByName('data').AsDateTime := trunc(data);
    sqlLimpaResultado.Execute;

    sqlInsereResultado.ParamByName('ativo').AsString := ativo;
    sqlInsereResultado.ParamByName('op_positivas').asInteger := op_positivas;
    sqlInsereResultado.ParamByName('op_negativas').asInteger := op_negativas;
    sqlInsereResultado.ParamByName('resultado').asFloat := resultado;
    sqlInsereResultado.ParamByName('data').AsDateTime := trunc(data);
    sqlInsereResultado.Execute;
 end;
end;

procedure TfrmPrincipal.CapturarDados(ativo: string);
var
  ultimo_preco, var_per : double;
  dt_ultimo_negocio : TDateTime;
  cod_corretora_compra, cod_corretora_venda, agressor : string;
  qtd_ultimo_negocio : integer;
  preco_venda_livro, preco_compra_livro: Array[0..9] of double;
  qtd_compra_livro, qtd_venda_livro:  Array[0..9] of integer;
  i, id_tt, j, tj : integer;
  lst_qtd_ultimo_negocio, lst_ultimo_preco, lst_dt_ultimo_negocio : TStringDynArray;
begin
   inseriu[idxAtivo(ativo)] := false;
   try
     with DMPrincipal do
     begin
         lst_dt_ultimo_negocio  := SplitString(string(ddeCliTrydNegocio.RequestData(ativo+'.Hora')),'@');
         lst_qtd_ultimo_negocio := SplitString(string(ddeCliTrydNegocio.RequestData(ativo+'.Qtd')),'@');
         lst_ultimo_preco       := SplitString(string(ddeCliTrydNegocio.RequestData(ativo+'.Prc')),'@');

         if Assigned(lst_dt_ultimo_negocio) and (length(lst_dt_ultimo_negocio) > 0) then
         begin
           if ativo = DOLFUT then
             dt_ultimo_negocio     := StrtoDateTime(formatDateTime('dd/mm/yyyy ', dtDolar.Date) + lst_dt_ultimo_negocio[0])
           else
             dt_ultimo_negocio     := StrtoDateTime(formatDateTime('dd/mm/yyyy ', dtIndice.Date) + lst_dt_ultimo_negocio[0]);
         end
         else
         begin
           if ativo = DOLFUT then
             dt_ultimo_negocio     := StrtoDateTime(formatDateTime('dd/mm/yyyy ', dtDolar.Date))
           else
             dt_ultimo_negocio     := StrtoDateTime(formatDateTime('dd/mm/yyyy ', dtIndice.Date));
         end;

         qtd_ultimo_negocio := 0;
         ultimo_preco := 0;

         if Assigned(lst_ultimo_preco) and (length(lst_ultimo_preco) > 0) then
         begin

           if Length(lst_qtd_ultimo_negocio) <= Length(lst_ultimo_preco) then
              tj := Length(lst_qtd_ultimo_negocio) - 1
           else
              tj := Length(lst_ultimo_preco) - 1;

           for j := 0 to tj do
           begin
             qtd_ultimo_negocio  := qtd_ultimo_negocio + StrtoIntDef(lst_qtd_ultimo_negocio[j],0);
             lst_ultimo_preco[j] := stringReplace(lst_ultimo_preco[j], '.','',[rfReplaceAll]);
             ultimo_preco        := ultimo_preco + StrtoIntDef(lst_qtd_ultimo_negocio[j],0) * strtofloatdef(lst_ultimo_preco[j],0);
           end;
           ultimo_preco := ultimo_preco/qtd_ultimo_negocio;
         end;

         var_per               := strtofloatdef(string(ddeCliTrydCotacao.RequestData(ativo+'.VarPer')),0);
         agressor              := '-';

         for i := 0 to 9 do
         begin
           qtd_compra_livro[i]      :=   StrToIntDef(string(ddeCliTrydLivro.RequestData(ativo+'.1.' + inttostr(i) + '.1')),0);
           preco_compra_livro[i]    := StrtoFloatDef(string(ddeCliTrydLivro.RequestData(ativo+'.1.' + inttostr(i) + '.2')),0);

           qtd_venda_livro[i]       :=   StrToIntDef(string(ddeCliTrydLivro.RequestData(ativo+'.1.' + inttostr(i) + '.4')),0);
           preco_venda_livro[i]     := StrtoFloatDef(string(ddeCliTrydLivro.RequestData(ativo+'.1.' + inttostr(i) + '.3')),0);
         end;


         //Times & Trades
         try
           sqlVerificaTimesTrades.Close;
           sqlVerificaTimesTrades.ParamByName('ativo').AsString := ativo;
           sqlVerificaTimesTrades.ParamByName('data_hora').AsDateTime := dt_ultimo_negocio;
           sqlVerificaTimesTrades.Open;
           if (sqlVerificaTimesTrades.IsEmpty) and
              (ultimo_preco <> 0) and
              (qtd_ultimo_negocio <> 0) and
              (HourOf(dt_ultimo_negocio) > 0) then
           begin
             inseriu[idxAtivo(ativo)] := true;
             num_capturados[idxAtivo(ativo)] := num_capturados[idxAtivo(ativo)] + 1;
             qtd_negocios_ultimo_mov[idxAtivo(ativo)] := qtd_negocios_ultimo_mov[idxAtivo(ativo)] + 1;
             dt_hora_ultimo_inserido[idxAtivo(ativo)] :=  dt_ultimo_negocio;
             sqlInsereTimesTrades.ParamByName('ativo').AsString := ativo;
             sqlInsereTimesTrades.ParamByName('data_hora').AsDateTime := dt_ultimo_negocio;
             sqlInsereTimesTrades.ParamByName('corretora_compra').asString := cod_corretora_compra;
             sqlInsereTimesTrades.ParamByName('corretora_venda').asString := cod_corretora_venda;
             if agressor = 'Comprador' then
               agressor := 'C'
             else
               if agressor = 'Vendedor' then
                 agressor := 'V'
               else
                agressor := 'D';
             sqlInsereTimesTrades.ParamByName('agressor').asString:= agressor;
             sqlInsereTimesTrades.ParamByName('qtd').AsInteger := qtd_ultimo_negocio;
             sqlInsereTimesTrades.ParamByName('preco').AsFloat := ultimo_preco;
             sqlInsereTimesTrades.ParamByName('variacao_abertura').AsFloat := var_per;
             sqlInsereTimesTrades.Execute;

             sqlUltimoID.Close;
             sqlUltimoID.ParamByName('ativo').AsString := ativo;
             sqlUltimoID.Open;
             id_tt := sqlUltimoID.FieldByName('id').AsInteger;
             sqlUltimoID.Close;

             //Livro de Ofertas
             for i := 0 to 9 do
             begin
               sqlInsereLivroOfertas.ParamByName('ativo').AsString := ativo;
               sqlInsereLivroOfertas.ParamByName('data_hora').AsDateTime := dt_ultimo_negocio;
               sqlInsereLivroOfertas.ParamByName('qtd').AsInteger := qtd_compra_livro[i];
               sqlInsereLivroOfertas.ParamByName('preco').AsFloat := preco_compra_livro[i];
               sqlInsereLivroOfertas.ParamByName('corretora').AsInteger := 0;
               sqlInsereLivroOfertas.ParamByName('operacao').AsString := 'C';
               sqlInsereLivroOfertas.ParamByName('id_tt').AsInteger := id_tt;
               sqlInsereLivroOfertas.Execute;

               sqlInsereLivroOfertas.ParamByName('ativo').AsString := ativo;
               sqlInsereLivroOfertas.ParamByName('data_hora').AsDateTime := dt_ultimo_negocio;
               sqlInsereLivroOfertas.ParamByName('qtd').AsInteger := qtd_venda_livro[i];
               sqlInsereLivroOfertas.ParamByName('preco').AsFloat := preco_venda_livro[i];
               sqlInsereLivroOfertas.ParamByName('corretora').AsInteger := 0;
               sqlInsereLivroOfertas.ParamByName('operacao').AsString := 'V';
               sqlInsereLivroOfertas.ParamByName('id_tt').AsInteger := id_tt;
               sqlInsereLivroOfertas.Execute;
             end;

           end;
         finally
           sqlVerificaTimesTrades.Close;
         end;
     end;
    except
       registrar_log(ativo, 'Erro ao capturar.');
    end;
end;

procedure TfrmPrincipal.chkExecOrdensDolarChange(Sender: TObject);
begin
  registrar_log(DOLFUT, '');
  if chkExecOrdensDolar.IsChecked then
    registrar_log(DOLFUT, 'Executando ordens')
  else
    registrar_log(DOLFUT, 'Não executando ordens');
  registrar_log(DOLFUT, '');
end;

procedure TfrmPrincipal.chkExecOrdensIndiceChange(Sender: TObject);
begin
  registrar_log(INDFUT, '');
  if chkExecOrdensIndice.IsChecked then
    registrar_log(INDFUT, 'Executando ordens')
  else
    registrar_log(INDFUT, 'Não executando ordens');
  registrar_log(INDFUT, '');
end;

procedure TfrmPrincipal.lerCodigosAtivos;
begin
  edtCodigoDolar.Text :=  lerini('dolar','codigo_DOLFUT');
  edtCodigoIndice.Text := lerini('indice','codigo_INDFUT');
end;

procedure TfrmPrincipal.gravarCodigosAtivos;
begin
  gravarini('dolar','codigo_DOLFUT',edtCodigoDolar.Text);
  gravarini('indice','codigo_INDFUT',edtCodigoIndice.Text);
end;

procedure TfrmPrincipal.FMXChromiumAfterCreated(Sender: TObject;
  const browser: ICefBrowser);
begin
  PostCustomMessage(CEF_AFTERCREATED);
end;


procedure TfrmPrincipal.FMXChromiumLoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; httpStatusCode: Integer);
begin
  ResizeChild;
end;

function TfrmPrincipal.PostCustomMessage(aMessage, wParam : cardinal; lParam : integer) : boolean;
{$IFDEF MSWINDOWS}
var
  TempHWND : HWND;
{$ENDIF}
begin
  {$IFDEF MSWINDOWS}
  TempHWND := FmxHandleToHWND(Handle);
  Result   := (TempHWND <> 0) and WinApi.Windows.PostMessage(TempHWND, aMessage, wParam, lParam);
  {$ELSE}Result   := False;
  {$ENDIF}
end;


procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  gravarCodigosAtivos;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);

function GetAppVersionStr: string;
var
  Exe: string;
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  Exe := ParamStr(0);
  Size := GetFileVersionInfoSize(PChar(Exe), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(Exe), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi,  //major
     LongRec(FixedPtr.dwFileVersionMS).Lo,  //minor
     LongRec(FixedPtr.dwFileVersionLS).Hi,  //release
     LongRec(FixedPtr.dwFileVersionLS).Lo]) //build
end;
begin
  dtDolar.Date := Date;
  dtIndice.Date := Date;
  MomentoEstavel(DOLFUT);
  MomentoEstavel(INDFUT);
  FDConnection.Connected := true;
  DmPrincipal := TDMPrincipal.Create(Self);
  DmPrincipal.setConnection(FDConnection);
  TFMXApplicationService.AddPlatformService;
  FMXWindowParent := nil;
  lerCodigosAtivos;
  tbPaineis.ActiveTab := tabPitNegociacao;
  criarImagensGraf(DOLFUT);
  criarImagensGraf(INDFUT);
  tbPaineis.TabHeight := pnlMenuPit.Height;
  scrollGrafDolar.Height := pnlDolar.Height;
  cmbMes.ItemIndex := MonthOf(Date)-1;
  spinAno.Value := YearOf(Date);

  frmPrincipal.Caption := 'Rêmora - ' + GetAppVersionStr;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
  ResizeChild;
  pnlDolar.Height := Trunc((PnlRobo.Height - pnlMenuPit.Height)/2);
  scrollGrafDolar.Height := pnlDolar.Height;
  grafResultadosDolar.Height := pnlDolar.Height - trunc(pnlResultado.Height/2);
end;

function TfrmPrincipal.idxAtivo(ativo: string): integer;
begin
   if ativo = DOLFUT then
     result := 1
   else
     result := 2;
end;

procedure TfrmPrincipal.imgDolarClick(Sender: TObject);
begin
   SelecionarAtivoNoPit(DOLFUT);
end;

procedure TfrmPrincipal.imgIndiceClick(Sender: TObject);
begin
   SelecionarAtivoNoPit(INDFUT);
end;

procedure TfrmPrincipal.ResizeChild;
begin
  if (FMXWindowParent <> nil) then
    FMXWindowParent.SetBounds(round(PnlRobo.width), round(PnlRobo.Height - pnlPitNegociacao.Height) + 1,
                              round(ClientWidth - (PnlRobo.Width+1)), ClientHeight - (round(PnlRobo.Height - pnlPitNegociacao.Height + StatusBarOp.Height+1)));
end;


procedure TfrmPrincipal.TimerAnaliseDolarTimer(Sender: TObject);
var
  ativo : string;
begin
  ativo := DOLFUT;
  try
    try
    TimerAnaliseDolar.Enabled := false;
    CapturarDados(ativo);

    if inseriu[idxAtivo(ativo)] then
       Analisar(ativo, dt_hora_ultimo_inserido[idxAtivo(ativo)]);

    if data_hora_inicio[idxAtivo(ativo)] = 0 then
      data_hora_inicio[idxAtivo(ativo)] := dt_hora_ultimo_inserido[idxAtivo(ativo)];

    except
       registrar_log(ativo, 'Erro ao analisar.');
    end;
  finally
    if ((data_hora_inicio[idxAtivo(ativo)]<>0) and (MinutesBetween(data_hora_inicio[idxAtivo(ativo)],dt_hora_ultimo_inserido[idxAtivo(ativo)]) > 480 )) or
       (pontos_acumulados[idxAtivo(ativo)] <= stop_loss_operacao[idxAtivo(ativo)]) or
       (num_max_operacoes[idxAtivo(ativo)] = cont_operacoes[idxAtivo(ativo)]) then
    begin
      zerar_posicao(ativo, dt_hora_ultimo_inserido[idxAtivo(ativo)]);
      if not meta_atingida[idxAtivo(ativo)] then
      begin
        registrar_log(ativo, '');
        registrar_log(ativo, 'Negociação ENCERRADA!');
        lblmetaAtingidaDolar.Text := 'Negociação encerrada.';
        btnPararDolarClick(self);
        chkOperarPitDolar.IsChecked := false;
        AniIndicatorDolar.Enabled := false;
        if (pontos_acumulados[idxAtivo(ativo)] <= stop_loss_operacao[idxAtivo(ativo)]) then
           registrar_log(ativo, 'Stop Loss Operação.')
        else if (num_max_operacoes[idxAtivo(ativo)] = cont_operacoes[idxAtivo(ativo)]) then
           registrar_log(ativo, 'Máximo de ' + IntToStr(cont_operacoes[idxAtivo(ativo)]) + ' operações.')
        else
           registrar_log(ativo, '8 horas de operação.');
        btnReplayDolar.Enabled := true;
        registrar_log(ativo,'Oper.(+): ' + inttostr(cont_operacoes_positivas[idxAtivo(ativo)]) + '     Oper.(-): ' + inttostr(cont_operacoes_negativas[idxAtivo(ativo)]));

        registrar_resultado(ativo,data_hora_inicio[idxAtivo(ativo)], cont_operacoes_positivas[idxAtivo(ativo)],cont_operacoes_negativas[idxAtivo(ativo)], pontos_acumulados[idxAtivo(ativo)]);

        if analisando[idxAtivo(ativo)] then
        begin
          registrar_log(ativo, '');
          registrar_log(ativo, 'Somente capturando...');
          registrar_log(ativo, '');
          TimerSomenteCapturaDolar.Enabled := True;
          AniIndicatorDolar.Enabled := True;
          setupBotaoes(ativo);
        end;
      end;
    end
    else
       TimerAnaliseDolar.Enabled := not meta_atingida[idxAtivo(ativo)];

  end;
end;

procedure TfrmPrincipal.TimerAnaliseIndiceTimer(Sender: TObject);
var
  ativo : string;
begin
  ativo := INDFUT;
  try
    try
    TimerAnaliseindice.Enabled := false;
    CapturarDados(ativo);

    if inseriu[idxAtivo(ativo)] then
       Analisar(ativo, dt_hora_ultimo_inserido[idxAtivo(ativo)]);

    if data_hora_inicio[idxAtivo(ativo)] = 0 then
      data_hora_inicio[idxAtivo(ativo)] := dt_hora_ultimo_inserido[idxAtivo(ativo)];

    except
       registrar_log(ativo, 'Erro ao analisar.');
    end;
  finally
    if ((data_hora_inicio[idxAtivo(ativo)]<>0) and (MinutesBetween(data_hora_inicio[idxAtivo(ativo)],dt_hora_ultimo_inserido[idxAtivo(ativo)]) > 480 )) or
       (pontos_acumulados[idxAtivo(ativo)] <= stop_loss_operacao[idxAtivo(ativo)])  or
       (num_max_operacoes[idxAtivo(ativo)] = cont_operacoes[idxAtivo(ativo)]) then
    begin
      registrar_log(ativo, DateTimeToStr(data_hora_inicio[idxAtivo(ativo)]));
      zerar_posicao(ativo, dt_hora_ultimo_inserido[idxAtivo(ativo)]);
      if not meta_atingida[idxAtivo(ativo)] then
      begin
        registrar_log(ativo, '');
        registrar_log(ativo, 'Negociação ENCERRADA!');
        lblmetaAtingidaindice.Text := 'Negociação encerrada.';
        btnPararIndiceClick(self);
        chkOperarPitindice.IsChecked := false;
        AniIndicatorindice.Enabled := false;
        if (pontos_acumulados[idxAtivo(ativo)] <= stop_loss_operacao[idxAtivo(ativo)]) then
           registrar_log(ativo, 'Stop Loss Operação.')
        else  if (num_max_operacoes[idxAtivo(ativo)] = cont_operacoes[idxAtivo(ativo)]) then
           registrar_log(ativo, 'Máximo de ' + IntToStr(cont_operacoes[idxAtivo(ativo)]) + ' operações.')
        else
           registrar_log(ativo, '8 horas de operação.');
        btnReplayIndice.Enabled := true;
        registrar_log(ativo,'Oper.(+): ' + inttostr(cont_operacoes_positivas[idxAtivo(ativo)]) + '     Oper.(-): ' + inttostr(cont_operacoes_negativas[idxAtivo(ativo)]));

        registrar_resultado(ativo,data_hora_inicio[idxAtivo(ativo)],cont_operacoes_positivas[idxAtivo(ativo)], cont_operacoes_negativas[idxAtivo(ativo)], pontos_acumulados[idxAtivo(ativo)]);

        if analisando[idxAtivo(ativo)] then
        begin
          registrar_log(ativo, '');
          registrar_log(ativo, 'Somente capturando...');
          registrar_log(ativo, '');
          TimerSomenteCapturaIndice.Enabled := True;
          AniIndicatorIndice.Enabled := True;
          setupBotaoes(ativo);
        end;
      end;
    end
    else
      TimerAnaliseindice.Enabled := not meta_atingida[idxAtivo(ativo)];

  end;
end;

procedure TfrmPrincipal.TimerReplayDolarTimer(Sender: TObject);
var
  ativo : string;
begin
   ativo := DOLFUT;

   if data_hora_inicio[idxAtivo(ativo)] = 0 then
      data_hora_inicio[idxAtivo(ativo)] := DmPrincipal.sqlReplayDolar.FieldByName('data_hora').AsDateTime;

   TimerReplayDolar.Enabled := False;
   num_capturados[idxAtivo(ativo)] := num_capturados[idxAtivo(ativo)] + 1;
   qtd_negocios_ultimo_mov[idxAtivo(ativo)] := qtd_negocios_ultimo_mov[idxAtivo(ativo)] + 1;
   Analisar(ativo, DmPrincipal.sqlReplayDolar.FieldByName('data_hora').AsDateTime);
   DmPrincipal.sqlReplayDolar.Next;

   if ((data_hora_inicio[idxAtivo(ativo)]<>0) and (MinutesBetween(data_hora_inicio[idxAtivo(ativo)],DmPrincipal.sqlReplayDolar.FieldByName('data_hora').AsDateTime) > 480 )) or
      (pontos_acumulados[idxAtivo(ativo)] <= stop_loss_operacao[idxAtivo(ativo)])  or
       (num_max_operacoes[idxAtivo(ativo)] = cont_operacoes[idxAtivo(ativo)]) then
   begin
     zerar_posicao(ativo, dt_hora_ultimo_inserido[idxAtivo(ativo)]);
     if not meta_atingida[idxAtivo(ativo)] then
     begin
       registrar_log(ativo, '');
       registrar_log(ativo, 'Negociação ENCERRADA!');
       lblmetaAtingidaDolar.Text := 'Negociação encerrada.';
       if ativo = DOLFUT then
          btnPararDolarClick(self)
        else
          btnPararIndiceClick(self);
       if (pontos_acumulados[idxAtivo(ativo)] <= stop_loss_operacao[idxAtivo(ativo)]) then
          registrar_log(ativo, 'Stop Loss Operação.')
       else if (num_max_operacoes[idxAtivo(ativo)] = cont_operacoes[idxAtivo(ativo)]) then
           registrar_log(ativo, 'Máximo de ' + IntToStr(cont_operacoes[idxAtivo(ativo)]) + ' operações.')
        else
          registrar_log(ativo, '8 horas de operação.');
       registrar_log(ativo,'Oper.(+): ' + inttostr(cont_operacoes_positivas[idxAtivo(ativo)]) + '     Oper.(-): ' + inttostr(cont_operacoes_negativas[idxAtivo(ativo)]));

       TDialogServiceAsync.MessageDialog( 'Gravar resultado?', TMsgDlgType.mtConfirmation,
                                   [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0,
             procedure(const AResult: TModalResult)
             begin
               case AResult of
                 mrYES : registrar_resultado(ativo,data_hora_inicio[idxAtivo(ativo)],
                                             cont_operacoes_positivas[idxAtivo(ativo)],
                                             cont_operacoes_negativas[idxAtivo(ativo)],
                                             pontos_acumulados[idxAtivo(ativo)]);
               end;
             end);

       AniIndicatorDolar.Enabled := false;
       btnReplayDolar.Enabled := true;
     end;
    end
    else
      TimerReplayDolar.Enabled := (not DmPrincipal.sqlReplayDolar.Eof) and (not meta_atingida[idxAtivo(ativo)]);
end;

procedure TfrmPrincipal.timerReplayIndiceTimer(Sender: TObject);
var
  ativo : string;
begin
   ativo := INDFUT;

   if data_hora_inicio[idxAtivo(ativo)] = 0 then
      data_hora_inicio[idxAtivo(ativo)] := DmPrincipal.sqlReplayindice.FieldByName('data_hora').AsDateTime;

   TimerReplayindice.Enabled := False;
   num_capturados[idxAtivo(ativo)] := num_capturados[idxAtivo(ativo)] + 1;
   qtd_negocios_ultimo_mov[idxAtivo(ativo)] := qtd_negocios_ultimo_mov[idxAtivo(ativo)] + 1;
   Analisar(ativo, DmPrincipal.sqlReplayindice.FieldByName('data_hora').AsDateTime);
   DmPrincipal.sqlReplayindice.Next;

   if ((data_hora_inicio[idxAtivo(ativo)]<>0) and (MinutesBetween(data_hora_inicio[idxAtivo(ativo)],DmPrincipal.sqlReplayindice.FieldByName('data_hora').AsDateTime) > 480 )) or
      (pontos_acumulados[idxAtivo(ativo)] <= stop_loss_operacao[idxAtivo(ativo)])  or
       (num_max_operacoes[idxAtivo(ativo)] = cont_operacoes[idxAtivo(ativo)]) then
   begin
     zerar_posicao(ativo, dt_hora_ultimo_inserido[idxAtivo(ativo)]);
     if not meta_atingida[idxAtivo(ativo)] then
     begin
       registrar_log(ativo, '');
       registrar_log(ativo, 'Negociação ENCERRADA!');
       lblmetaAtingidaindice.Text := 'Negociação encerrada.';
       if ativo = DOLFUT then
         btnPararDolarClick(self)
       else
         btnPararIndiceClick(self);
       if (pontos_acumulados[idxAtivo(ativo)] <= stop_loss_operacao[idxAtivo(ativo)]) then
          registrar_log(ativo, 'Stop Loss Operação.')
       else if (num_max_operacoes[idxAtivo(ativo)] = cont_operacoes[idxAtivo(ativo)]) then
           registrar_log(ativo, 'Máximo de ' + IntToStr(cont_operacoes[idxAtivo(ativo)]) + ' operações.')
        else
          registrar_log(ativo, '8 horas de operação.');
       registrar_log(ativo,'Oper.(+): ' + inttostr(cont_operacoes_positivas[idxAtivo(ativo)]) + '     Oper.(-): ' + inttostr(cont_operacoes_negativas[idxAtivo(ativo)]));

       TDialogServiceAsync.MessageDialog( 'Gravar resultado?', TMsgDlgType.mtConfirmation,
                                           [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0,
             procedure(const AResult: TModalResult)
             begin
               case AResult of
                 mrYES : registrar_resultado(ativo,data_hora_inicio[idxAtivo(ativo)],
                                             cont_operacoes_positivas[idxAtivo(ativo)],
                                             cont_operacoes_negativas[idxAtivo(ativo)],
                                             pontos_acumulados[idxAtivo(ativo)]);
               end;
             end);

       AniIndicatorindice.Enabled := false;
       btnReplayIndice.Enabled := true;
     end;
    end
    else
       TimerReplayindice.Enabled := (not DmPrincipal.sqlReplayIndice.Eof) and (not meta_atingida[idxAtivo(ativo)]);

end;


procedure TfrmPrincipal.TimerSomenteCapturaDolarTimer(Sender: TObject);
begin
    TimerSomenteCapturaDolar.Enabled := false;
    CapturarDados(DOLFUT);
    TimerSomenteCapturaDolar.Enabled := True;
end;

procedure TfrmPrincipal.TimerSomenteCapturaIndiceTimer(Sender: TObject);
begin
    TimerSomenteCapturaIndice.Enabled := false;
    CapturarDados(INDFUT);
    TimerSomenteCapturaIndice.Enabled := True;
end;

procedure TfrmPrincipal.timerInicioDolarTimer(Sender: TObject);
var
  ativo : string;
begin
  ativo := DOLFUT;
  if IncHour(trunc(now),9) < now then
  begin
    registrar_log(ativo, 'Inciando...' );
    registrar_log(ativo, DateTimetoStr(now));
    registrar_log(ativo, '' );
    timerInicioDolar.Enabled := False;
    btnIniciarDolar.Enabled := True;
    setupBotaoes(ativo);
    btnIniciarDolarClick(self);
  end;
end;

procedure TfrmPrincipal.timerInicioIndiceTimer(Sender: TObject);
var
  ativo : string;
begin
  ativo := INDFUT;
  if IncHour(trunc(now),9) < now then
  begin
    registrar_log(ativo, 'Inciando...' );
    registrar_log(ativo, DateTimetoStr(now));
    registrar_log(ativo, '' );
    timerInicioIndice.Enabled := False;
    btnIniciarIndice.Enabled := true;
    setupBotaoes(ativo);
    btnIniciarIndiceClick(self);
  end;
end;

procedure TfrmPrincipal.metaAtingida(ativo : string; data_hora : TDateTime);
var
 texto : string;
begin
  if not meta_atingida[idxAtivo(ativo)] then
  begin
    meta_atingida[idxAtivo(ativo)] := true;
    texto := 'Meta de ' + floattostrF(meta[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' ATINGIDA com ' +
             floattostrF(pontos_acumulados[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ' + inttostr(cont_operacoes[idxAtivo(ativo)]) + ' oper - ' +
             FormatDateTime('hh:nn', data_hora);
    registrar_log(ativo, texto);
    registrar_log(ativo,'Oper.(+): ' + inttostr(cont_operacoes_positivas[idxAtivo(ativo)]) + '     Oper.(-): ' + inttostr(cont_operacoes_negativas[idxAtivo(ativo)]));

    if ativo = DOLFUT then
    begin
      lblmetaAtingidaDolar.Text := texto;
      recmetaAtingidaDolar.Fill.Color := claBlue;
      chkOperarPitDolar.IsChecked := false;
      btnReplayDolar.Enabled := true;
      AniIndicatorDolar.Enabled := False;
      btnPararDolarClick(self);

      if (pontos_acumulados[idxAtivo(INDFUT)] >= 0) and (btnPararIndice.Enabled) then
      begin
        meta[idxAtivo(INDFUT)] := pontos_acumulados[idxAtivo(INDFUT)];
        metaAtingida(INDFUT, data_hora);
      end;

    end
    else
    begin
      lblmetaAtingidaIndice.Text := texto;
      recmetaAtingidaIndice.Fill.Color := claBlue;
      chkOperarPitIndice.IsChecked := false;
      btnReplayIndice.Enabled := true;
      AniIndicatorIndice.Enabled := False;
      btnPararIndiceClick(self);

      if (pontos_acumulados[idxAtivo(DOLFUT)] >=0) and  (btnPararDolar.Enabled) then
      begin
        meta[idxAtivo(DOLFUT)] := pontos_acumulados[idxAtivo(INDFUT)];
        metaAtingida(DOLFUT, data_hora);
      end;
    end;

    if analisando[idxAtivo(ativo)] then
    begin
      registrar_resultado(ativo,data_hora_inicio[idxAtivo(ativo)], cont_operacoes_positivas[idxAtivo(ativo)],cont_operacoes_negativas[idxAtivo(ativo)], pontos_acumulados[idxAtivo(ativo)]);
      registrar_log(ativo, '');
      registrar_log(ativo, 'Somente capturando...');
      registrar_log(ativo, '');
      if ativo = DOLFUT then
      begin
        TimerSomenteCapturaDolar.Enabled := True;
        AniIndicatorDolar.Enabled := True;
        setupBotaoes(ativo);
      end
      else
      begin
        TimerSomenteCapturaIndice.Enabled := True;
        AniIndicatorIndice.Enabled := True;
        setupBotaoes(ativo);
      end;
    end
    else
    begin
       TDialogServiceAsync.MessageDialog( 'Gravar resultado?', TMsgDlgType.mtConfirmation,
                                           [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0,
             procedure(const AResult: TModalResult)
             begin
               case AResult of
                 mrYES : registrar_resultado(ativo,data_hora_inicio[idxAtivo(ativo)],
                                             cont_operacoes_positivas[idxAtivo(ativo)],
                                             cont_operacoes_negativas[idxAtivo(ativo)],
                                             pontos_acumulados[idxAtivo(ativo)]);
               end;
             end);
    end;
  end;

end;

procedure TfrmPrincipal.ajusteMeta(ativo : string);
begin
   if (cont_operacoes[idxAtivo(ativo)] = qtd_operacoes_ajuste_meta[idxAtivo(ativo)]) and (pontos_acumulados[idxAtivo(ativo)] < meta[idxAtivo(ativo)])  then
   begin
     registrar_log(ativo, '');
     registrar_log(ativo, 'Reduzindo metas em ' + FloattoStr(percentual_ajuste_meta[idxAtivo(ativo)]) + '%');
     registrar_log(ativo, '');
     meta[idxAtivo(ativo)] := meta[idxAtivo(ativo)] * (percentual_ajuste_meta[idxAtivo(ativo)]/100);
     stop_loss_operacao[idxAtivo(ativo)] := stop_loss_operacao[idxAtivo(ativo)] * (percentual_ajuste_meta[idxAtivo(ativo)]/100);
   end;
end;

procedure TfrmPrincipal.Comprar(ativo : string; data_hora : TDateTime);
var
 resultado : double;
 executarOrdem : Boolean;
begin

  if ativo = DOLFUT then
    executarOrdem := chkExecOrdensDolar.IsChecked
  else
    executarOrdem := chkExecOrdensIndice.IsChecked;

  executarOrdem:= executarOrdem and ((dentro_oscilacao[idxAtivo(ativo)] and (considera_oscilacao[idxAtivo(ativo)] = 1))
                                      or
                                      (considera_oscilacao[idxAtivo(ativo)] = 0));

  if (executarOrdem) or (posicao[idxAtivo(ativo)] <> 0) then
  begin
    resultado := 0;

    if Assigned(FMXWindowParent) then
    begin
       if ((chkOperarPitDolar.IsChecked) and (ativo = DOLFUT)) or
          ((chkOperarPitIndice.IsChecked) and (ativo = INDFUT)) then
       begin
          SelecionarAtivoNoPit(ativo);
          ComprarNoPit(ativo);
       end;
    end;

    ultimo_lucro_perda[idxAtivo(ativo)] := 9999;

    posicao[idxAtivo(ativo)] := posicao[idxAtivo(ativo)] + 1;
    preco_compra[idxAtivo(ativo)] := preco_para_compra[idxAtivo(ativo)];
    preco_compra_ref[idxAtivo(ativo)] := preco_para_compra[idxAtivo(ativo)];
    registrar_log(ativo,'');
    if ativo = DOLFUT then
       registrar_log(ativo, lblSituacaoDolar.Text)
    else
       registrar_log(ativo, lblSituacaoIndice.Text);
    registrar_log(ativo, FloatToStrF(preco_compra[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ' + 'COMPRAR');
    if posicao[idxAtivo(ativo)] = 0 then
    begin
       ultima_op_stop_loss[idxAtivo(ativo)] := 'X';
       if ativo = DOLFUT then
           stop_loss[idxAtivo(ativo)] := strToFloat(lerIni('dolar','stop_loss_DOLFUT'))
       else
           stop_loss[idxAtivo(ativo)] := strToFloat(lerIni('indice','stop_loss_INDFUT'));

       addmovimento(ativo, 'Z');
       resultado := preco_venda[idxAtivo(ativo)]-preco_compra[idxAtivo(ativo)];
       registrar_log(ativo, 'Resultado: ' + FloatToStrF(resultado, ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ' + IntToStr(minutesbetween(data_hora_ultima_ordem[idxAtivo(ativo)],data_hora)) + ' min.');
       pontos_acumulados[idxAtivo(ativo)] := pontos_acumulados[idxAtivo(ativo)] + (preco_venda[idxAtivo(ativo)]-preco_compra[idxAtivo(ativo)]);
       cont_operacoes[idxAtivo(ativo)] := cont_operacoes[idxAtivo(ativo)] + 1;
       if resultado > 0 then
          cont_operacoes_positivas[idxAtivo(ativo)] := cont_operacoes_positivas[idxAtivo(ativo)] + 1
       else
          cont_operacoes_negativas[idxAtivo(ativo)] := cont_operacoes_negativas[idxAtivo(ativo)] + 1;
       MomentoOrdem(ativo, FloatToStrF(preco_compra[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ZERADO - ' + inttostr(cont_operacoes[idxAtivo(ativo)]) + ' oper ', pontos_acumulados[idxAtivo(ativo)]);
       data_hora_ultima_operacao[idxAtivo(ativo)] := data_hora;

       if ativo = DOLFUT then
         lblDataHoraOrdemDolar.text:=  '  Última operação Dólar: ' + FormatDateTime('hh:nn',data_hora)
       else
         lblDataHoraOrdemIndice.text:=  '  Última operação Índice: ' + FormatDateTime('hh:nn',data_hora);

       ajusteMeta(ativo);

       if (pontos_acumulados[idxAtivo(ativo)] >= meta[idxAtivo(ativo)]) or
          ((cont_operacoes[idxAtivo(ativo)] = 1) and (pontos_acumulados[idxAtivo(ativo)] >= stop_gain[idxAtivo(ativo)]) and (meta_inicial_stop_gain[idxAtivo(ativo)] = 1)) then
       begin
          metaAtingida(ativo, data_hora);
       end
       else
       begin
         if ativo = DOLFUT then
         begin
           if (pontos_acumulados[idxAtivo(DOLFUT)] >= 0) and (meta_atingida[idxAtivo(INDFUT)]) then
           begin
             meta[idxAtivo(DOLFUT)] := pontos_acumulados[idxAtivo(DOLFUT)];
             metaAtingida(DOLFUT, data_hora);
           end
           else
           if (pontos_acumulados[idxAtivo(INDFUT)] >= 0) and (meta_atingida[idxAtivo(DOLFUT)])  then
           begin
             meta[idxAtivo(INDFUT)] := pontos_acumulados[idxAtivo(INDFUT)];
             metaAtingida(INDFUT, data_hora);
           end
         end;
       end;
    end
    else
      MomentoOrdem(ativo, FloatToStrF(preco_compra[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - COMPRADO - ' + inttostr(cont_operacoes[idxAtivo(ativo)]) + ' oper ', pontos_acumulados[idxAtivo(ativo)]);

    desenhaOperacao(ativo, x[idxAtivo(ativo)],y[idxAtivo(ativo)], resultado, false);

    registrar_log(ativo, '');
    data_hora_ultima_ordem[idxAtivo(ativo)] := data_hora;
  end;
end;

procedure TfrmPrincipal.Vender(ativo : string; data_hora : TDateTime);
var
 resultado : double;
 executarOrdem : Boolean;
begin

  if ativo = DOLFUT then
    executarOrdem := chkExecOrdensDolar.IsChecked
  else
    executarOrdem := chkExecOrdensIndice.IsChecked;

  executarOrdem:= executarOrdem and ((dentro_oscilacao[idxAtivo(ativo)] and (considera_oscilacao[idxAtivo(ativo)] = 1))
                                      or
                                      (considera_oscilacao[idxAtivo(ativo)] = 0));

  if (executarOrdem) or (posicao[idxAtivo(ativo)] <> 0) then
  begin
    resultado := 0;

    if Assigned(FMXWindowParent) then
    begin
       if ((chkOperarPitDolar.IsChecked) and (ativo = DOLFUT)) or
          ((chkOperarPitIndice.IsChecked) and (ativo = INDFUT)) then
       begin
          SelecionarAtivoNoPit(ativo);
          VenderNoPit(ativo);
       end;
    end;

    ultimo_lucro_perda[idxAtivo(ativo)] := 9999;

    posicao[idxAtivo(ativo)] := posicao[idxAtivo(ativo)] - 1;
    preco_venda[idxAtivo(ativo)] := preco_para_venda[idxAtivo(ativo)];
    preco_venda_ref[idxAtivo(ativo)] := preco_para_venda[idxAtivo(ativo)];
    registrar_log(ativo,'');
    if ativo = DOLFUT then
       registrar_log(ativo, lblSituacaoDolar.Text)
    else
       registrar_log(ativo, lblSituacaoIndice.Text);
    registrar_log(ativo, FloatToStrF(preco_venda[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ' + 'VENDER');
    if posicao[idxAtivo(ativo)] = 0 then
    begin
       ultima_op_stop_loss[idxAtivo(ativo)] := 'X';
       if ativo = DOLFUT then
           stop_loss[idxAtivo(ativo)] := strToFloat(lerIni('dolar','stop_loss_DOLFUT'))
       else
           stop_loss[idxAtivo(ativo)] := strToFloat(lerIni('indice','stop_loss_INDFUT'));

       addmovimento(ativo, 'Z');
       resultado := preco_venda[idxAtivo(ativo)]-preco_compra[idxAtivo(ativo)];
       registrar_log(ativo, 'Resultado: ' + FloatToStrF(resultado, ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ' + IntToStr(minutesbetween(data_hora_ultima_ordem[idxAtivo(ativo)],data_hora)) + ' min.');
       pontos_acumulados[idxAtivo(ativo)] := pontos_acumulados[idxAtivo(ativo)] + (preco_venda[idxAtivo(ativo)]-preco_compra[idxAtivo(ativo)]);
       cont_operacoes[idxAtivo(ativo)] := cont_operacoes[idxAtivo(ativo)] + 1;
       if resultado > 0 then
          cont_operacoes_positivas[idxAtivo(ativo)] := cont_operacoes_positivas[idxAtivo(ativo)] + 1
       else
          cont_operacoes_negativas[idxAtivo(ativo)] := cont_operacoes_negativas[idxAtivo(ativo)] + 1;
       MomentoOrdem(ativo, FloatToStrF(preco_venda[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - ZERADO - ' + inttostr(cont_operacoes[idxAtivo(ativo)]) + ' oper ', pontos_acumulados[idxAtivo(ativo)]);
       data_hora_ultima_operacao[idxAtivo(ativo)] := data_hora;

       if ativo = DOLFUT then
         lblDataHoraOrdemDolar.text:=  '  Última operação Dólar: ' + FormatDateTime('hh:nn',data_hora)
       else
         lblDataHoraOrdemIndice.text:=  '  Última operação Índice: ' + FormatDateTime('hh:nn',data_hora);

       ajusteMeta(ativo);

       if (pontos_acumulados[idxAtivo(ativo)] >= meta[idxAtivo(ativo)])  or
          ((cont_operacoes[idxAtivo(ativo)] = 1) and (pontos_acumulados[idxAtivo(ativo)] >= stop_gain[idxAtivo(ativo)]) and (meta_inicial_stop_gain[idxAtivo(ativo)] = 1)) then
       begin
          metaAtingida(ativo, data_hora);
       end
       else
       begin
         if ativo = DOLFUT then
         begin
           if (pontos_acumulados[idxAtivo(DOLFUT)] >= 0) and (meta_atingida[idxAtivo(INDFUT)]) then
           begin
             meta[idxAtivo(DOLFUT)] := pontos_acumulados[idxAtivo(DOLFUT)];
             metaAtingida(DOLFUT, data_hora);
           end
           else
           if (pontos_acumulados[idxAtivo(INDFUT)] >= 0) and (meta_atingida[idxAtivo(DOLFUT)])  then
           begin
             meta[idxAtivo(INDFUT)] := pontos_acumulados[idxAtivo(INDFUT)];
             metaAtingida(INDFUT, data_hora);
           end
         end;
       end;
    end
    else
        MomentoOrdem(ativo, FloatToStrF(preco_venda[idxAtivo(ativo)], ffNumber, 15,DIGITOS[idxAtivo(Ativo)]) + ' - VENDIDO - ' + inttostr(cont_operacoes[idxAtivo(ativo)]) + ' oper ', pontos_acumulados[idxAtivo(ativo)]);

    desenhaOperacao(ativo,x[idxAtivo(ativo)],y[idxAtivo(ativo)], resultado, false);

    registrar_log(ativo, '');
    data_hora_ultima_ordem[idxAtivo(ativo)] := data_hora;
  end;
end;


procedure TfrmPrincipal.DoBrowserCreated;
begin
  // Now the browser is fully initialized
  pnlPitNegociacao.Enabled := True;
end;

procedure TfrmPrincipal.DoDestroyParent;
begin
  if (FMXWindowParent <> nil) then FreeAndNil(FMXWindowParent);
end;

procedure TfrmPrincipal.SelecionarAtivoNoPit(ativo : string);
var
 s, codAtivo : string;
 frame: ICefFrame;
begin
  if Assigned(FMXChromium.Browser) then
  begin
    frame := FMXChromium.Browser.GetFrame('content-page');
    if Assigned(frame) then
    begin
      if ativo = DOLFUT then
         codAtivo := '1'
      else
         codAtivo := '2';
      s := 'document.querySelector('#39'body > div.site.iframe > div > main > section.left > div.Ativos > div.list.scrollable.ps.large > ul > li:nth-child(' + codAtivo + ')'#39').click()';
      frame.ExecuteJavaScript(s, frame.Url, 0);
    end;
    sleep(700);
  end;
end;

procedure TfrmPrincipal.ComprarNoPit(ativo : string);
var
 s: string;
 frame: ICefFrame;
begin
  aplicarQtdNoPit(ativo);
  s := 'document.getElementsByClassName('#39'cont-bt-fast buy'#39')[0].click();';
  frame := FMXChromium.Browser.GetFrame('content-page');
  frame.ExecuteJavaScript(s, frame.Url, 0);
end;

procedure TfrmPrincipal.VenderNoPit(ativo : string);
var
 s: string;
 frame: ICefFrame;
begin
  aplicarQtdNoPit(ativo);
  s := 'document.getElementsByClassName('#39'cont-bt-fast sell'#39')[0].click();';
  frame := FMXChromium.Browser.GetFrame('content-page');
  frame.ExecuteJavaScript(s, frame.Url, 0);
end;


function TfrmPrincipal.LerIni(secao, parametro : string) : string;
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create( System.SysUtils.GetCurrentDir+'\remora.ini' );
  try
    result := ArqIni.ReadString(secao, parametro, '');
  finally
    ArqIni.Free;
  end;
end;

procedure TfrmPrincipal.GravarIni(secao, parametro, valor : string);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create( System.SysUtils.GetCurrentDir+'\remora.ini' );
  try
    ArqIni.WriteString(secao, parametro, valor);
  finally
    ArqIni.Free;
  end;
end;


end.
