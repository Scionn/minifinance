unit anagtipiaffidamento_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, DbCtrls, DBGrids, datamodule_frm;

type

  { Tanagtipiaffidamento }

  Tanagtipiaffidamento = class(TForm)
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
  anagtipiaffidamento: Tanagtipiaffidamento;

implementation

{$R *.lfm}

{ Tanagtipiaffidamento }

procedure Tanagtipiaffidamento.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:=cafree;
end;


end.

