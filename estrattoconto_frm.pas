unit estrattoconto_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, KDBGrids, ZDataset, ZSqlUpdate, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, DBGrids, StdCtrls, DbCtrls;

type

  { Testrattoconto }

  Testrattoconto = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dsec: TDataSource;
    lbconto: TLabel;
    lbsaldo: TLabel;
    Panel1: TPanel;
    zqec: TZQuery;
    zqecDATAOP: TDateField;
    zqecDATAVAL: TDateField;
    zqecDESCRIZIONE: TStringField;
    zqecENTRATE: TFloatField;
    zqecRICONCILIATO: TSmallintField;
    zqecsaldo1: TCurrencyField;
    zqecUSCITE: TFloatField;
    zupec: TZUpdateSQL;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure zqecAfterOpen(DataSet: TDataSet);
    procedure zqecCalcFields(DataSet: TDataSet);
  private
    { private declarations }
    saldo:Currency;
  public
    { public declarations }
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

procedure Testrattoconto.Button1Click(Sender: TObject);
begin
  zqec.CommitUpdates;
end;



procedure Testrattoconto.FormShow(Sender: TObject);
begin
  saldo:=0;
end;



procedure Testrattoconto.zqecAfterOpen(DataSet: TDataSet);
begin
  lbsaldo.caption:='Saldo conto corrente: ' + FormatCurr('€ #,##0.00',saldo);
end;

procedure Testrattoconto.zqecCalcFields(DataSet: TDataSet);
begin
    zqec.FieldByName('saldo').AsCurrency:=zqec.FieldByName('entrate').AsCurrency-zqec.FieldByName('uscite').AsCurrency+saldo;
  saldo:=zqec.FieldByName('saldo').AsCurrency;
end;

end.

