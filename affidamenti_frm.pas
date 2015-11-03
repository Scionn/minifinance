unit affidamenti_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, Forms, Controls,
<<<<<<< HEAD
  Graphics, Dialogs, ExtCtrls, DbCtrls, StdCtrls, DBGrids, tipiaffidamento_frm, fidi_frm;
=======
  Graphics, Dialogs, ExtCtrls, DbCtrls, StdCtrls, DBGrids, tipiaffidamento_frm;
>>>>>>> 2ac5b01efa4eeec6039ea3efba2a8455d156af84

type

  { TAffidamenti }

  TAffidamenti = class(TForm)
    bttipofido: TButton;
<<<<<<< HEAD
    btfidi: TButton;
    dbcbcontocorrentefiltro: TDBLookupComboBox;
    dbeddescrizione: TDBEdit;
=======
    dbcbcontocorrentefiltro: TDBLookupComboBox;
    dbcbtipoaffido: TDBLookupComboBox;
    dbedfido2: TDBEdit;
    dbeddescrizione: TDBEdit;
    dbedfido: TDBEdit;
>>>>>>> 2ac5b01efa4eeec6039ea3efba2a8455d156af84
    dbednumero: TDBEdit;
    dbedreferente: TDBEdit;
    DBGridaffidamenti: TDBGrid;
    dblbidaffidamento: TDBText;
    DBNavigator1: TDBNavigator;
<<<<<<< HEAD
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    procedure btfidiClick(Sender: TObject);
=======
    dstipoaffidamento: TDataSource;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    zqtipoaffidamento: TZQuery;
    zuptipoaffidamento: TZUpdateSQL;
>>>>>>> 2ac5b01efa4eeec6039ea3efba2a8455d156af84
    procedure bttipofidoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Affidamenti: TAffidamenti;

implementation

{$R *.lfm}

{ TAffidamenti }

procedure TAffidamenti.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
    CloseAction:=cafree;
end;

<<<<<<< HEAD

=======
>>>>>>> 2ac5b01efa4eeec6039ea3efba2a8455d156af84
procedure TAffidamenti.bttipofidoClick(Sender: TObject);
begin
  tipiaffidamento:=Ttipiaffidamento.Create(self);
  tipiaffidamento.showmodal;
<<<<<<< HEAD

end;

procedure TAffidamenti.btfidiClick(Sender: TObject);
begin
  fidi:=Tfidi.Create(self);
  fidi.showmodal;
=======
  zqtipoaffidamento.close;
  zqtipoaffidamento.open;
>>>>>>> 2ac5b01efa4eeec6039ea3efba2a8455d156af84
end;

end.

