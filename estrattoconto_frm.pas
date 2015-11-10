unit estrattoconto_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, ZDataset, ZSqlUpdate, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, DBGrids, StdCtrls, DbCtrls, Grids;

type

  { Testrattoconto }

  Testrattoconto = class(TForm)
    btrefresh: TButton;
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
    zqecGENERATO: TSmallintField;
    zqecPRESUNTO: TSmallintField;
    zqecRICONCILIATO: TSmallintField;
    zqecsaldo1: TCurrencyField;
    zqecUSCITE: TFloatField;
    zqrsaldi: TZReadOnlyQuery;
    zqrsaldientrate: TFloatField;
    zqrsaldisaldo1: TCurrencyField;
    zqrsaldiuscite: TFloatField;
    zupec: TZUpdateSQL;
    procedure btrefreshClick(Sender: TObject);
    procedure DBGrid1PrepareCanvas(sender: TObject; DataCol: Integer;
      Column: TColumn; AState: TGridDrawState);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure zqecAfterOpen(DataSet: TDataSet);
    procedure zqecCalcFields(DataSet: TDataSet);
    procedure zqrsaldiAfterOpen(DataSet: TDataSet);
    procedure zqrsaldiCalcFields(DataSet: TDataSet);
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
  //cambio il colore della riga in base al tipo di record
  if zqec.FieldByName('presunto').AsBoolean then
     with sender as TDBGrid do
                 begin
                      Canvas.Brush.Color:=clSkyBlue;
                 end
  //quindi se è riconciliato
  else if zqec.FieldByName('riconciliato').AsBoolean then
     with sender as TDBGrid do
                 begin
                      Canvas.Brush.Color:=clMoneyGreen;
                 end
  else if zqec.FieldByName('generato').AsBoolean then
     with sender as TDBGrid do
                 begin
                      Canvas.Brush.Color:=clOlive;
                 end;
end;



procedure Testrattoconto.btrefreshClick(Sender: TObject);
begin
  zqec.Close;
  zqec.Open;
end;



procedure Testrattoconto.FormShow(Sender: TObject);
begin
//carico i parametri e apro il dataset
zqec.parambyname('CONTO').asinteger:=IDCONTO;
zqec.parambyname('DATADA').AsDate:=DATADA;
zqec.parambyname('DATAA').AsDate:=dataa;
zqrsaldi.parambyname('CC').asinteger:=IDCONTO;
zqrsaldi.parambyname('DATADA').AsDate:=DATADA;
lbconto.Caption:='Conto corrente n.: ' + conto;
//azzero il saldo iniziale
saldoin:=0;
//apro il dataset che calcola il saldo iniziale
zqrsaldi.Open;
zqec.open;

end;

procedure Testrattoconto.zqrsaldiCalcFields(DataSet: TDataSet);
begin
  //per ogni record calcolo ils aldo parziale
    zqrsaldi.FieldByName('saldo').AsCurrency:=zqrsaldi.FieldByName('entrate').AsCurrency-zqrsaldi.FieldByName('uscite').AsCurrency;
    //e lo sommo al saldo iniziale calcolato
    saldoin:=zqrsaldi.FieldByName('saldo').AsCurrency+saldoin;
end;

procedure Testrattoconto.zqrsaldiAfterOpen(DataSet: TDataSet);
begin
//quindi riporto il saldo iniziale sulla form e allineo saldo da cui partirà la visualizzazione della tabella
  lbsaldoin.caption:='Saldo iniziale: ' + FormatCurr('€ #,##0.00',saldoin);
  saldo:=saldoin;
end;


procedure Testrattoconto.zqecCalcFields(DataSet: TDataSet);
begin
//ad ogni record sommo il saldo al precedente valore per ottenere lo scalare
    zqec.FieldByName('saldo').AsCurrency:=zqec.FieldByName('entrate').AsCurrency-zqec.FieldByName('uscite').AsCurrency+saldo;
    //e aggiorno la variabile saldo
  saldo:=zqec.FieldByName('saldo').AsCurrency;
end;

procedure Testrattoconto.zqecAfterOpen(DataSet: TDataSet);
begin
//riporto ils aldo sulla form
  lbsaldofin.caption:='Saldo finale: ' + FormatCurr('€ #,##0.00',saldo);
  //e poi reinizializzo la variabile per un eventuale riconteggio
  saldo:=saldoin;
end;







end.

