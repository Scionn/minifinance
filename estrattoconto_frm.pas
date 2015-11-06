unit estrattoconto_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, ZDataset, ZSqlUpdate, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, DBGrids, StdCtrls, DbCtrls, Grids, datamodule_frm;

type

  { Testrattoconto }

  Testrattoconto = class(TForm)
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dsec: TDataSource;
    lbsaldoin: TLabel;
    lbconto: TLabel;
    lbsaldofin: TLabel;
    Panel1: TPanel;
    zqec: TZQuery;
    zqecDATAOP: TDateField;
    zqecDATAVAL: TDateField;
    zqecDESCRIZIONE: TStringField;
    zqecENTRATE: TFloatField;
    zqecPRESUNTO: TSmallintField;
    zqecRICONCILIATO: TSmallintField;
    zqecsaldo1: TCurrencyField;
    zqecUSCITE: TFloatField;
    zupec: TZUpdateSQL;
    procedure DBGrid1PrepareCanvas(sender: TObject; DataCol: Integer;
      Column: TColumn; AState: TGridDrawState);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure zqecAfterOpen(DataSet: TDataSet);
    procedure zqecCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    saldo,saldoin:Currency;
  public
    { public declarations }
    IDCONTO:integer;
    DATAA, DATADA:TDate;
    conto:string;
  end;

var
  estrattoconto: Testrattoconto;

implementation

{$R *.lfm}

{ Testrattoconto }

procedure Testrattoconto.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:=cafree;
end;


procedure Testrattoconto.DBGrid1PrepareCanvas(sender: TObject;
  DataCol: Integer; Column: TColumn; AState: TGridDrawState);
begin
  //controllo se il record è presunto o meno
if zqec.FieldByName('presunto').AsBoolean then
   with sender as TDBGrid do
               begin
                    Canvas.Brush.Color:=clYellow;
               end
//quindi se è riconciliato
else if zqec.FieldByName('riconciliato').AsBoolean then
   with sender as TDBGrid do
               begin
                    Canvas.Brush.Color:=clMoneyGreen;
               end;
end;



procedure Testrattoconto.FormShow(Sender: TObject);
begin
//carico i parametri e apro il dataset
zqec.parambyname('CONTO').asinteger:=IDCONTO;
zqec.parambyname('DATADA').AsDate:=DATADA;
zqec.parambyname('DATAA').AsDate:=dataa;
lbconto.Caption:='Conto corrente n.: ' + conto;
//calcolo il saldo pregresso (avevo creato una stored procedures ma ho problemi di permessi...)
with DataModule1.zrq1 do
 begin
   close;
   sql.clear;
   sql.add('Select sum(movimenti.entrate - movimenti.uscite) as saldo  ');
   sql.add('from movimenti                                             ');
   sql.add('where movimenti.DATAOP < :DATADA                           ');
   sql.add('AND movimenti.IDCONTO = :CC                                ');
   ParamByName('DATADA').AsDate:=datada;
   ParamByName('CC').AsInteger:=IDCONTO;
   open;
   saldoin:=FieldByName('saldo').AsCurrency;
   lbsaldoin.Caption:='Saldo iniziale: ' + FormatCurr('€ #,##0.00',saldoin);
   saldo:=saldoin;
   close;
   sql.clear;
 end;
//aprio il dataset
 zqec.open;
end;



procedure Testrattoconto.zqecAfterOpen(DataSet: TDataSet);
begin
  lbsaldofin.caption:='Saldo finale: ' + FormatCurr('€ #,##0.00',saldo);
  saldo:=saldoin;
end;

procedure Testrattoconto.zqecCalcFields(DataSet: TDataSet);
begin
//ad ogni record sommo il saldo al precedente valore per ottenere lo scalare
    zqec.FieldByName('saldo').AsCurrency:=zqec.FieldByName('entrate').AsCurrency-zqec.FieldByName('uscite').AsCurrency+saldo;
  saldo:=zqec.FieldByName('saldo').AsCurrency;
end;

end.

