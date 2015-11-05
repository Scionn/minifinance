unit datamodule_frm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, ZConnection, ZDataset, ZSqlUpdate;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    dsfiditipofido: TDataSource;
    ds1: TDataSource;
    dsaffidamenti: TDataSource;
    dsconti: TDataSource;
    dsfidi: TDataSource;
    dstipoaffidamento: TDataSource;
    zc1: TZConnection;
    zq1: TZQuery;
    zqaffidamenti: TZQuery;
    zqconti: TZQuery;
    zqfidi: TZQuery;
    zqtipoaffidamento: TZQuery;
    zqfiditipofido: TZQuery;
    zup1: TZUpdateSQL;
    zupaffidamenti: TZUpdateSQL;
    zupconti: TZUpdateSQL;
    zupfiditipofido: TZUpdateSQL;
    zupfidi: TZUpdateSQL;
    zuptipoaffidamento: TZUpdateSQL;
    procedure zq1AfterRefresh(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}


procedure Tdatamodule1.zq1AfterRefresh(DataSet: TDataSet);
begin
   zq1.Refresh;
end;

end.

