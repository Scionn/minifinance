unit mainform_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBGrids, StdCtrls, DbCtrls, DBExtCtrls, conti_frm,
  ZDataset, ZSqlUpdate, ZConnection,  estrattoconto_frm,
  affidamenti_frm, windows, Grids;

type

  { Tmainform }

  Tmainform = class(TForm)
    btconti: TButton;
    btconti1: TButton;
    btfidi: TButton;
    bteccontocorrente: TButton;
    btoperazionifuture: TButton;
    dbchpresunto: TDBCheckBox;
    dsfidi: TDataSource;
    dsaffidamenti: TDataSource;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    dbchriconciliato: TDBCheckBox;
    dbeddataop: TDBDateEdit;
    dbeddataval: TDBDateEdit;
    dbeddescrizione: TDBEdit;
    dbedentrate: TDBEdit;
    dbeduscite: TDBEdit;
    dbcbcontocorrente: TDBLookupComboBox;
    dbcbcontocorrentefiltro: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    dblbidmovimento: TDBText;
    ds1: TDataSource;
    dbgridmovimenti: TDBGrid;
    dsconti: TDataSource;
    dstipoaffidamento: TDataSource;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    zc1: TZConnection;
    zq1: TZQuery;
    zqconti: TZQuery;
    zqaffidamenti: TZQuery;
    zqtipoaffidamento: TZQuery;
    zqfidi: TZQuery;
    zup1: TZUpdateSQL;
    zupconti: TZUpdateSQL;
    zupaffidamenti: TZUpdateSQL;
    zupfidi: TZUpdateSQL;
    zuptipoaffidamento: TZUpdateSQL;
    procedure btcontiClick(Sender: TObject);
    procedure bteccontocorrenteClick(Sender: TObject);
    procedure btfidiClick(Sender: TObject);
    procedure dbgridmovimentiPrepareCanvas(sender: TObject; DataCol: Integer;
      Column: TColumn; AState: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure GetBuildInfo(var V1, V2, V3, V4: Word);
    function kfVersionInfo: String;
    procedure zq1AfterRefresh(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  mainform: Tmainform;

implementation

{$R *.lfm}

{ Tmainform }

procedure Tmainform.GetBuildInfo(var V1, V2, V3, V4: Word);
var
   VerInfoSize, VerValueSize, Dummy : DWORD;
   VerInfo : Pointer;
   VerValue : PVSFixedFileInfo;
begin
VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
GetMem(VerInfo, VerInfoSize);
GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
With VerValue^ do
begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
end;
FreeMem(VerInfo, VerInfoSize);
end;






function Tmainform.kfVersionInfo: String;
var
  V1,       // Major Version
  V2,       // Minor Version
  V3,       // Release
  V4: Word; // Build Number
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.'
            + IntToStr(V2) + '.'
            + IntToStr(V3) + '.'
            + IntToStr(V4);
end;

procedure Tmainform.zq1AfterRefresh(DataSet: TDataSet);
begin
   zq1.Refresh;
end;

procedure Tmainform.btcontiClick(Sender: TObject);
begin
  conti:=Tconti.Create(self);
  conti.showmodal;
  zqconti.close;
  zqconti.open;
  zq1.close;
  zq1.open;
end;

procedure Tmainform.bteccontocorrenteClick(Sender: TObject);
begin
  if dbcbcontocorrentefiltro.ItemIndex = -1 then
     begin
       ShowMessage('Selezionare un conto');
       Exit;
     end;
    estrattoconto:=Testrattoconto.Create(self);
    estrattoconto.zqec.parambyname('CONTO').asinteger:=dbcbcontocorrentefiltro.KeyValue;
    estrattoconto.zqec.open;
    estrattoconto.lbconto.Caption:='Conto corrente n.: ' + dbcbcontocorrentefiltro.Text;
    estrattoconto.showmodal;
end;

procedure Tmainform.btfidiClick(Sender: TObject);
begin
  affidamenti:=Taffidamenti.Create(self);
  affidamenti.showmodal;
  zqaffidamenti.Refresh;
  zq1.Refresh;
end;

procedure Tmainform.dbgridmovimentiPrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin

//controllo se il record è presunto o meno
if zq1.FieldByName('presunto').AsBoolean then
   with sender as TDBGrid do
               begin
                    Canvas.Brush.Color:=clYellow;
               end
//quindi se è riconciliato
else if zq1.FieldByName('riconciliato').AsBoolean then
   with sender as TDBGrid do
               begin
                    Canvas.Brush.Color:=clMoneyGreen;
               end;
end;



procedure Tmainform.FormShow(Sender: TObject);
begin
  //apro i dataset che mi servono
  zqconti.Open;
  zq1.open;
  zqaffidamenti.Open;
  zqtipoaffidamento.open;
  zqfidi.open;
  //metto la versione sopra nella barra
  mainform.Caption:='Minifinance v' + kfVersionInfo;
end;




end.

