unit anagCONTI_FRM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, Forms, Controls,
  Graphics, Dialogs, DbCtrls, StdCtrls, ExtCtrls, DBGrids, datamodule_frm;

type

  { Tanagconti }

  Tanagconti = class(TForm)
    dbedabi: TDBEdit;
    dbedcab: TDBEdit;
    dbedcin: TDBEdit;
    dbeddescrizione: TDBEdit;
    dbedfiliale: TDBEdit;
    dbediban: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    dbednumero: TDBEdit;
    dbedreferente: TDBEdit;
    dbgridconti: TDBGrid;
    dblbidconto: TDBText;
    DBMemo1: TDBMemo;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  anagconti: Tanagconti;

implementation

{$R *.lfm}

{ Tanagconti }


procedure Tanagconti.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  closeAction:=caFree;
end;



end.

