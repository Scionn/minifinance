unit CONTI_FRM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, Forms, Controls,
  Graphics, Dialogs, DbCtrls, StdCtrls, ExtCtrls, DBGrids;

type

  { TConti }

  TConti = class(TForm)
    dbedabi: TDBEdit;
    dbedcab: TDBEdit;
    dbedcin: TDBEdit;
    dbeddescrizione: TDBEdit;
    dbedfiliale: TDBEdit;
    dbediban: TDBEdit;
    dbednumero: TDBEdit;
    dbedreferente: TDBEdit;
    dbgridconti: TDBGrid;
    dblbidconto: TDBText;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
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
  Conti: TConti;

implementation

{$R *.lfm}

{ TConti }


procedure TConti.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  closeAction:=caFree;
end;

end.

