unit tipiaffidamento_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, DbCtrls, DBGrids, datamodule_frm;

type

  { Ttipiaffidamento }

  Ttipiaffidamento = class(TForm)
    dbeddescrizione: TDBEdit;
    DBGridtipoaffidamento: TDBGrid;
    DBNavigator1: TDBNavigator;
    dblbidtipo: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  tipiaffidamento: Ttipiaffidamento;

implementation

{$R *.lfm}

{ Ttipiaffidamento }

procedure Ttipiaffidamento.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:=cafree;
end;

end.

