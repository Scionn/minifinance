program minifinance_prj;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, mainform_frm, zcomponent, CONTI_FRM, estrattoconto_frm,
  datetimectrls, affidamenti_frm, tipiaffidamento_frm
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(Tmainform, mainform);
  Application.Run;
end.

