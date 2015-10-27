unit mainform_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, DBGrids, StdCtrls, DbCtrls, DBExtCtrls, conti_frm,
  ZDataset, ZSqlUpdate, datamodule_frm, estrattoconto_frm;

type

  { Tmainform }

  Tmainform = class(TForm)
    btconti: TButton;
    bteccontocorrente: TButton;
    btoperazionifuture: TButton;
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
    zqconti: TZQuery;
    zupconti: TZUpdateSQL;
    procedure btcontiClick(Sender: TObject);
    procedure bteccontocorrenteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label9Click(Sender: TObject);
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

procedure Tmainform.btcontiClick(Sender: TObject);
begin
  conti:=Tconti.Create(self);
  conti.showmodal;
  zqconti.Refresh;
  datamodule1.zq1.Refresh;
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





procedure Tmainform.FormShow(Sender: TObject);
begin
  //apro i dataset che mi servono
  zqconti.Open;
  datamodule1.zq1.open;
end;

procedure Tmainform.Label9Click(Sender: TObject);
begin

end;



end.

