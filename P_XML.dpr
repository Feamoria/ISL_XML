program P_XML;

uses
  only_one,
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  R_FM in 'R_FM.pas' {FM_Rastvor},
  Mass in 'Mass.pas' {Mass_FM},
  Metod_unit in 'Metod_unit.pas' {Metod_FM},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}
const
  UniqueString = 'XML_LOADER';

begin
  if not init_mutex(UniqueString) then
    exit;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFM_Rastvor, FM_Rastvor);
  Application.CreateForm(TMass_FM, Mass_FM);
  Application.CreateForm(TMetod_FM, Metod_FM);
  Application.Run;
end.

