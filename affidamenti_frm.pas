unit affidamenti_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZDataset, ZSqlUpdate, Forms, Controls,
  Graphics, Dialogs, DBGrids, ExtCtrls, StdCtrls, DbCtrls, DBExtCtrls;

type

  { TAffidamenti }

  TAffidamenti = class(TForm)
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    DBDateEdit5: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBNavigator1: TDBNavigator;
    DBText1: TDBText;
    DBText2: TDBText;
    dsaff: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbaffidamenti: TLabel;
    Panel1: TPanel;
    zqaff: TZQuery;
    zupaff: TZUpdateSQL;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Affidamenti: TAffidamenti;

implementation

{$R *.lfm}

end.

