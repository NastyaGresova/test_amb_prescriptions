function Test9()     // отменить назначение  (с комментарием)
{

var w0;    
w0=Sys.Process("Automedi");

// грид:
var w1 = Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TPatDocControl_935A08B5B8DF4F818224FADDDC3642E2.TPageControl.TTabSheet.PatDrugDocAmbForm.pGrid.GridPanel.Grid; 

// тулбар для грида с назначениями
w2 = Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TPatDocControl_935A08B5B8DF4F818224FADDDC3642E2.TPageControl.TTabSheet.PatDrugDocAmbForm.VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBar")

w1.VScroll.Pos = 4; 

delay(3000);

 //кнопка для отмены ранее назначенного
w2.VCLObject("TToolButton_7").Click();

// подтверждение перед отменой:
w3 = Aliases.Automedi.Window("TMessageForm", "Подтверждение", 1)
w3.VCLObject("Yes").Click(); 

// окошко для комментария:
w4 = Aliases.Automedi.VCLObject("fInputQ");
w4.VCLObject("Edit1").Keys("тест123TEST!@#$%)(_");
w4.VCLObject("bOk").Click();




}