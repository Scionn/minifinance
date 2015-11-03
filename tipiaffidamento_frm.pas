unit tipiaffidamento_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, DbCtrls, DBGrids;

type

  { Ttipiaffidamento }

  Ttipiaffidamento = class(TForm)
<<<<<<< HEAD
=======
    dbchfido2: TDBCheckBox;
>>>>>>> 2ac5b01efa4eeec6039ea3efba2a8455d156af84
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

